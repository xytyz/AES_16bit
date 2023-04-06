module shiftRow(
	output [15:0]  altered,
	input [15:0] code
    );
	
	reg [31 : 0] w0, w1, w2, w3, w4, w5, w6, w7;
	reg [31 : 0] ws0, ws1, ws2, ws3, ws4, ws5, ws6, ws7;

	assign w0 = code[127 : 096];
	assign w1 = code[095 : 064];
	assign w2 = code[063 : 032];
	assign w3 = code[031 : 000];

	assign ws0 = {w0[31 : 24], w1[23 : 16], w2[15 : 08], w3[07 : 00]};
	assign ws1 = {w1[31 : 24], w2[23 : 16], w3[15 : 08], w4[07 : 00]};
	assign ws2 = {w2[31 : 24], w3[23 : 16], w4[15 : 08], w5[07 : 00]};
	assign ws3 = {w3[31 : 24], w4[23 : 16], w5[15 : 08], w6[07 : 00]};
	assign ws4 = {w4[31 : 24], w5[23 : 16], w6[15 : 08], w7[07 : 00]};
	assign ws5 = {w5[31 : 24], w6[23 : 16], w7[15 : 08], w0[07 : 00]};
	assign ws6 = {w6[31 : 24], w7[23 : 16], w0[15 : 08], w1[07 : 00]};
	assign ws7 = {w7[31 : 24], w0[23 : 16], w1[15 : 08], w2[07 : 00]};

	altered = {ws0, ws1, ws2, ws3, ws4, ws5, ws6, ws7};

endmodule
