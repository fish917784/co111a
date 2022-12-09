`include "ch03.v"

module Register_test;
reg[15:0] in;
reg clock, load;
wire[15:0] out;

Register g(in, clock, load, out);

initial
begin
    clock=0;
    load=0;
    in=0;
    $monitor("%4dns in=%d clock=%d load=%d out=%d", $stime, in, clock, load, out);
end

always #2 begin
    clock=~clock;
end

always #6 begin
    in=in+10;
end

always #10 begin
    load=load+1;
end

initial #60 $finish;
endmodule