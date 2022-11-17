`timescale 1ns / 1ps
//makes a 10ms pulse to 800ms
module PBInp_Long(
    input a, b, c, d, 
    input clkin, reset,
    output aout, bout, cout, dout
    );
    
    wire a_pb, b_pb, c_pb, d_pb;
    
    
    Debounce_Filter DA(.Clk(clkin), .reset(reset),
                       .switch_in(a), .switch_out(a_pb));
    Pulse_Elongate_800ms PEa(.clk(clkin), 
                             .trigger(a_pb), 
                             .reset(1'b0), 
                             .pulse(aout));   
                             
    Debounce_Filter DB(.Clk(clkin), .reset(reset),
                       .switch_in(b), .switch_out(b_pb));
    Pulse_Elongate_800ms PEb(.clk(clkin), 
                             .trigger(b_pb), 
                             .reset(1'b0), 
                             .pulse(bout));  
                             
    Debounce_Filter DC(.Clk(clkin), .reset(reset),
                       .switch_in(c), .switch_out(c_pb));
    Pulse_Elongate_800ms PEc(.clk(clkin), 
                             .trigger(c_pb), 
                             .reset(1'b0), 
                             .pulse(cout));   
                             
    Debounce_Filter DD(.Clk(clkin), .reset(reset),
                       .switch_in(d), .switch_out(d_pb));
    Pulse_Elongate_800ms PEd(.clk(clkin), 
                             .trigger(d_pb), 
                             .reset(1'b0), 
                             .pulse(dout));                   
endmodule
