# HK!5-1-2018
#gmx solvate -cp Au_prot.gro -cs spc216.gro -o solv_Au_prot.gro -p Autopol.top
gmx solvate -cp N1_Au_prot.gro -cs spc216.gro -o solv_Au_prot.gro -p topol.top
gmx grompp -f ions.mdp -c solv_Au_prot.gro -p  topol.top -o ions.tpr -maxwarn 200
gmx genion -s ions.tpr -o ions_solv_Au_prot.gro  -p topol.top -pname NA -nname CL  -neutral
gmx grompp -f  minim.mdp  -c  ions_solv_Au_prot.gro -p topol.top -o em.tpr -maxwarn 200
gmx mdrun -deffnm em -nb gpu -v 
