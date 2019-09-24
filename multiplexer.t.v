`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();

	reg address0, address1, in0, in1, in2, in3;
	wire nAd0, nAd1, wA, wB, wC, wD, out;

	structuralMultiplexer dut(address0, address1, in0, in1, in2, in3, nAd0, nAd1, out);

  initial begin
	$display("A0 | A1 | In0 | In1 | In2 | In3 | Out| Expected Output");
	address0 = 0; address1 = 0; in0 = 1; in1 = 0; in2 = 0; in3 = 0; #50
	$display("%b  | %b  | %b   | %b   | %b   | %b   | %b | In0", address0, address1, in0, in1, in2, in3, out);
	address0 = 0; address1 = 1; in0 = 0; in1 = 1; in2 = 0; in3 = 0; #50
	$display("%b  | %b  | %b   | %b   | %b   | %b   | %b | In1", address0, address1, in0, in1, in2, in3, out);
	address0 = 1; address1 = 0; in0 = 0; in1 = 0; in2 = 1; in3 = 0; #50
	$display("%b  | %b  | %b   | %b   | %b   | %b   | %b | In2", address0, address1, in0, in1, in2, in3, out);
	address0 = 1; address1 = 1; in0 = 0; in1 = 0; in2 = 0; in3 = 1; #50
	$display("%b  | %b  | %b   | %b   | %b   | %b   | %b | In3", address0, address1, in0, in1, in2, in3, out);
  end
  
	initial begin
	$dumpfile("<multiplexer>.vcd");
	$dumpvars(structuralMultiplexer);
	$finish();

endmodule
