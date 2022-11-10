module Nand(input a, b, output out);
    nand g0(out, a, b);
endmodule

module Not(input in, output out);
    Nand g0(in,in,out);
endmodule

module Or(input a,b, output out);
    wire na,nb;
    Not g0(a,na);
    Not g1(b,nb);
    Nand g2(na,nb,out);
endmodule

module And(input a,b, output out);
    wire ab;
    Nand g0(a,b,ab);
    Not g1(ab,out);
endmodule

module Xor(input a,b, output out);
    wire anandb,nanda,nandb;
    Nand g0(a,b,anandb);
    Nand g1(a,anandb,nanda);
    Nand g2(b, anandb,nandb);
    Nand g3(nanda,nandb,out);
endmodule

module Or8Way(input[7:0] in,output out);
    wire or01,or23,or45,or67,or0123,or4567;
    Or g0(in[0],in[1],or01);
    Or g1(in[2],in[3],or23);
    Or g2(in[4],in[5],or45);
    Or g3(in[6],in[7],or67);
    Or g4(or01,or23,or0123);
    Or g5(or45,or67,or4567);
    Or g6(or0123,or4567,out);
endmodule

module Or16(input[15:0]a,b, output[15:0]out);
    Or g0(a[0],b[0],out[0]);
    Or g1(a[1],b[1],out[1]);
    Or g2(a[2],b[2],out[2]);
    Or g3(a[3],b[3],out[3]);
    Or g4(a[4],b[4],out[4]);
    Or g5(a[5],b[5],out[5]);
    Or g6(a[6],b[6],out[6]);
    Or g7(a[7],b[7],out[7]);
    Or g8(a[8],b[8],out[8]);
    Or g9(a[9],b[9],out[9]);
    Or g10(a[10],b[10],out[10]);
    Or g11(a[11],b[11],out[11]);
    Or g12(a[12],b[12],out[12]);
    Or g13(a[13],b[13],out[13]);
    Or g14(a[14],b[14],out[14]);
    Or g15(a[15],b[15],out[15]);
endmodule