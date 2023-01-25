`timescale 1ns / 1ps
module top(
input wire clk, //100MHz
input wire [15:0] switch,
output wire [3:0]anode,
output wire [6:0]cathode);

wire refreshclk;
wire [1:0]refreshcounter;
wire[3:0] digit;

clock_divider cd (.clk(clk),.dclk(refreshclk));
refresh_counter rc (.refresh_clock(refreshclk),.refreshcounter(refreshcounter));
anode_control ac(.refreshcounter(refreshcounter),.anode(anode));
bcd_control bc(.d1(switch[3:0]),.d2(switch[7:4]),.d3(switch[11:8]),.d4(switch[15:12]),.refreshcounter(refreshcounter),.digit(digit));
cathode c (.Digit(digit),.Cathode(cathode));
endmodule