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

module And16(input[15:0]a,b,output[15:0]out);
    And g0(a[0],b[0],out[0]);
    And g1(a[1],b[1],out[1]);
    And g2(a[2],b[2],out[2]);
    And g3(a[3],b[3],out[3]);
    And g4(a[4],b[4],out[4]);
    And g5(a[5],b[5],out[5]);
    And g6(a[6],b[6],out[6]);
    And g7(a[7],b[7],out[7]);
    And g8(a[8],b[8],out[8]);
    And g9(a[9],b[9],out[9]);
    And g10(a[10],b[10],out[10]);
    And g11(a[11],b[11],out[11]);
    And g12(a[12],b[12],out[12]);
    And g13(a[13],b[13],out[13]);
    And g14(a[14],b[14],out[14]);
    And g15(a[15],b[15],out[15]);
endmodule

module Not16(input[15:0]in,output[15:0]out);
    Not g0(in[0],out[0]);
    Not g1(in[1],out[1]);
    Not g2(in[2],out[2]);
    Not g3(in[3],out[3]);
    Not g4(in[4],out[4]);
    Not g5(in[5],out[5]);
    Not g6(in[6],out[6]);
    Not g7(in[7],out[7]);
    Not g8(in[8],out[8]);
    Not g9(in[9],out[9]);
    Not g10(in[10],out[10]);
    Not g11(in[11],out[11]);
    Not g12(in[12],out[12]);
    Not g13(in[13],out[13]);
    Not g14(in[14],out[14]);
    Not g15(in[15],out[15]);
endmodule

module Mux(input a,b,sel,output out);
    wire notsel,aandnotsel,bandsel;
    Not g0(sel,notsel);
    And g1(notsel,a,aandnotsel);
    And g2(b,sel,bandsel);
    Or g3(aandnotsel,bandsel,out);
endmodule

module Mux16(input[15:0]a,b,input sel,output[15:0] out);
    Mux g0(a[0],b[0],sel,out[0]);
    Mux g1(a[1],b[1],sel,out[1]);
    Mux g2(a[2],b[2],sel,out[2]);
    Mux g3(a[3],b[3],sel,out[3]);
    Mux g4(a[4],b[4],sel,out[4]);
    Mux g5(a[5],b[5],sel,out[5]);
    Mux g6(a[6],b[6],sel,out[6]);
    Mux g7(a[7],b[7],sel,out[7]);
    Mux g8(a[8],b[8],sel,out[8]);
    Mux g9(a[9],b[9],sel,out[9]);
    Mux g10(a[10],b[10],sel,out[10]);
    Mux g11(a[11],b[11],sel,out[11]);
    Mux g12(a[12],b[12],sel,out[12]);
    Mux g13(a[13],b[13],sel,out[13]);
    Mux g14(a[14],b[14],sel,out[14]);
    Mux g15(a[15],b[15],sel,out[15]);
endmodule

module Mux4Way16(input[15:0] a,b,c,d,input[1:0] sel,output[15:0] out);
    wire[15:0] ab,cd;
    Mux16 g0(a,b,sel[0],ab);
    Mux16 g1(c,d,sel[0],cd);
    Mux16 g2(ab,cd,sel[1],out);
endmodule

module Mux8Way16(input[15:0] a,b,c,d,e,f,g,h,input[2:0] sel,output[15:0] out);
    wire[15:0] abcd,efgh;
    Mux4Way16 g0(a,b,c,d,sel[1:0],abcd);
    Mux4Way16 g1(e,f,g,h,sel[1:0],efgh);
    Mux16 g2(abcd,efgh,sel[2],out);
endmodule

module DMux(input in,sel,output a,b);
    wire notsel;
    And g0(in,sel,b);
    Not g1(sel,notsel);
    And g2(notsel,in,a);
endmodule

module DMux4Way(input in,input[1:0] sel,output a,b,c,d);
    wire m0,m1;
    DMux g0(in,sel[0],m0,m1);
    DMux g1(m0,sel[1],a,c);
    DMux g2(m1,sel[1],b,d);
endmodule

module DMux8Way(input in,input[2:0] sel,output a,b,c,d,e,f,g,h);
    wire m0,m1;
    DMux g0(in,sel[2],m0,m1);
    DMux4Way g1(m0,sel[1:0],a,b,c,d);
    DMux4Way g2(m1,sel[1:0],e,f,g,h);
endmodule