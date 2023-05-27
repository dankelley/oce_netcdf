# ctd01.cdl

Copied from https://docs.unidata.ucar.edu/nug/current/_c_d_l.html; convert to nc
with

    ncgen -o ctd01.nc < ctd01.cdl

or with

    make

(which converts all local .cdl files to .nc files, if the .cdl is younger than
the .nc).

# ctd02.cdl

Based on ctd01.cdl, add some fake info as for a ctd (see any argo file).  So far,
only TEMP done, but rest should be easy and may as well start doing this in R.

