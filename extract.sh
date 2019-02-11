#!/usr/bin/env tcsh

ImageMath "${1}.nrrd" -extractLabel 1 -outfile "${1}_h1.nrrd"
ImageMath "${1}.nrrd" -extractLabel 5 -outfile "${1}_h5.nrrd"
ImageMath "${1}.nrrd" -extractLabel 4 -outfile "${1}_p4.nrrd"
ImageMath "${1}.nrrd" -extractLabel 8 -outfile "${1}_p8.nrrd"
ImageMath "${1}.nrrd" -extractLabel 3 -outfile "${1}_c3.nrrd"
ImageMath "${1}.nrrd" -extractLabel 7 -outfile "${1}_c7.nrrd"
ImageMath "${1}.nrrd" -extractLabel 2 -outfile "${1}_a2.nrrd"
ImageMath "${1}.nrrd" -extractLabel 6 -outfile "${1}_a6.nrrd"
ImageMath "${1}.nrrd" -extractLabel 11 -outfile "${1}_gp11.nrrd"
ImageMath "${1}.nrrd" -extractLabel 12 -outfile "${1}_gp12.nrrd"
