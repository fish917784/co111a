`include "ch01.v"

module And16_test;
reg[15:0] a,b;
wire[15:0] out;

And16 g(a[15:0],b[15:0],out[15:0]);

initial
begin
    a=16'b0000;
    b=16'b0000;
    $monitor("%dns a=%b b=%b out=%b",$stime,a,b,out);
end

always #50 begin
    b=b+1000;
end

always #100 begin
    a=a+1000;
end

initial #500 $finish;
endmodule