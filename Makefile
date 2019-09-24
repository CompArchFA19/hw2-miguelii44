# Simple Verilog simulation Makefile example

ICARUS_OPTIONS := -Wall
IVERILOG := iverilog $(ICARUS_OPTIONS)
SIM := vvp

TEST := adder


adder.vvp: adder.t.v adder.v
	$(IVERILOG) -o $@ $<

multiplexer.vvp: multiplexer.t.v multiplexer.v
	$(IVERILOG) -o $@ $<

decoder.vvp: decoder.t.v decoder.v
	$(IVERILOG) -o $@ $<

# Shortcut (phony) targets for convenience
compile: $(TEST).vvp

run: $(TEST).vvp
	$(SIM) $<

clean:
	-rm -f $(TEST).vvp

.PHONY: compile run clean
