
# How long does it take to create a file with 6M random numbers?

Language | Compiler/Interpreter | Version   | Runtime
---------|----------------------|-----------|--------
C        | gcc                  | 9.3.0     | 1.458s
OCaml    | ocamlopt             | 4.10.0    | 3.458s
gawk     | gawk                 | 5.1.0     | 3.525s
Python   | python3              | 3.8.5     | 5.008s
Ruby     | ruby                 | 2.6.6p146 | 6.297s
OCaml    | ocaml                | 4.10.0    | 8.790s
nim      | nim                  | 1.2.6     | 25.176s
Haskell  | ghc                  | 8.8.4     | 27.684s
Scala    | scalac               | 2.13.3    | 27.962s
Scala    | scala                | 2.13.3    | 29.589s
bash     | bash                 | 4.4.23    | 77.363s
guile    | guile                | 2.2.7     | 101.652s
Haskell  | runhaskell           | 8.8.4     | 177.777s

# gcc

```
$ gcc -Wall -Werror -O2 -o gen gen.c

$ time ./gen 6000000 >data-c

real    0m1.458s
user    0m1.312s
sys     0m0.052s

$ gcc --version
gcc (GCC) 9.3.0
```

# ocaml

```
$ time ocaml gen.ml 6000000 >data-ocaml

real    0m8.790s
user    0m8.608s
sys     0m0.089s
```

# ocamlopt

```
$ ocamlopt gen.ml
$ time ./a.out 6000000 >data-ocamlopt

real    0m3.458s
user    0m3.322s
sys     0m0.039s
```

# gawk

```
$ time gawk -f gen.awk 6000000 >data-gawk

real    0m3.525s
user    0m3.489s
sys     0m0.036s

$ gawk --version
GNU Awk 5.1.0, API: 3.0
Copyright (C) 1989, 1991-2020 Free Software Foundation.
```

# python

```
$ time ./gen.py 6000000 >data-python

real    0m5.008s
user    0m4.821s
sys     0m0.186s

$ python3 --version
Python 3.8.5
```

# Ruby

```
$ time ./gen.rb 6000000 >data-ruby

real    0m6.297s
user    0m6.241s
sys     0m0.054s

$ ruby --version
ruby 2.6.6p146 (2020-03-31) [x86_64-linux]
```

# nim

```
$ nim c gen.nim

$ time ./gen 6000000 >data-nim

real    0m25.176s
user    0m18.242s
sys     0m6.849s

$ nim --version
Nim Compiler Version 1.2.6 [Linux: amd64]
Compiled at 2020-07-29
Copyright (c) 2006-2020 by Andreas Rumpf
```

# runhaskell

```
$ time ./gen.hs 6000000 >data-runhaskell

real    2m57.777s
user    1m39.441s
sys     1m18.366s

$ runhaskell  --version
runghc 8.8.4
```

# ghc

```
$ ghc -O2 -o gen gen.hs
$ time ./gen 6000000 >data-ghc

real    0m27.684s
user    0m27.513s
sys     0m0.165s

$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 8.8.4
```

# scala

```
$ time scala Gen.scala 6000000 >data-scala

real    0m29.589s
user    0m22.191s
sys     0m13.925s

$ scala --version
Scala code runner version 2.13.3 -- Copyright 2002-2020, LAMP/EPFL and Lightbend, Inc.
```

# scalac

```
$ scalac Gen.scala

$ time scala Gen 6000000 >data-scalac

real    0m27.962s
user    0m15.676s
sys     0m14.175s

$ scalac --version
Scala compiler version 2.13.3 -- Copyright 2002-2020, LAMP/EPFL and Lightbend, Inc.
```

# bash

```
$ time ./gen.sh 6000000 >data-bash

real    1m17.363s
user    1m8.158s
sys     0m9.120s

$ bash --version
GNU bash, version 4.4.23(1)-release (x86_64-unknown-linux-gnu)
Copyright (C) 2016 Free Software Foundation, Inc.
```

# guile

```
$ time guile -e main gen.scm 6000000 >data-guile

real    1m41.652s
user    2m10.645s
sys     0m1.829s

$ guile --version
guile (GNU Guile) 2.2.7
Copyright (C) 2020 Free Software Foundation, Inc.
```


