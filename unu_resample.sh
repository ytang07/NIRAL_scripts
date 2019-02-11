#!/usr/bin/env bash

for i in *_corr_label_lr.nrrd; do
	unu resample -i $i -o "half_$i" -s x0.5 x0.5 x0.5 -k box
done

for i in *_T1w_atlasReg_N4GM_final_strip.nrrd; do
	unu resample -i $i -o "half_$i" -s x0.5 x0.5 x0.5 -k box
done

for i in *_T2w_atlasT1Reg_N4GM_final_strip.nrrd; do
	unu resample -i $i -o "half_$i" -s x0.5 x0.5 x0.5 -k box
done
