`timescale 1ns / 1ps
module AES_MASTER_TOP(
    input [3:0] ip1, ip2, ip3, ip4,
    input Apb, Bpb, Cpb, Dpb, Spb,
    input CLKIN,
    output [3:0] ANODE,
    output [6:0] CATHODE,
    output [3:0] LEDOUT
    );
    
    wire RESET = 1'b0;
    wire PA, PB, PC, PD, P_MID;
    wire [15:0] INPUTREG;
    wire [15:0] ENCROUT;
    wire [4:0] CATHIN;
                                  
    //Debounce filters for all pushbuttons
    Debounce_Filter Pmid (.Clk(CLKIN), .reset(RESET),
                          .switch_in(Spb), .switch_out(P_MID));
                          
    /*Debounce_Filter PBa (.Clk(CLKIN), .reset(RESET),
                          .switch_in(Apb), .switch_out(PA));
                          
    Debounce_Filter PBb (.Clk(CLKIN), .reset(RESET),
                          .switch_in(Bpb), .switch_out(PB));
                          
    Debounce_Filter PBc (.Clk(CLKIN), .reset(RESET),
                          .switch_in(Cpb), .switch_out(PC));

    Debounce_Filter PBd (.Clk(CLKIN), .reset(RESET),
                          .switch_in(Dpb), .switch_out(PD));*/
    
    
    wire muxselect;
    //D_Latch(.D(P_MID), .Enable(P_MID), .Q(muxselect));          //to latch the value at 1 when the centre pushbutton is pressed         
    Switch_Logic SL_WRAP(.clkin(CLKIN), .Inp(P_MID), .SelOut(muxselect));
   
              
    //Main slide switch input, Encrypted Output, Decrypted Output                      
    User_Input UserInputWRAP(.ip1(ip1), .ip2(ip2), .ip3(ip3), .ip4(ip4),
                             .enable(muxselect), .inpreg(INPUTREG));
    AESin AESinWRAP(.clk(CLKIN), .inpu(INPUTREG), .outp(ENCROUT));
    
    
    //Password detection module
    wire [4:0] DigitEncrOut, DigitUserOut;
    wire Decenable, decmuxselect;
    TOP_PW_Det PasswordDetWRAP(.Apb(Apb), .Bpb(Bpb), .Cpb(Cpb), .Dpb(Dpb),
                               .CLKIN(CLKIN), .RESET(RESET),
                               .LEDOUT(LEDOUT),
                               .ENCRINP(ENCROUT),
                               .CHARACTER(DigitEncrOut),
                               .DECENABLE(Decenable));                         
    Switch_Logic SLDecry_WRAP(.clkin(CLKIN), .Inp(Decenable), .SelOut(decmuxselect));
    
    //module to output cathode values for user module
    UserInp_Out UseroutWRAP(.clkin(CLKIN), .reset(RESET),       
                            .inpreg(INPUTREG), .Digit(DigitUserOut));
                            
    //MUX for User Input and Pwcheck module selection
    wire [4:0] DMuxIp1;
    Bus_Mux_CathOut BM_to_DecrMux(.sel(~muxselect),
                                  .A(DigitEncrOut),
                                  .B(DigitUserOut),
                                  .Y(DMuxIp1));
    
    Bus_Mux_CathOut Decr_MUX(.sel(decmuxselect),
                                  .A(DMuxIp1),
                                  .B(DigitUserOut),
                                  .Y(CATHIN));
                                  
    Anode_Control anodectrlwrap1(.clkin(CLKIN), .reset(RESET), .Anode(ANODE));
    Cathode_Control cathctrlwrap1(.Digit(CATHIN), 
                                  .Cathode(CATHODE));
endmodule
