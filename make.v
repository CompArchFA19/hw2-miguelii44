# Simple Verilog simulation Makefile example

ICARUS_OPTIONS := -Wall
IVERILOG := iverilog $(ICARUS_OPTIONS)
SIM := vvp

CIRCUITS := SR_latch.v
TEST := SR_latch-display


# Pattern rule for compiling vvp (Icarus assembly) from a testbench
make decoder.vvp: decoder.t.v decoder.v
        $iverilog -Wall -o decoder.vvp decoder.t.v

multiplexer.vvp: multiplexer.t.v multiplexer.v
        $iverilog -Wall -o multiplexer.vvp multiplexer.t.v

.vvp: adder.t.v adder.v
        $iverilog -Wall -o adder.vvp adder.t.v

adder.vvp: adder.t.v $(CIRCUITS)
	$iverilog -Wall -o adder.vvp addver.t.v

# Shortcut (phony) targets for convenience
compile: $(TEST).vvp

run: $(TEST).vvp
	$(SIM) $<

clean:
	-rm -f $(TEST).vvp


.PHONY: make compile run clean
