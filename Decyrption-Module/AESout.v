`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2022 23:16:01
// Design Name: 
// Module Name: AESout
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


module AESout(
output[15:0] outp, 
		input[15:0] inpu, 
		input clk
    );
 
	decryption u1(.clk(clk),.codein(inpu),.key(16'habcd),.codeout(outp));
endmodule
