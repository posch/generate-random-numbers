#!/usr/bin/env runhaskell

import System.Environment
import System.Random
import Text.Printf

main = do
  [argn] <- System.Environment.getArgs
  let n = read argn :: Int
  gen <- getStdGen
  mapM_ (printf "%.6f\n") (take n $ (randoms gen :: [Double]))

