`include "..\02\ch02.v"

module DFF(input in, clock, output out);
    reg q;
    assign out = q;
    always @(posedge clock) begin
        q = in;
    end
endmodule

module Bit(input in, clock, load, output out);
    wire md;
    Mux g0(out, in, load, md);
    DFF g1(md, clock, out);
endmodule

module Register(input[15:0] in, input clock, load, output[15:0] out);
    Bit g0(in[0], clock, load, out[0]);
    Bit g1(in[1], clock, load, out[1]);
    Bit g2(in[2], clock, load, out[2]);
    Bit g3(in[3], clock, load, out[3]);
    Bit g4(in[4], clock, load, out[4]);
    Bit g5(in[5], clock, load, out[5]);
    Bit g6(in[6], clock, load, out[6]);
    Bit g7(in[7], clock, load, out[7]);
    Bit g8(in[8], clock, load, out[8]);
    Bit g9(in[9], clock, load, out[9]);
    Bit g10(in[10], clock, load, out[10]);
    Bit g11(in[11], clock, load, out[11]);
    Bit g12(in[12], clock, load, out[12]);
    Bit g13(in[13], clock, load, out[13]);
    Bit g14(in[14], clock, load, out[14]);
    Bit g15(in[15], clock, load, out[15]);
endmodule

module RAM8(input[15:0] in, input[2:0] address, input clock, load, output[15:0] out);
    wire[15:0] o0, o1, o2, o3, o4, o5, o6, o7;

    DMux8Way g0(load, address, r0, r1, r2, r3, r4, r5, r6, r7);

    Register g1(in, clock, r0, o0);
    Register g2(in, clock, r1, o1);
    Register g3(in, clock, r2, o2);
    Register g4(in, clock, r3, o3);
    Register g5(in, clock, r4, o4);
    Register g6(in, clock, r5, o5);
    Register g7(in, clock, r6, o6);
    Register g8(in, clock, r7, o7);

    Mux8Way16 g9(o0, o1, o2, o3, o4, o5, o6, o7, address, out);
endmodule