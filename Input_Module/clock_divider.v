`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2023 00:35:51
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    output reg dclk=0,
    input wire clk //100MHz
    );

localparam dval=208332; //60hz
integer counter_val=0;

always@(posedge clk )
begin
    if(counter_val==dval)
        counter_val<=0;
    else
        counter_val<=  counter_val+1;
end
always @(posedge clk)
begin
    if(counter_val == dval)
        dclk=~dclk;
    else
        dclk<=dclk;
end
endmodule
