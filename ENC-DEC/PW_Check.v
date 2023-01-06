`timescale 1ns/1ns
module PW_Check(
    input a_pb, b_pb, c_pb, d_pb,
    input clkin,
    input reset,
    output reg pass_en
    //output reg ledoff
    );
    
    //wire a_pb, b_pb, c_pb, d_pb;        //OUTPUT OF DEBOUNCE FILTER
   // wire a_fsm, b_fsm, c_fsm, d_fsm;    //OUTPUT OF PULSE CHANGER MODULE
    wire clkout;
    reg [28:0] count;
    reg [1:0] pstate, nstate;
    wire [3:0] ins;
    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    
                      
//    Debounce_Filter Fa(.Clk(clkin), .reset(reset),
//                       .switch_in(a), .switch_out(a_pb));
//    Debounce_Filter Fb(.Clk(clkin), .reset(reset),
//                       .switch_in(b), .switch_out(b_pb));
//    Debounce_Filter Fc(.Clk(clkin), .reset(reset),
//                       .switch_in(c), .switch_out(c_pb));
//    Debounce_Filter Fd(.Clk(clkin), .reset(reset),
//                       .switch_in(d), .switch_out(d_pb));
    
    //for making the 10ms pulses into 800ms for the fsm
    /*
    PB_Longout PBa(.clkin(cin),.reset(reset), .pbinput(a_pb), .long_pb(a_fsm));
    PB_Longout PBb(.clkin(cin),.reset(reset), .pbinput(b_pb), .long_pb(b_fsm));
    PB_Longout PBc(.clkin(cin),.reset(reset), .pbinput(c_pb), .long_pb(c_fsm));
    PB_Longout PBd(.clkin(cin),.reset(reset), .pbinput(d_pb), .long_pb(d_fsm));
    */
    
//1s CLOCK GENERATOR                
//Clk_800ms clkdiv800ms(.Clkin(clkin), .Clkout(clkout));

assign ins = a_pb | b_pb | c_pb | d_pb;

//CHANGE OF STATE ACC TO CLK EDGE
always@(posedge clkin or posedge reset)
begin
    if(reset)
        pstate = s0; 
    else
        pstate = nstate;
end  


//STATE CHANGE LOGIC
always@(a_pb or b_pb or c_pb or d_pb or pstate)
begin
    case(pstate)
    s0 : begin
            if(a_pb || b_pb || c_pb || d_pb)
            begin
                nstate = s1;
                pass_en = 0;                //if one, activate dash module
            end
            else begin
                nstate = s0;
                pass_en = 0;                //if zero, activate pass module
            end
            end
            
    s1 : begin
            if(~a_pb && b_pb && ~c_pb && ~d_pb)begin
                nstate = s2;
                pass_en = 0;
            end
            else begin
                nstate = s0;
                pass_en = 1'b1;
            end
            end
            
    s2 : begin
            if(~a_pb && ~b_pb && c_pb && ~d_pb)begin
                nstate = s3;
                pass_en = 0;
            end
            else begin
                nstate = s0;
                pass_en = 1'b1;
            end
            end
            
    s3 : begin
            if(~a_pb && ~b_pb && ~c_pb && d_pb)begin
                pass_en = 1;
            end
            else begin
                nstate = s0;
                //pass_en = 1'b1;
            end
            end
    endcase
end
endmodule
