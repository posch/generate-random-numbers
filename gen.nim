import random
import strformat
import os
import strutils

let n = parseInt(paramStr(1))
randomize()
for i in 1..n:
  echo fmt"{rand(1.0):.6f}"

