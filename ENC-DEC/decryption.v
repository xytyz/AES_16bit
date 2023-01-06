
module decryption(
    input [15:0] codein,
    input [15:0] key,
    input [15:0] prev,
    output[15:0] codeout
    );
	 
    wire [15:0] r0_out;
    wire [15:0] r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out,r10_out;
    wire [15:0] keyout1,keyout2,keyout3,keyout4,keyout5,keyout6,keyout7,keyout8,keyout9,keyout10;
	 
	assign r0_out = codein^key;
	assign codout = prev;
		invRound r1(.count(4'b0000),.code(r0_out),
					.keyin(key),.keyout(keyout1),
					.altered(r1_out));
						
		invRound r2(.count(4'b0001),.code(r1_out),
					.keyin(keyout1),.keyout(keyout2),
					.altered(r2_out));
					
        invRound r3( .count(4'b0010),.code(r2_out),
					.keyin(keyout2),.keyout(keyout3),
					.altered(r3_out));
					
        invRound r4(.count(4'b0011),.code(r3_out),
					.keyin(keyout3),.keyout(keyout4),
					.altered(r4_out));
    
	 	invRound r5(.count(4'b0100),.code(r4_out),
					.keyin(keyout4),.keyout(keyout5),
					.altered(r5_out));
    
	 	invRound r6(.count(4'b0101),.code(r5_out),
					.keyin(keyout5),.keyout(keyout6),
					.altered(r6_out));
    
	 	invRound r7(.count(4'b0110),.code(r6_out),
					.keyin(keyout6),.keyout(keyout7),
					.altered(r7_out));
    
	 	invRound r8(.count(4'b0111),.code(r7_out),
					.keyin(keyout7),.keyout(keyout8),
					.altered(r8_out));
    
	 	invRound r9(.count(4'b1000),.code(r8_out),
					.keyin(keyout8),.keyout(keyout9),
					.altered(r9_out));

		invRound r10(.count(4'b1001),.code(r9_out),
					.keyin(keyout9),.keyout(keyout10),
					.altered(r10_out));
        
endmodule