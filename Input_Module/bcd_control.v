module bcd_control(
input [3:0] d1,
input [3:0] d2,
input [3:0] d3,
input [3:0] d4,
input [1:0] refreshcounter,
output reg [3:0] digit=0 );
always@(refreshcounter)
begin
    case (refreshcounter)
        2'd0:
         digit=d1; //digit 1
        2'd1:
         digit=d2; //digit 2
        2'd2:
         digit=d3; //digit 3
        2'd3:
         digit=d4; //digit 4
    endcase        
end
endmodule