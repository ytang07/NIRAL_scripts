#!/usr/bin/env bash

NAME=$(echo "${1}" | cut -f 1 -d '.')

echo ${NAME}

ImageMath "${NAME}.nrrd" -extractLabel 11 -outfile "${NAME}_11.nrrd"
ImageMath "${NAME}.nrrd" -extractLabel 12 -outfile "${NAME}_12.nrrd"
ImageLabelCombine "${NAME}_11.nrrd" "${NAME}_12.nrrd" "${NAME}_gp.nrrd"

ImageMath "${NAME}.nrrd" -extractLabel 2 -outfile "${NAME}_2.nrrd"
ImageMath "${NAME}.nrrd" -extractLabel 6 -outfile "${NAME}_6.nrrd"
ImageLabelCombine "${NAME}_2.nrrd" "${NAME}_6.nrrd" "${NAME}_a.nrrd"

ImageMath "${NAME}.nrrd" -extractLabel 1 -outfile "${NAME}_1.nrrd"
ImageMath "${NAME}.nrrd" -extractLabel 5 -outfile "${NAME}_5.nrrd"
ImageLabelCombine "${NAME}_1.nrrd" "${NAME}_5.nrrd" "${NAME}_h.nrrd"

ImageMath "${NAME}.nrrd" -extractLabel 4 -outfile "${NAME}_4.nrrd"
ImageMath "${NAME}.nrrd" -extractLabel 8 -outfile "${NAME}_8.nrrd"
ImageLabelCombine "${NAME}_4.nrrd" "${NAME}_8.nrrd" "${NAME}_p.nrrd"

ImageMath "${NAME}.nrrd" -extractLabel 3 -outfile "${NAME}_3.nrrd"
ImageMath "${NAME}.nrrd" -extractLabel 7 -outfile "${NAME}_7.nrrd"
ImageLabelCombine "${NAME}_3.nrrd" "${NAME}_7.nrrd" "${NAME}_c.nrrd"

ImageMath "${NAME}_c.nrrd" -combine "${NAME}_p.nrrd" -relabel 2 -outfile "${NAME}_comb1.nrrd"
ImageMath "${NAME}_comb1.nrrd" -combine "${NAME}_h.nrrd" -relabel 3 -outfile "${NAME}_comb2.nrrd"
ImageMath "${NAME}_comb2.nrrd" -combine "${NAME}_a.nrrd" -relabel 4 -outfile "${NAME}_comb3.nrrd"
ImageMath "${NAME}_comb3.nrrd" -combine "${NAME}_gp.nrrd" -relabel 5 -outfile "${NAME}_lr.nrrd"

rm -rf "${NAME}_11.nrrd" "${NAME}_12.nrrd" "${NAME}_gp.nrrd" "${NAME}_2.nrrd" "${NAME}_6.nrrd" "${NAME}_a.nrrd" "${NAME}_1.nrrd" "${NAME}_5.nrrd" "${NAME}_h.nrrd" "${NAME}_4.nrrd" "${NAME}_8.nrrd" "${NAME}_p.nrrd"
rm -rf "${NAME}_3.nrrd" "${NAME}_7.nrrd" "${NAME}_c.nrrd" "${NAME}_comb1.nrrd" "${NAME}_comb2.nrrd" "${NAME}_comb3.nrrd"
