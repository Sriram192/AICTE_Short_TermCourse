##########--------------Amyloidbeta 40 in Water----------#
##########-------------22-03-2022------------------------#
##########-------------gmx (module) -h-------------------#

#grep -v HOH 1ba4.pdb > 1ba4_clean.pdb
#gmx pdb2gmx -f 1ba4_clean.pdb -o prot.gro -water spce -ignh
#gmx editconf -f prot.gro -o prot_newbox.gro -c -d 1.0 -bt cubic
#gmx solvate -cp prot_newbox.gro -cs spc216.gro -o prot_solv.gro -p topol.top
#gmx grompp -f ions.mdp -c prot_solv.gro -p topol.top -o ions.tpr -maxwarn 100
#gmx genion -s ions.tpr -o prot_solv_ions.gro -p topol.top -pname NA -nname CL -neutral

########------------ Use Vmd load to view prot_solv_ions.gro

#gmx grompp -f minim.mdp -c prot_solv_ions.gro -p topol.top -o em.tpr -maxwarn 10
#gmx mdrun -v -deffnm em
#gmx energy -f em.edr -o PE.xvg
#gnuplot gnu_PE
#xdg-open Fig_PE.eps

########-------------Use gnuplot PE 
########-------------Index  view em.gro

#gmx grompp -f nvt.mdp -c em.gro -r em.gro -p topol.top -o nvt.tpr -maxwarn 10
#gmx mdrun -deffnm nvt -v
gmx energy -f nvt.edr -o T.xvg
gnuplot gnu_T
xdg-open Fig_T.eps

##########-------------Use gnuplot Temp

#gmx grompp -f npt.mdp -c nvt.gro -r nvt.gro -t nvt.cpt -p topol.top -o npt.tpr -maxwarn 10
#gmx mdrun -deffnm npt -v
#gmx energy -f npt.edr -o P.xvg
#gnuplot gnu_P
#xdg-open Fig_P.eps

##########--------------Use gnuplot density 
gmx energy -f npt.edr -o rho.xvg
gnuplot gnu_rho
xdg-open Fig_rho.eps


#gmx energy -f npt.edr -o density.xvg
#gmx grompp -f md.mdp -c npt.gro -t npt.cpt -p topol.top -o md_1.tpr -maxwarn 10
#gmx mdrun -deffnm md_1 -v
#gmx energy -f md_1.edr -o md_e.xvg
#gnuplot gnu_md_e
#xdg-open Fig_md_e.eps

##########--------------Use gnuplot PE KE & TE

#gmx trjconv -s md_1.tpr -f md_1.xtc -o md_1_noPBC.xtc -pbc mol -center
#gmx rms -s md_1.tpr -f md_1_noPBC.xtc -o rmsd.xvg -tu ns
#gnuplot gnu_rmsd
#xdg-open Fig_rmsd.eps

##########-------------If we wish to calculate RMSD relative to the crystal structure, we could issue the following:

#gmx rms -s em.tpr -f md_1_noPBC.xtc -o rmsd_xtal.xvg -tu ns
#gnuplot gnu_rmsd_comp
#xdg-open Fig_rmsd_comp.eps


gmx gyrate -s md_1.tpr -f md_1_noPBC.xtc -o gyrate.xvg
gnuplot gnu_Rg
xdg-open Fig_Rg.eps

######------------Use gnuplot RMSF

gmx rmsf -s md_1.tpr -f md_1_noPBC.xtc -o rmsf.xvg -oq rmsf.pdb -res
gnuplot gnu_rmsf
xdg-open Fig_rmsf.eps
