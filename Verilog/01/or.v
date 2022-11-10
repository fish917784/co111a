`include "ch01.v"

module Or_test;
reg a,b;
wire out;

Or g(a,b,out);

initial
begin
    a=0;
    b=0;
    $monitor("%4dns Or: a=%d b=%d out=%d",$stime,a,b,out);
end

always #50 begin
    b=b+1;
end

always #100 begin
    a=a+1;
end

initial #150 $finish;
endmodule