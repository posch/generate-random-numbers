# How long does it take to create a file with 6M random numbers?

A performance comparison of ad-hoc programs in several languages that
generate floating point random numbers.

Language   | Compiler/Interpreter | Version   | Runtime
-----------|----------------------|-----------|--------
C          | gcc                  | 9.3.0     | 1.458s
Perl       | perl                 | 5.32.0    | 3.176s
OCaml      | ocamlopt             | 4.10.0    | 3.458s
gawk       | gawk                 | 5.1.0     | 3.525s
Fortran    | gfortran             | 9.3.0     | 3.705s
GNU-Prolog | gplc                 | 1.4.5     | 3.917s
Python     | python3              | 3.8.5     | 5.008s
Ruby       | ruby                 | 2.6.6p146 | 6.297s
OCaml      | ocaml                | 4.10.0    | 8.790s
Rust       | rustc                | 1.45.2    | 9.521s
lua        | lua                  | 5.2.4     | 12.940s
tcl        | tclsh                | 8.6       | 23.299s
JavaScript | node                 | 12.21.0   | 23.639s
nim        | nim                  | 1.2.6     | 25.176s
Haskell    | ghc                  | 8.8.4     | 27.684s
Scala      | scalac               | 2.13.3    | 27.962s
Scala      | scala                | 2.13.3    | 29.589s
bash       | bash                 | 4.4.23    | 55.462s
guile      | guile                | 2.2.7     | 101.652s
Haskell    | runhaskell           | 8.8.4     | 177.777s

![Runtimes](https://raw.githubusercontent.com/posch/generate-random-numbers/main/runtime.svg)

Tests were run on a ThinkPad T460s (Intel Core i5, 8 GB RAM) running Nixos 20.09.

# Commands
## bash

```
$ time ./gen.sh 6000000 >data-bash

real    0m55.462s
user    0m46.309s
sys     0m9.054s

$ bash --version
GNU bash, version 4.4.23(1)-release (x86_64-unknown-linux-gnu)
Copyright (C) 2016 Free Software Foundation, Inc.
```

## gawk

```
$ time gawk -f gen.awk 6000000 >data-gawk

real    0m3.525s
user    0m3.489s
sys     0m0.036s

$ gawk --version
GNU Awk 5.1.0, API: 3.0
Copyright (C) 1989, 1991-2020 Free Software Foundation.
```


## gcc

```
$ gcc -Wall -Werror -O2 -o gen gen.c
$ time ./gen 6000000 >data-c

real    0m1.458s
user    0m1.312s
sys     0m0.052s

$ gcc --version
gcc (GCC) 9.3.0
```

## gfortran

```
$ gfortran -o gen gen.f90
$ time ./gen 6000000 >data-gfortran

real    0m3.705s
user    0m3.658s
sys     0m0.043s

$ gfortran --version
GNU Fortran (GCC) 9.3.0
```


## ghc

```
$ ghc -O2 -o gen gen.hs
$ time ./gen 6000000 >data-ghc

real    0m27.684s
user    0m27.513s
sys     0m0.165s

$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 8.8.4
```

## gprolog

```
$ gplc --no-top-level gen.prolog
$ export GLOBALSZ=6000000; time ./gen 6000000 >data-gprolog

real    0m3.917s
user    0m3.574s
sys     0m0.249s

$ gplc --version
Prolog compiler (GNU Prolog) 1.4.5
```

## guile

```
$ time guile -e main gen.scm 6000000 >data-guile

real    1m41.652s
user    2m10.645s
sys     0m1.829s

$ guile --version
guile (GNU Guile) 2.2.7
Copyright (C) 2020 Free Software Foundation, Inc.
```

## lua

```
$ time lua gen.lua 6000000 >data-lua 

real    0m12.940s
user    0m6.117s
sys     0m6.785s

$ lua -v
Lua 5.2.4  Copyright (C) 1994-2015 Lua.org, PUC-Rio
```

## nim

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

## node

```
$ time node gen.js 6000000 >data-node 

real    0m23.639s
user    0m16.058s
sys     0m7.758s

$ node --version
v12.21.0
```

## ocaml

```
$ time ocaml gen.ml 6000000 >data-ocaml

real    0m8.790s
user    0m8.608s
sys     0m0.089s
```

## ocamlopt

```
$ ocamlopt gen.ml
$ time ./a.out 6000000 >data-ocamlopt

real    0m3.458s
user    0m3.322s
sys     0m0.039s
```

## perl

```
$ time ./gen.pl 6000000 >data-perl 

real    0m3.176s
user    0m3.034s
sys     0m0.050s

$ perl --version

This is perl 5, version 32, subversion 0 (v5.32.0) built for x86_64-linux-thread-multi
```

## python

```
$ time ./gen.py 6000000 >data-python

real    0m5.008s
user    0m4.821s
sys     0m0.186s

$ python3 --version
Python 3.8.5
```

## Ruby

```
$ time ./gen.rb 6000000 >data-ruby

real    0m6.297s
user    0m6.241s
sys     0m0.054s

$ ruby --version
ruby 2.6.6p146 (2020-03-31) [x86_64-linux]
```

## runhaskell

```
$ time ./gen.hs 6000000 >data-runhaskell

real    2m57.777s
user    1m39.441s
sys     1m18.366s

$ runhaskell  --version
runghc 8.8.4
```

## rust

```
$ cargo build --release
$ time ./target/release/gen 6000000 >../data-rust

real    0m9.521s
user    0m3.198s
sys     0m6.228s

$ rustc --version
rustc 1.45.2
```

## scala

```
$ time scala Gen.scala 6000000 >data-scala

real    0m29.589s
user    0m22.191s
sys     0m13.925s

$ scala --version
Scala code runner version 2.13.3 -- Copyright 2002-2020, LAMP/EPFL and Lightbend, Inc.
```

## scalac

```
$ scalac Gen.scala
$ time scala Gen 6000000 >data-scalac

real    0m27.962s
user    0m15.676s
sys     0m14.175s

$ scalac --version
Scala compiler version 2.13.3 -- Copyright 2002-2020, LAMP/EPFL and Lightbend, Inc.
```

## tcl

```
$ time tclsh gen.tcl 6000000 >data-tcl

real    0m23.299s
user    0m15.710s
sys     0m7.492s
```


