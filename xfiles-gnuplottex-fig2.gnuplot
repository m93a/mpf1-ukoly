set terminal epslatex color size 5cm, 5cm
set output 'xfiles-gnuplottex-fig2.tex'
            set macros

            set key left top
            set xlabel '$q_1$'
            set title '$\zeta = 0.5$'

            set xrange [-1.5:1.5]
            set yrange [-1.5:1.5]

            set lmargin at screen 0
            set bmargin at screen 0
            set rmargin at screen 1
            set tmargin at screen 1
            unset xtics
            unset ytics

            comb = \
                '1,1,1,1  1,1,0,1  1,0,1,1  0,1,1,1  1,1,0,0   1,0,1,0  0,1,1,0  1,0,0,1  0,1,0,1  0,0,1,1'
            macro = ''
            do for [i=1:words(comb)] {
                w = word(comb,i)
                if (!(macro eq '')) { macro = macro . ', '}
                macro = macro . '"xfiles_z05_'.w.'.dat" w l not'
            }

            plot @macro
        
