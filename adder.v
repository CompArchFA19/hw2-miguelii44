// Adder circuit

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
   
    wire c, d, e;
	xor ABxor(c, a, b);
	xor sumxor(sum, c, carryin);
	and carryand(d, c, carryin);
	and ABand(e, a, b);
	or carryoutor(carryout, d, e);

initial begin
$dumpfile("<adder>.vcd");
$dumpvars();
$finish():

endmodule
