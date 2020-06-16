set term postscript enhanced color dashed 28
set encoding iso_8859_1
set output "lra.ps"

set border 31 lt -1 lw 3

set style line  1 lt rgb "#FF0000" lw 3 pt 7 ps 1.0
set style line  2 lt rgb "#0000FF" lw 3 pt 7 ps 1.0
set style line  3 lt rgb "#000000" lw 3 pt 5 ps 1.0

set xlabel "pH"
set ylabel "pK units"

set xrange [0:3]
set yrange [0:3]

set xtics 0,1
set ytics 0,1

set mxtics 2
set mytics 2

set grid xtics ytics #mxtics mytics
set size square
set key bottom

plot \
     x w lines lt 0 lw 8 notitle, \
     'pKeff_deprot.txt' w lines ls 1 lw 6 t 'Deprotonated', \
     'pKeff_prot.txt'   w lines ls 2 lw 6 t 'Protonated', \
     'pKeff_avx.txt'    w lines ls 3 lw 6 t 'Average'


! ps2pdf lra.ps
