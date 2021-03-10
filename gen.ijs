#!/usr/bin/env jconsole
n =. 0 ". >2 { ARGV
octl =. 9!:37
fmt =: 8!:2
octl 0 256 0,n
echo '6' fmt ? (n,1) $ 0
exit ''