#!/usr/bin/env tcsh

source /work/yujian/init.csh

set CSF = "${1}_csf.mnc" 
set GM = "${1}_gm.mnc" 
set WM = "${1}_wm.mnc"
set ALL = "${1}_all.mnc" 

minccalc -byte -expr 'if (A[0] > 0.8 && A[0] < 1.2 || A[0] > 3.5) {out = 1}' "${1}.mnc" $WM
minccalc -byte -expr 'if (A[0] > 1.8 && A[0] < 2.2) {out = 1}' "${1}.mnc" $GM 
minccalc -byte -expr 'if (A[0] > 2.8 && A[0] < 3.2) {out = 1}' "${1}.mnc" $CSF
minccalc -byte -expr 'if (A[0] == 1) {out = 1} else if (A[1] == 1) {out = 2} else if (A[2] == 1) {out = 3}' $CSF $GM $WM $ALL
