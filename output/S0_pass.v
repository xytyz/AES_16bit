`timescale 1ns / 1ps

module S0_pass(
   // input [3:0] inp1, inp2, inp3, inp4,
    input reset,
    input clk,
    output [3:0] anode,
    output reg [7:0] Y
    
    );
    
                      
wire [1:0] ref_count1;
           
Ref_counter x2(.clkin(clk),
               .ref_counter_reset(reset),
               .ref_count(ref_count1));  
               
wire [4:0] alphan1,alphan2,alphan3,alphan4; //for pass input to cathode
wire [4:0] alph1,alph2,alph3,alph4; //for encrypted op input to cathode
wire [7:0] cathode1,cathode2; // PASS and ENCR_OP respectively
reg [4:0] output1; // anode for pass
reg [4:0] output2; // anode for encr_op

always@(ref_count1)
	begin
		case(ref_count1)
		2'd0: output1 <= alphan1; // alphan1 value rightmost
		2'd1: output1 <= alphan2; // alphan2 value
		2'd2: output1 <= alphan3; // alphan3 value
		2'd3: output1 <= alphan4; // alphan4 value leftmost
		endcase
	end   

always@(ref_count1)
	begin
		case(ref_count1)
		2'd0: output2 <= alph1; // alphan1 value rightmost
		2'd1: output2 <= alph2; // alphan2 value
		2'd2: output2 <= alph3; // alphan3 value
		2'd3: output2 <= alph4; // alphan4 value leftmost
		endcase
	end 
                
Anode_control x4(.clkin_ac(clk),
                 .reset(reset),
                 .anode(anode));
                 
Pass_to_cathode x5(.alphan(output1),
                   .cathode(cathode1));
                   
encr_to_cathode x6 (.alph(output2),
                    .cathode(cathode2));
                    
      
                               
    reg Qpass;
    reg Qencr;
    reg [27:0] two_second_counter;
    reg two_sec_clk;
    
    
    // For 2 second clock //

always@(posedge clk)
    begin
        if(reset==1)
        begin
            two_second_counter <= 0;
            two_sec_clk <= 0;
        end
        else 
            begin
                if(two_second_counter == 28'd 1_9999_9999) 
                begin
                    two_second_counter <= 0;
                    two_sec_clk <= ~two_sec_clk;
                end
                else
                two_second_counter <= two_second_counter + 1;
            end
    end 

// hardwired values for pass and encr_op 
// Initially both are hardwired, but at final level, only pass will be hardwired and encr_op will be taken from Kshitij's block

        assign alphan2 = 5'd5;
        assign alphan3 = 5'd5;
        assign alphan4 = 5'd10;
        assign alphan1 = 5'd16;
        
        assign alph2 = 5'd6;
        assign alph3 = 5'd3;
        assign alph4 = 5'd11;
        assign alph1 = 5'd12;

// A mux for selecting between the two : PASS & ENCR_OP at an interval of @ sec providing the 2 second clock as select line 

always@(cathode1 or cathode2 or two_sec_clk)
    begin   
        if(two_sec_clk)
            Y = cathode1;
        else
            Y = cathode2;
    end 
   
                   
endmodule
