// Multiplexer circuit
`timescale 1 ns / 1 ps
module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address0, address1};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    
    input address0,
    input address1,
    input in0,
    input in1,
    input in2,
    input in3, 
    output nAd0,
    output nAd1,
    output out
);

	wire wA;
	wire wB;
	wire wC;
	wire wD;
	wire nAd0;
 	wire nAd1;
	not addr0inv(nAd0, address0);
	not addr1inv(nAd1, address1);
	and and1(wA, in0, nAd0, nAd1);
	and and2(wB, in1, nAd0, address1);
	and and3(wC, in2, nAd1, address0);
	and and4(wD, in3, address0, address1);
	or finalor(out, wA, wB, wC, wD);

endmodule


