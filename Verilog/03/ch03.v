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