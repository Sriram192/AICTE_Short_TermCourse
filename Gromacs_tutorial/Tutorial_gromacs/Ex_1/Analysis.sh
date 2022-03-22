# HK! 7-12-2017
gmx rdf -f md_1.xtc -n index.ndx -o rdfmd_1sN.xvg -surf no -bin 0.02 -cn CN.xvg
gmx rdf -f md_1.xtc -n index.ndx -o rdfmd_1s.xvg -surf no
gmx mindist -f md_1.xtc -n index.ndx -od minimdist1N.xvg -on numcont.xvg -d 0.4 -tu ns
gmx mindist -f md_1.xtc -n index.ndx -od minimdist1T20.xvg -on numcont.xvg -d 0.4 -tu ns
#gmx rdf -f md_2.xtc -n index.ndx -o rdfmd_2cm.xvg
gmx trjconv -s md_1.tpr -f md_1.xtc -n index.ndx -o noPBC.xtc -pbc mol -ur compact -tu ns
gmx rms -s npt_1.tpr -f nvtnoPBC.xtc -o rmsd.xvg -tu ns
gmx gyrate -s npt_1.tpr -f nvtnoPBC.xtc -o gyrate.xvg
gmx rmsf -s md_1.tpr -f noPBC.xtc n index.ndx -o rmsf1.xvg -oq rmsf.pdb -res
gmx gangle -f md_2.xtc -s md_1.tpr -n index.ndx -selrpos res_com -g1 plane -group1 2 -g2 vector -group2  -oav avgang.xvg
gmx trjcat -f md_1.xtc md_2.xtc md_3.xtc md_5.xtc -o 60ns_S7G2.xtc -tu ns -settime
gmx mindist -f 100ns_S7G2.xtc -n index.ndx -od minimdist1C20.xvg -on numcontC20.xvg -d 0.4 -tu ns -dt 1
gmx rmsf -s md_2.tpr -f 100ns.xtc -n index.ndx -o rmsf1C10.xvg
gmx density -f md_5.xtc -n index.ndx -s md_5.tpr -o density.xvg -sl 50 -dens number
gmx order -f md_5.xtc -s md_5.tpr -n ctabindex.ndx  -o order.xvg
gmx rdf -f md_11.xtc -n 8index.ndx -s md_11.tpr -pbc -seltype whole_mol_com -selrpos whole_mol_com -o T1C20.xvg
gmx rdf -f lsw70ns.xtc -n index.ndx -s md_5.tpr -pbc -seltype whole_mol_com -selrpos atom -o T1N.xvg -bin 0.02
awk '{print $1-1,"    " $2}' T1N.xvg 
gmx rdf -f md_4.xtc  -n index.ndx -s md_1.tpr -pbc -seltype res_com  -surf no -o NPCOM_N.xvg -bin 0.02
awk '{print $1-0.975,"    " $2}' T1N.xvg
gmx rmsf -s md_1.tpr -f md_8.xtc -n index.ndx -o rmsfC10.xvg -oq rmsf.pdb -res 
gmx rmsf -s md_2b.tpr -f md_2b.xtc -o rmsf_2nm.xvg -oq rmsf.pdb -res
gmx rmsf -s md_5.tpr -f 210ns.xtc -o rmsf50_CP1.xvg -oq rmsf.pdb -res -b 170000 -e 210000 
gmx gyrate -s md_5.tpr -f 210ns.xtc -o Rg50_CP1.xvg -b 0 -e 200000 -dt 2000

DSSP Analysis
export DSSP=/usr/local/bin/dssp-2.0.4-linux-i386
gmx trjconv -f md_2b.xtc -o md_2bnojump.xtc -pbc nojump -dt 50
gmx do_dssp -f md_2bnojump.xtc -s md_2b.tpr -sc scount1_2nm.xvg -o ss1_2nm.xpm -tu ns
gmx xpm2ps -f ss1_2nm.xpm -o ss1_2nm.eps -bx 0.225 -by 5
ps2pdf -sPAPERSIZE=ledger ss1_2nm.eps ss1_2nm.pdf

# 17-02-2019
gmx mdmat -f md_1.xtc -s md_1.tpr -n index.ndx -b 2500 -e 2501 -mean dm.xpm -frames dmf.xpm -no num.xvg
gmx xpm2ps -f dm.xpm -o dm.eps -bx 5 -by 5
gmx xpm2ps -f dm.xpm -o dm.eps -rainbow  blue
# 30/10/2020 main chain(mc)and side chain (sc)
gmx xpm2ps -f dm_mc.xpm -di t.m2p -title none -o dm_mc_cp.eps -rainbow  red
gmx xpm2ps -f dm_sc.xpm -di t.m2p -title none -o dm_sc_cp.eps -rainbow  red
gmx xpm2ps -f dm_mc.xpm -di t.m2p -title none -o dm_mc_cp.eps -legend none -rainbow  red
