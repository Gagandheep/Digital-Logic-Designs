module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #100
        $finish;
    end

endmodule

module tb_DFF;

    reg d, rst_n, clk;
    wire q;

    DFF dff(.din(d), .rst_n(rst_n), .clk(clk), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        d = 1'b1;
        rst_n = 1'b1;
        #3
        rst_n = 1'b0;
        #8
        rst_n = 1'b1;
        #14
        d = 1'b0;
        #7
        d = 1'b1;
    end

endmodule
