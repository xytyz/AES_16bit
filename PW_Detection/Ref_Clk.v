module Ref_Clk(
    output reg clkout,
    input clkin, reset
);

reg [28:0]count;

always@(posedge clkin or posedge reset)
begin
    if(reset)
    begin
        count<=0;
        clkout<=0;
    end
    
    else if(count==28'd208_332)
    begin
        clkout<=~clkout;
        count<=0;
    end
    else
        count<=count+1;
end
endmodule