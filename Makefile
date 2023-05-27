SOURCES=$(wildcard *.cdl)
OBJECTS=$(SOURCES:.cdl=.nc)
all: $(OBJECTS)
%.nc: %.cdl
	ncgen -o $@ < $<
clean:
	-rm *~ *swp *.nc

