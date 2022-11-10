module HelloVerilog;

initial begin
    $display("Hello, iverilog");
    #40 $finish;
end

endmodule