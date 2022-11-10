module Nand(input a, b, output out);
    nand (out, a, b);
endmodule

module nandtest;
reg a,b;
wire ab;

Nand g (a, b, ab);

initial
begin
    a=0;
    b=0;
    $monitor("%4dns b=%d a=%d abnand=%d", $stime, b, a, ab);
end

always #50 begin
    a=a+1;
end

always #100 begin
    b=b+1;
end

initial #500 $finish;

endmodule