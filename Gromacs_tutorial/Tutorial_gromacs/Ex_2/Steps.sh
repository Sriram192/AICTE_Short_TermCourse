#########------- HK! HK! 22-3-2022
#########---- CTAB Packing in Cubic Box
#gmx insert-molecules -ci CTAB.gro -nmol 25 -box  4.5 4.5 4.5 -o ctab_box.gro 
########----Solvating ctab_box
#gmx solvate -cp ctab_box.gro -cs spc216.gro -o solv_ctab.gro -p topol.top
#########----Neutralizing  ctab_solv
#gmx grompp -f ions.mdp -c solv_ctab.gro -p  topol.top -o ions.tpr -maxwarn 200
#gmx genion -s ions.tpr -o ions_solv_ctab.gro  -p topol.top -pname NA -nname BR  -neutral
########----Energy minimization 
#gmx grompp -f  minim.mdp  -c  ions_solv_ctab.gro -p topol.top -o em.tpr -maxwarn 200
#gmx mdrun -deffnm em  -v
#gmx energy -f em.edr -o PE.xvg
#gnuplot gnu_PE
#xdg-open Fig_PE.eps


#######-----NVT Equilibration
#gmx make_ndx -f em.gro -o index.ndx
#gmx grompp -f nvt.mdp  -c em.gro -p topol.top -o nvt_1.tpr -n index.ndx -maxwarn 200
#gmx mdrun -deffnm nvt_1  -v
#gmx energy -f nvt_1.edr -o T.xvg
#gnuplot gnu_Temp
#xdg-open Fig_Temp.eps
#######-----NPT Equilibration
#gmx grompp -f npt.mdp  -c nvt_1.gro -t nvt_1.cpt -p topol.top -o npt_1.tpr -n index.ndx -maxwarn 200
#gmx mdrun -deffnm npt_1  -v
#gmx energy -f npt_1.edr -o density.xvg
#gnuplot gnu_rho
#xdg-open Fig_rho.eps


#######-----MD production
#gmx grompp -f md_1.mdp  -c nvt_1.gro -t npt_1.cpt -p topol.top -o md_1.tpr -n index.ndx -maxwarn 200
#gmx mdrun -deffnm md_1  -v
#gmx energy -f md_1.edr -o md_e.xvg
#gnuplot gnu_md_e
#xdg-open Fig_md_e.eps







#######-----MD production
#gmx grompp -f md_2.mdp  -c md_1.gro -t md_1.cpt -p topol.top -o md_2.tpr -n index.ndx -maxwarn 200
#gmx mdrun -deffnm md_2   -v
