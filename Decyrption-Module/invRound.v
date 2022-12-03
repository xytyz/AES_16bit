`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2022 22:43:41
// Design Name: 
// Module Name: invRound
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module invRound(
	output[15:0] altered,
	input [15:0] code,
	input [3:0] count,
	input [15:0] keyin,
	output [15:0] keyout,
	input clk
	);
	wire [15:0]computed;
	
	keyGen k1(.count(count),.key(keyin),.keyout(keyout));
	invComputation c1(.code(code),.altered(computed));	

	assign altered= keyout^computed;
	
endmodule
