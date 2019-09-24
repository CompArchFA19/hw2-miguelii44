// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;

    structuralFullAdder adder  (sum, carryout, a, b, carryin);

    initial begin
        $display("A | B | Cin | Cout | Sum|Exp Sum|Exp Out ");
	a = 0; b = 0; carryin = 0; #50
	$display("%b | %b | %b   | %b    | %b  |  0    |   0", a, b, carryin, carryout, sum);
	a = 0; b = 0; carryin = 1; #50
	$display("%b | %b | %b   | %b    | %b  |  1    |   0", a, b, carryin, carryout, sum);
	a = 0; b = 1; carryin = 0; #50
	$display("%b | %b | %b   | %b    | %b  |  1    |   0", a, b, carryin, carryout, sum);
	a = 0; b = 1; carryin = 1; #50
	$display("%b | %b | %b   | %b    | %b  |  0    |   1", a, b, carryin, carryout, sum);
	a = 1; b = 0; carryin = 0; #50
	$display("%b | %b | %b   | %b    | %b  |  1    |   0", a, b, carryin, carryout, sum);
	a = 1; b = 0; carryin = 1; #50
	$display("%b | %b | %b   | %b    | %b  |  0    |   1", a, b, carryin, carryout, sum);
	a = 1; b = 1; carryin = 0; #50
	$display("%b | %b | %b   | %b    | %b  |  0    |   1", a, b, carryin, carryout, sum);
	a = 1; b = 1; carryin = 1; #50
	$display("%b | %b | %b   | %b    | %b  |  1    |   1", a, b, carryin, carryout, sum);
    end
endmodule
