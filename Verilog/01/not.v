module Not(input in, output out);
    not (out, in);
endmodule

module not_test;
reg in;
wire out;

Not g1(in, out);

initial
begin
    in=0;
    $monitor("%4dns in=%d out=%d", $stime,in,out);
end

always #50 begin
    in=in+1;
end

initial #200 $finish;

endmodule