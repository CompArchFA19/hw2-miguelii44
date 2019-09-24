// Decoder circuit

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);

	wire nAd0;
	wire nAd1;
	not Ainv(nAd0, address0);
	not Binv(nAd1, address0);
	and out0(out0, nAd0, nAd, enable);
	and out1(out1, address0, nAd1, enable);
	and out2(out2, nAd0, address1, enable);
	and out3(out3, address0, address1, enable);

endmodule

