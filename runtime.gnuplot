
set terminal push; set terminal svg size 1920,1080 dynamic mouse standalone noenhanced; set output 'runtime.svg'
set grid
set yr [0:]
set xr [-1:14]
set ylabel 'Runtime (seconds)'
set key off
plot "< sed -n '/|.*s$/ {s,|,,g; p}' README.md" u 4:xtic(2) w im lt 2 lw 50
set output; set terminal pop


