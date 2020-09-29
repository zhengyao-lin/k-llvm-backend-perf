-- CAFEOBJ-A
mod! SoundnessOfParallelEngines {
  [ N ]
  op d0 : -> N { constr }
  op s : N -> N { constr }
  op g : N -> N { constr }
  op f : N -> N
  eq f (g (d0)) = d0 .
  eq f (g (s (X:N))) = f (g (X)) .
}
select SoundnessOfParallelEngines .
red f (g (s (d0))) .
