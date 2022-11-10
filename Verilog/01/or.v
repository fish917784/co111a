module Or(input a,b, output out);
wire na,nb;
not g0(na,a);
not g1(nb,b);
nand g2(out, na,nb);
endmodule

module Or_test;
reg a,b;
wire out;

Or g(a,b,out);

initial
begin
    a=0;
    b=0;
    $monitor("%4dns a=%d b=%d out=%d",$stime,a,b,out);
end

always #50 begin
    a=a+1;
end

always #100 begin
    b=b+1;
end

initial #150 $finish;
endmodule