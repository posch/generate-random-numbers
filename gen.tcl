
set n [lindex $argv 0]
for {set i 0} {$i < $n} {incr i} {
    puts [format "%.6f" [expr rand()]]
}



