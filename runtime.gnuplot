set terminal push; set terminal svg size 1920,1080 fontscale 1.5 dynamic mouse standalone noenhanced; set output 'runtime.svg'
set grid
set yr [0:]
set ylabel 'Runtime (seconds)'
set key off
set boxwidth 0.67
set style fill solid 1.0
set style line 1 lc rgb "#0000aa"
plot "< awk -F\\| 'NF==4 && /s$/ {print $2,$4}' README.md" u 2:xtic(1) not w boxes ls 1
set output; set terminal pop


