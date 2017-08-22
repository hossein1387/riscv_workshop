SYN = yosys
PNR = arachne-pnr
GEN = icepack
PROG = iceprog
BOARD = iCE40HX8K

TOP = SimpleLed.v
PCF = $(BOARD).pcf
      
ifeq (iCE40HX8K,$(BOARD))
	DEVICE = 8k
else
	DEVICE = 1k
endif


OUTPUT = $(patsubst %.v,%.bin,$(TOP))

all: $(OUTPUT)

%.bin: %.tiles
	$(GEN) $< $@

%.tiles: %.blif
	$(PNR) -d $(DEVICE) -p $(PCF) -o $@ $<

%.blif: %.v
	$(SYN) -p "read_verilog $<; synth_ice40 -flatten -blif $@"

clean:
	rm -f *.bin *.blif *.tiles

flash: $(OUTPUT)
	$(PROG) $<

.PHONY: all clean flash
