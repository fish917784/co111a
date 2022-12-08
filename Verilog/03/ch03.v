`include "..\02\ch02.v"

module DFF(input in, clock, output out);
    reg q;
    assign out = q;
    always @(poseedge clock) begin
        q = in;
    end
endmodule
