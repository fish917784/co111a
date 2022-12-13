`include "..\03\ch03.v"

module RAM8K(input[15:0] in, input[12:0] address, input clock, load, output[15:0] out);
    reg[15:0] m[0:2**13-1];

    assign out = m[address];

    always @(posedge clock) begin
        if (load) m[address] = in;
    end
endmodule

module Keyboard(output[15:0] out);
    reg[15:0] o=16'h0F0F;
    assign out = o;
endmodule

module Memory(input[15:0] in, input[14:0] address, input clock, load, output[15:0] out);
    wire[15:0] o0, o1, o2;

    DMux4Way g0(load, address[14:13], r0, r1, r2, r3);
    Or g1(r0, r1, rload);
    RAM16K ram16k(in, address[13:0], clock, rload, o0);
    RAM8K screen(in, address[12:0], clock, r2, o1);
    Keyboard keyboard(o2);
    Mux4Way16 g2(o0, o0, o1, o2, address[14:13], out);
endmodule

