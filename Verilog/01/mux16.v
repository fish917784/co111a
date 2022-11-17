`include "ch01.v"

module Mux16_test;
reg[15:0] a,b;
reg sel;
wire[15:0] out;

Mux16 g(a,b,sel,out);

initial
begin
    a=16'h0;
    b=16'h1;
    sel=0;
    $monitor("%4dns a=%x b=%x sel=%d out=%x",$stime,a,b,sel,out);
end

always #50 begin
    sel=sel+1;
end

initial #100 $finish;
endmodule