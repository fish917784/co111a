`include "..\01\ch01.v"

module HalfAdder(input a,b,output sum,carry);
    Xor g0(a,b,sum);
    And g1(a,b,carry);
endmodule

module FullAdder(input a,b,c,output sum,carry);
    wire ab,c1,c2;
    HalfAdder g0(a,b,ab,c1);
    HalfAdder g1(ab,c,sum,c2);
    Or g2(c1,c2,carry);
endmodule

module Add16(input[15:0] a,b,output[15:0] out);
    wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16;
    HalfAdder g0(a[0],b[0],out[0],s1);
    FullAdder g1(a[1],b[1],s1,out[1],s2);
    FullAdder g2(a[2],b[2],s2,out[2],s3);
    FullAdder g3(a[3],b[3],s3,out[3],s4);
    FullAdder g4(a[4],b[4],s4,out[4],s5);
    FullAdder g5(a[5],b[5],s5,out[5],s6);
    FullAdder g6(a[6],b[6],s6,out[6],s7);
    FullAdder g7(a[7],b[7],s7,out[7],s8);
    FullAdder g8(a[8],b[8],s8,out[8],s9);
    FullAdder g9(a[9],b[9],s9,out[9],s10);
    FullAdder g10(a[10],b[10],s10,out[10],s11);
    FullAdder g11(a[11],b[11],s11,out[11],s12);
    FullAdder g12(a[12],b[12],s12,out[12],s13);
    FullAdder g13(a[13],b[13],s13,out[13],s14);
    FullAdder g14(a[14],b[14],s14,out[14],s15);
    FullAdder g15(a[15],b[15],s15,out[15],s16);
endmodule

module Inc16(input[15:0] in,output[15:0] out);
    wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16;
    HalfAdder g0(in[0],1,out[0],s1);
    HalfAdder g1(in[1],s1,out[1],s2);
    HalfAdder g2(in[2],s2,out[2],s3);
    HalfAdder g3(in[3],s3,out[3],s4);
    HalfAdder g4(in[4],s4,out[4],s5);
    HalfAdder g5(in[5],s5,out[5],s6);
    HalfAdder g6(in[6],s6,out[6],s7);
    HalfAdder g7(in[7],s7,out[7],s8);
    HalfAdder g8(in[8],s8,out[8],s9);
    HalfAdder g9(in[9],s9,out[9],s10);
    HalfAdder g10(in[10],s10,out[10],s11);
    HalfAdder g11(in[11],s11,out[11],s12);
    HalfAdder g12(in[12],s12,out[12],s13);
    HalfAdder g13(in[13],s13,out[13],s14);
    HalfAdder g14(in[14],s14,out[14],s15);
    HalfAdder g15(in[15],s15,out[15],s16);
endmodule

module ALU(input[15:0]x,y, input zx,nx,zy,ny,f,no, output[15:0] out, output zr,ng);
    wire[15:0] xzx,nxzx,xnx,yzy,nyzy,yny,xplusy,xandy,afterf,nafterf,nof;
    wire nzr8,nzr16,nzr;

    Mux16 g0(x,16'b0,zx,xzx);
    Not16 g1(xzx,nxzx);
    Mux16 g2(xzx,nxzx,nx,xnx);

    Mux16 g3(y,16'b0,zy,yzy);
    Not16 g4(yzy,nyzy);
    Mux16 g5(yzy,nyzy,ny,yny);

    Add16 g6(xnx,yny,xplusy);
    And16 g7(xnx,yny,xandy);
    Mux16 g8(xandy,xplusy,f,afterf);

    Not16 g9(afterf,nafterf);
    Mux16 g10(afterf,nafterf,no,nof);
    And16 g11(nof,nof,out);

    Or8Way g12(nof[7:0],nzr8);
    Or8Way g13(nof[15:8],nzr16);
    Or g14(nzr8,nzr16,nzr);
    Not g15(nzr,zr);

    Mux g16(0,1,nof[15],ng);
endmodule