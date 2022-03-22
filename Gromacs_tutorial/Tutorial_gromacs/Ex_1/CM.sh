gmx mdmat -f 200ns.xtc -s md_1.tpr -n index.ndx -b 200000 -e 200000 -mean dm.xpm -frames dmf.xpm -no num.xvg
gmx xpm2ps -f dm.xpm -o dm_CP.eps -bx 5 -by 5
gmx xpm2ps -f dm.xpm -o dm_CP.eps -rainbow  blue

