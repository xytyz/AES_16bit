`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2023 00:44:38
// Design Name: 
// Module Name: refresh_counter
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


module refresh_counter(
input refresh_clock,
output reg [1:0] refreshcounter=0
    );
    always@(posedge refresh_clock)
    refreshcounter<= refreshcounter+1;
endmodule
