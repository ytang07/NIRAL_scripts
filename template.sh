#!/usr/bin/env tcsh

itk_convert "${1}.nrrd" "${1}.mnc" --inv-x --inv-y
source /work/yujian/init.csh


