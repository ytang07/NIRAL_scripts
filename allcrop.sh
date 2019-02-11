#!/usr/bin/env tcsh

foreach x (*.nrrd)
	crop.sh $x
end
