-- CAFEOBJ-B
mod! SoundnessOfParallelEngines {
  [ N ]
  op d0 : -> N { constr }
  op s : N -> N { constr }
  op g : N -> N { constr }
  op f : N -> N
  trans f (g (d0)) => d0 .
  trans f (g (s (X:N))) => f (g (X)) .
}
select SoundnessOfParallelEngines .
exec f (g (s (d0))) .
