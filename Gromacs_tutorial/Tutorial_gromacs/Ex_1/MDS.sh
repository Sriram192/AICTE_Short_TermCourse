#HK!6-7-2018
#HK!HK! HK! 13-10-2018 @1.51 pm in PECS Lab WS
gmx grompp -f md_1.mdp  -c em.gro -p topol.top -o md_1.tpr -n index.ndx -maxwarn 200
gmx mdrun -deffnm md_1 -nb gpu -v 

#gmx grompp -f md_1.mdp  -c npt_1.gro -t npt_1.cpt -p topol.top -o md_1.tpr -n index.ndx -maxwarn 200
