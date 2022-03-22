# HK
export DSSP=/usr/bin/dssp
#gmx trjconv -f 200ns.xtc -o 200nsnojump.xtc -pbc nojump -dt 50
gmx do_dssp -f 210nsnojump.xtc -b 0 -e 200 -s md_1.tpr -sc scount1_CP.xvg -o ss1_CP.xpm -tu ns -dt 5 
gmx xpm2ps -f ss1_CP.xpm -di t.m2p -o ss1_CP3.eps -bx 12 -by 4 
#15-12-2021
#ps2pdf -sPAPERSIZE=ledger ss1_NSL_C0200.eps ss1_NSL_C0200.pdf
xdg-open ss1_CP3.eps

