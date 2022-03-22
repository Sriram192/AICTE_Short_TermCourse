# HK
##gmx rmsf -s md_2.tpr -f md_2.xtc -o rmsf_3nm.xvg -oq rmsf_3nm.pdb -res
##gmx gyrate -s md_2.tpr -f md_2.xtc -o Rg_3nm.xvg 
##gmx trjconv -f md_2.xtc -o md_2nojump.xtc -pbc nojump -dt 50
export DSSP=/usr/local/bin/dssp-2.0.4-linux-i386
gmx do_dssp -f 250ns_nopbclsw.xtc -s em.tpr -sc scount250.xvg -o ss250.xpm -b 0 -e 200 -tu ns -dt 5 
gmx xpm2ps -f ss250.xpm -di t.m2p -o ss250.eps -bx 15 -by 4.5
ps2pdf -sPAPERSIZE=ledger -di t.m2p ss250.eps ss250_CP1.pdf
xdg-open ss250.eps
