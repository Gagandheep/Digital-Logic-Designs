module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #100
        $finish;
    end

endmodule

module tb_RingCounter4Bit;

    reg rst_n, clk;
    wire [3:0] op;

    RingCounter4Bit rc(.rst_n(rst_n), .clk(clk), .out(op));

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst_n = 1'b1;
        #13
        rst_n = 1'b0;
        #5
        rst_n = 1'b1;
    end

endmodule
