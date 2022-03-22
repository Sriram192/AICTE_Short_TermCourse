#HK! HK! 24-7-2018 in PECS WS @ 3.31 pm  
#gmx grompp -f npt.mdp  -c nvt_1.gro -t nvt_1.cpt -p topol.top -o npt_1.tpr -n index.ndx -maxwarn 200
#gmx mdrun -deffnm npt_1 -nb gpu -v 
#HK! HK! 24-7-2018 in PECS WS @ 5.55 pm  
gmx grompp -f npt_2.mdp  -c npt_1.gro -t npt_1.cpt -p topol.top -o npt_2.tpr -n index.ndx -maxwarn 200
gmx mdrun -deffnm npt_2 -nb gpu -v 
