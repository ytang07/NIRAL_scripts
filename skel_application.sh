#!/usr/bin/env tcsh

source /work/yujian/init.csh

set WM = "${1}_wm.mnc"
set CSF = "${1}_wm_csf.mnc"

minccalc -byte -expr 'if(A[0] > 0){out = 1}else {out = A[1]}' $2 "${1}.mnc" $WM -clobber
minccalc -byte -expr 'if(A[0] > 0){out = 3}else {out = A[1]}' $3 $WM $CSF -clobber
