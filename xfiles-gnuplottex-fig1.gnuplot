set terminal epslatex color size 5cm, 5cm
set output 'xfiles-gnuplottex-fig1.tex'
            set macros
            set parametric
            set trange [0:pi]

            set key left top
            set xlabel '$q_1$'
            set ylabel '$q_2$'
            set title '$\zeta = 0$'

            set xrange [-1.5:1.5]
            set yrange [-1.5:1.5]

            set lmargin at screen 0
            set bmargin at screen 0
            set rmargin at screen 1
            set tmargin at screen 1
            unset xtics
            unset ytics

            q1(q10,q20,p10,p20,t) = p10*sin(2*t) + q10*cos(2*t)
            q2(q10,q20,p10,p20,t) = p20*sin(2*t) + q20*cos(2*t)

            comb = \
                '1,1,1,1  1,1,0,1  1,0,1,1  0,1,1,1  1,1,0,0   1,0,1,0  0,1,1,0  1,0,0,1  0,1,0,1  0,0,1,1'
            macro = ''
            do for [i=1:words(comb)] {
                w = word(comb,i)
                if (!(macro eq '')) { macro = macro . ', '}
                macro = macro . 'q1('.w.',t), q2('.w.',t) not'
            }

            plot @macro
        
