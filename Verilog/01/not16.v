`include "ch01.v"

module Not16_test;
reg[15:0] in;
wire[15:0] out;

Not16 g(in[15:0],out[15:0]);

initial
begin
    in=16'b0000;
    $monitor("%dns in=%b out=%b",$stime,in,out);
end

always #50 begin
    in=in+1000;
end

initial #500 $finish;
endmodule