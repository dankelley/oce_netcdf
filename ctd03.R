library(oce)
library(ncdf4)
# 1. get some data
data(ctd)
S <- ctd[["salinity"]]
T <- ctd[["temperature"]]
p <- ctd[["pressure"]]
# 2. write to netcdf
filename <- "ctd03.nc"
N <- length(S)
# Pattern units, names, etc., on argo file ~/data/argo/D4901788_045.nc
FillValue <- 99999.0
Ndim <- ncdim_def(name="LEVEL", units="", vals=seq_along(S))
Svar <- ncvar_def("PSAL",
    units="psu",
    dim=Ndim,
    longname="Practical Salinity",
    missval=FillValue,
    prec="float")
Tvar <- ncvar_def("TEMP",
    units="degree_Celcius",
    dim=Ndim,
    longname="Sea temperature in-situ ITS-90 scale",
    missval=FillValue,
    prec="float")
pvar <- ncvar_def("PRES",
    units="decibar",
    dim=Ndim,
    longname="Sea water pressure, equals 0 at sea-level",
    missval=FillValue,
    prec="float")
nc <- nc_create(filename, list(Svar, Tvar, pvar))
ncvar_put(nc=nc, varid=Svar, vals=S)
ncvar_put(nc=nc, varid=Tvar, vals=T)
ncvar_put(nc=nc, varid=pvar, vals=p)
nc_close(nc)


