#!/usr/bin/env bash

for i in *_corr_label.nrrd; do
	lr_combine.sh $i
done
