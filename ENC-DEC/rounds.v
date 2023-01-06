module rounds(
	output[15:0] altered,
	input [15:0] code,
	input [3:0] count,
	input [15:0] keyin,
	output [15:0] keyout);
	wire [15:0]computed;
	
	KeyGen k1(.count(count),.key(keyin),.keyout(keyout));
	computation c1(.code(code),.altered(computed));	

	assign altered= keyout^computed;
	
endmodule
