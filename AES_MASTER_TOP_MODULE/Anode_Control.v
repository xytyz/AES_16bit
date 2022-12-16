module Anode_Control(
    input clkin, reset,
    output reg [3:0] Anode
);

wire [1:0] count;
Ref_Counter refcount1(.clkin(clkin),
                      .reset(reset),
                      .count(count));

always@(count)
begin
    case(count)
        2'b00 : Anode<= 4'b1110;
        2'b01 : Anode<= 4'b1101;
        2'b10 : Anode<= 4'b1011;
        2'b11 : Anode<= 4'b0111;
    endcase
end
endmodule
