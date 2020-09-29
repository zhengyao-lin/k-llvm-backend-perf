ROOT := $(realpath .)

EVM_SEMANTICS_REPO = $(ROOT)/deps/evm-semantics
K_REPO = $(ROOT)/deps/k
GETH_REPO = $(ROOT)/deps/go-ethereum
OPENETHEREUM_REPO = $(ROOT)/deps/openethereum

KBIN = $(K_REPO)/k-distribution/bin
KOMPILE = $(KBIN)/kompile

.PHONY: deps
deps: k evm-semantics geth openethereum

# build k framework
.PHONY: k
k: $(KOMPILE)

$(KOMPILE): 
	cd $(K_REPO) && \
	git submodule update --init --recursive && \
	mvn package

# build evm-semantics using the llvm backend
.PHONY: evm-semantics
evm-semantics: $(EVM_SEMANTICS_REPO)/.build/defn/llvm/driver-kompiled/timestamp

$(EVM_SEMANTICS_REPO)/.build/defn/llvm/driver-kompiled/timestamp: k $(EVM_SEMANTICS_REPO)/*.md
	cd $(EVM_SEMANTICS_REPO) && \
	git submodule update --init --recursive -- deps/plugin && \
	make libff && \
	$(KOMPILE) \
		-O3 --backend llvm \
		--md-selector "k & (! ceil) & ( ( ! ( symbolic | nobytes ) ) | concrete | bytes   )" \
		--hook-namespaces "KRYPTO JSON" \
		-ccopt -L$(EVM_SEMANTICS_REPO)/.build/local/lib \
		-ccopt -I$(EVM_SEMANTICS_REPO)/.build/local/include \
		-ccopt -I$(K_REPO)/k-distribution/target/release/k/include/kllvm \
		-ccopt $(EVM_SEMANTICS_REPO)/deps/plugin/plugin-c/crypto.cpp \
		-ccopt $(EVM_SEMANTICS_REPO)/deps/plugin/plugin-c/blake2.cpp \
		-ccopt -g \
		-ccopt -std=c++14 \
		-ccopt -lff \
		-ccopt -lcryptopp \
		-ccopt -lsecp256k1 \
		-ccopt -lprocps \
		-ccopt -O3 \
		$(EVM_SEMANTICS_REPO)/driver.md \
		--directory $(EVM_SEMANTICS_REPO)/.build/defn/llvm \
		-I $(EVM_SEMANTICS_REPO) \
		--main-module ETHEREUM-SIMULATION \
		--syntax-module ETHEREUM-SIMULATION

# build geth (only the evm binary)
.PHONY: geth
geth: $(GETH_REPO)/cmd/evm

$(GETH_REPO)/cmd/evm:
	cd $(GETH_REPO) && \
	env GO111MODULE=on go run build/ci.go install cmd/evm

# build openethereum (only the evmbin tool)
.PHONY: openethereum
openethereum: $(OPENETHEREUM_REPO)/target/release/openethereum-evm

$(OPENETHEREUM_REPO)/target/release/openethereum-evm:
	cd $(OPENETHEREUM_REPO)/evmbin && \
	cargo build --release
