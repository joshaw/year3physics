reset
set terminal latex
set output "StellarDens_exponential.tex"

set title ""
set xlabel "Redshift"
set ylabel '\begin{sideways}Star Density\end{sideways}'
set key top right
#set xrange[0:1]
#set yrange[0:1]

#f(x) = m*x + c 			#linear
f(x) = exp(-m*x + c)	 	#exponential
#f(x) = m**(c*x) + d 		#power
#f(x) = m*x**(-c) 			#power2
#f(x) = m*log(c*x) + d 		#logarithm

m = 0.5
c = 20
fit f(x) "StellarDens.txt" using ($1):($2) via m, c

#titlef = sprintf("$f(x) = %.3fx + %.3f$", m, c)				#linear
titlef = sprintf("$f(x) = \e^{-%.3fx + %.3f}$", m, c)			#exponential
#titlef = sprintf("$f(x) = %.3f^{%.3fx} + %.3f$", m, c, d)		#power
#titlef = sprintf("$f(x) = %.3fx^{%.3f}$", m, c)				#power2
#titlef = sprintf("$f(x) = %.3f\log(%.3fx) + %.3f$", m, c, d)	#logarithm

#g(x) = n*log(x) + d
#fit g(x) "StellaDens.txt" using 1:3 via n, d
#titleg = sprintf("%.2flog(x)+%.2f", n, d)

plot\
 f(x) t titlef, "StellarDens.txt" using 1:2:($2-$4):($2+$3) t ""\
 with yerrorbars lt 7

pause -1 "Hit return to continue"

# color plot
#set term post enhanced color solid "Helvetica" 16
# bw plot
#set term post eps enhanced mono dashed "Helvetica" 18

# automatically create pdf file
#set output '| epstopdf --filter --outfile=plot2D.pdf'

# plot again to file:
#replot
