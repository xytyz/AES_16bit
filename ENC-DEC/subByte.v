
module subByte(	
	output [15:0] altered,
	input[15:0] code
    );
	
	wire [7:0] w1,w2;
	assign w1 = code[7:0];
	assign w2 = code[15:8];
	
	LUT_verilog s1(.outp(altered[7:0]),.inp(w1));
	LUT_verilog s2(.outp(altered[15:8]),.inp(w2));
	
endmodule
