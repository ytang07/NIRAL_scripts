#!/usr/bin/env tcsh

source /work/yujian/init.csh

CIVET_Processing_Pipeline -prefix TEST -sourcedir ./ -targetdir ./ -N3-distance 200 -lsq12 -resample-surfaces -thickness tlink 30 -VBM -combine-surface -animal -lobe_atlas icbm152nl-2009a -spawn -run $1 -reset-from clean_native_scan -reset-to pve -template 0.50 -no-calibrate-white

mincresample -byte -nearest_neighbour -like "$TEST_{1}_t1.mnc" -transformation $2 "${3}.mnc" "${3}_reg.mnc"

mincresample -byte -nearest_neighbour -like $1/mask/"TEST_${1}_skull_mask.mnc" -transformation $1/transforms/linear/"TEST_${1}_t1_tal.xfm" "${3}_reg.mnc" "${3}_reg_tal.mnc" -clobber

set TAL = "${3}_reg_tal"

minccalc -byte -expr 'if (A[0] == 1){out = 1}' $TAL "${TAL}_csf.mnc"
minccalc -byte -expr 'if (A[0] == 2){out = 1}' $TAL "${TAL}_gm.mnc"
minccalc -byte -expr 'if (A[0] == 3){out = 1}' $TAL "${TAL}_wm.mnc"

cp "${TAL}.mnc" $1/classify/"TEST_${1}_cls_clean.mnc"
cp "${TAL}.mnc" $1/classify/"TEST_${1}_pve_disc.mnc"
cp "${TAL}.mnc" $1/classify/"TEST_${1}_pve_classify.mnc"
cp "${TAL}_csf.mnc" $1/classify/"TEST_${1}_pve_exactcsf.mnc"
cp "${TAL}_gm.mnc" $1/classify/"TEST_${1}_pve_exactgm.mnc"
cp "${TAL}_wm.mnc" $1/classify/"TEST_${1}_pve_exactwm.mnc"

CIVET_Processing_Pipeline -prefix TEST -sourcedir ./ -targetdir ./ -N3-distance 200 -lsq12 -resample-surfaces -thickness tlink 30 -VBM -combine-surface -animal -lobe_atlas icbm152nl-2009a -spawn -run $1 -reset-after pve -reset-to surface_classify -template 0.50 -no-calibrate-white

cp $4 $1/temp/"TEST_${1}_subcortical_mask.mnc"
cp $TAL $1/temp/"TEST_${1}_final_classify.mnc"

CIVET_Processing_Pipeline -prefix TEST -sourcedir ./ -targetdir ./ -N3-distance 200 -lsq12 -resample-surfaces -thickness tlink 30 -VBM -combine-surface -animal -lobe_atlas icbm152nl-2009a -spawn -run $1 -reset-after surface_classify -reset-to verify_atlas -template 0.50 -no-calibrate-white
