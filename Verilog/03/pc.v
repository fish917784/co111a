`include "ch03.v"

module PC_test;
reg[15:0] in;
reg load, inc, reset, clock;
wire[15:0] out;

PC g(in, load, inc, reset, clock, out);

initial begin
    clock=0;
    $monitor("%4dns in=%d load=%d inc=%d reset=%d clock=%d out=%d", $stime, in, load, inc, reset, clock, out);
    inc=0;
    load=0;
    reset=0;
    in=15;
    #4 load=1;
    #2 load=0;
    #2;
    #2 inc=1;
    #8 inc=0;
    #4 reset=1;
    #2 reset=0;
    #2 load=1;
    #2 load=0;
    #2 $finish;
end

always #1 begin
    clock=~clock;
end
endmodule