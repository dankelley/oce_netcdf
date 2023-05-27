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

# ctd03.R

The start of a solution for converting oce objects to netcdf files.  This uses
data(ctd) as the data source.  So far, it only works with S, T and p.  The
naming convention copies argo.

# TO DO

1. Make it read a conversion file, perhaps in YAML format, e.g. as follows for
   argo. (Yes, I am aware that "psu" is not a unit, but it is in argo files.)

    temperature:
        name: "TEMP"
        units: "degree_Celcius"
        longname: "Sea temperature in-situ ITS-90 scale"
    salinity:
        name: "PSAL"
        units: "psu"
        longname: "Practical Salinity"
    pressure:
        name: "PRES"
        units: "decibar"
        longname: "Sea water pressure, equals 0 at sea-level"

2. Make it save all items in the @data slot.

3. Make it store the header.

4. Start testing it.
