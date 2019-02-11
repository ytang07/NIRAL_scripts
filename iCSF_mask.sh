#!/usr/bin/env tcsh

source /work/yujian/init.csh

set CSF = "${1}_csf.nrrd"
set ICSF = "${1}_iCSF.nrrd"
set NOICSF = "${1}_noiCSF.nrrd"
set CSFB = "${1}_csf_byte.nrrd"
set FIX = "${1}_noiCSF_fix.mnc"

ImageMath "${1}.nrrd" -threshold 2.5,3.2 -outfile $CSF
itk_convert $CSF $CSFB --byte
ImageMath $CSFB -mask $2 -outfile $ICSF
ImageMath $ICSF -combine "${1}.nrrd" -outfile $NOICSF

itk_convert $NOICSF "${1}_noiCSF.mnc" --inv-x --inv-y
#itk_convert "${3}.nrrd" "${3}.mnc" --inv-x --inv-y

#minccalc -byte -expr 'if (A[0] == 3 && A[1] == 1){out = 1} else {out = A[0]}' "${1}_noiCSF.mnc" "${3}.mnc" $FIX
