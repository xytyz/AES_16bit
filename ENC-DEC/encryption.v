`timescale 1ns / 1ps

module encryption(
    input [255:0] codein,
    input [255:0] key,
	output[255:0] codeout
    );
	 
    wire [255:0] r0_out;
    wire [255:0] r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out;
    wire [255:0] keyout1,keyout2,keyout3,keyout4,keyout5,keyout6,keyout7,keyout8,keyout9,keyout10;
	 
	assign r0_out = codein^key;
		
		rounds r1(.clk(clk),.count(4'b0000),.code(r0_out),
					.keyin(key),.keyout(keyout1),
					.altered(r1_out));
						
		rounds r2(.clk(clk),.count(4'b0001),.code(r1_out),
					.keyin(keyout1),.keyout(keyout2),
					.altered(r2_out));
					
		rounds r3( .clk(clk),.count(4'b0010),.code(r2_out),
					.keyin(keyout2),.keyout(keyout3),
					.altered(r3_out));
					
		rounds r4(.clk(clk),.count(4'b0011),.code(r3_out),
					.keyin(keyout3),.keyout(keyout4),
					.altered(r4_out));
    
		rounds r5(.clk(clk),.count(4'b0100),.code(r4_out),
					.keyin(keyout4),.keyout(keyout5),
					.altered(r5_out));
    
	 	rounds r6(.clk(clk),.count(4'b0101),.code(r5_out),
					.keyin(keyout5),.keyout(keyout6),
					.altered(r6_out));
    
	 	rounds r7(.clk(clk),.count(4'b0110),.code(r6_out),
					.keyin(keyout6),.keyout(keyout7),
					.altered(r7_out));
    
	 	rounds r8(.clk(clk),.count(4'b0111),.code(r7_out),
					.keyin(keyout7),.keyout(keyout8),
					.altered(r8_out));
    
	 	rounds r9(.clk(clk),.count(4'b1000),.code(r8_out),
					.keyin(keyout8),.keyout(keyout9),
					.altered(r9_out));
					
		rounds r10(.clk(clk),.count(4'b1001),.code(r9_out),
					.keyin(keyout9),.keyout(keyout10),
					.altered(codeout));
 
endmodule
