SHELL=/bin/bash -o pipefail
.SHELLFLAGS += -e

dadda_multiplier.v:
	python3 generator.py $(NUM_BITS)

multiplier_tb: tb.v dadda_multiplier.v
	mkdir -p sim
	cd sim && iverilog -o mul_tb -g2012 -Wall -Ptb.N=$(NUM_BITS) ../tb.v ../dadda_multiplier.v

run_multiplier_tb: multiplier_tb
	cd sim && ./mul_tb

clean:
	rm -f dadda_multiplier.v
	rm -rf sim
