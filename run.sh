#!/bin/bash
count=1
for repo in "Arjun-Code-Knight/csc510-se-project" "ankitkumar93/csc510-se-project" "azhe825/CSC510" "jordy-jose/CSC_510_group_d" "DharmendraVaghela/csc510-grp-e" "moharnab123saikia/CSC510-group-f" "cleebp/csc-510-group-g" "nikign/Git-Helper" "shivamgulati1991/CSC510-SE-group-i" "arnabsaha1011/mypackse" "alokrk/csc510groupk" "sandz-in/csc510_group_l" "nikraina/CSC510-Group-M" "gvivek19/CSC510-Team-N"
do python gitable-sql.py $repo $(echo group${count})
count=$((count+1))
done