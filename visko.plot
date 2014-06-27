set terminal epslatex color
set output 'Viskositaet.tex'
set xlabel 'Zeit [s]'
set ylabel 'logarithmische Höhe [ln(Skalenteile)]'
set key top left
set xrange [0:*]
#set logscale y
f3(x)=a*x+b
set fit logfile 'visko.log'
fit f3(x) 'Viskositaet.txt' u ($2+11.65):(log(5.1/5.0*$1/100)) via a,b
p 'Viskositaet.txt' u ($2+11.65):(log(5.1/5.0*$1/100)):3 w xe title 'Messpunkte', f3(x) lt -1 lc 1 title 'Fit'
set output
!epstopdf Viskositaet.eps
