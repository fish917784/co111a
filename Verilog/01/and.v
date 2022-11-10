module And(input a,b, output out);
wire ab;
nand g0(ab, a, b);
not g1(out, ab);
endmodule

module And_test;
reg a,b;
wire out;
And g3(a,b,out);

initial
begin
    a=0;
    b=0;
    $monitor("%4dns a=%d, b=%d, out=%d",$stime,a,b,out);
end

always #50 begin
    a=a+1;
end

always #100 begin
    b=b+1;
end

initial #150 $finish;

endmodule