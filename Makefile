RSOURCES=$(wildcard *.R)
ROBJECTS=$(RSOURCES:.R=.out)
CDLSOURCES=$(wildcard *.cdl)
CDLOBJECTS=$(CDLSOURCES:.cdl=.nc)
all: $(ROBJECTS) $(CDLOBJECTS)
%.nc: %.cdl
	ncgen -o $@ < $<
%.out: %.R
	Rscript $<
clean:
	-rm *~ *swp *.nc *.out

