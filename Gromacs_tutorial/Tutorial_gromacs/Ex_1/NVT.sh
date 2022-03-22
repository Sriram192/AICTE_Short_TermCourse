#HK!HK! 24-7-2018@ PECSLab WS @12.19 pm
gmx grompp -f nvt.mdp  -c em.gro -p topol.top -o nvt_1.tpr -n index.ndx -maxwarn 200
gmx mdrun -deffnm nvt_1 -nb gpu -v>&nvt.out & 
