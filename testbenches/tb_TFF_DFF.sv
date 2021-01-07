module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #50
        $finish;
    end

endmodule

module tb_TFF_DFF;

    reg T, clk, rst_n;
    wire Q;

    TFF_DFF tff(.t(T), .clk(clk), .rst_n(rst_n), .q(Q));

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst_n = 1'b1;
        T = 1'b0;
        #8
        rst_n = 1'b0;
        #5
        rst_n = 1'b1;
        #20
        T = 1'b1;
        #50
        T = 1'b0;
    end

endmodule