module sim;

    initial begin
        #150
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end

endmodule

module tb_JKFF;

    reg clk, set, rst_n, J, K;
    wire Q;

    JKFF jkff(.j(J), .k(K), .clk(clk), .set(set), .rst_n(rst_n), .q(Q)); 

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        set = 1'b0;
        rst_n = 1'b1;
        J = 1'b0;
        K = 1'b0;
        #2
        rst_n = 1'b0;
        #5
        rst_n = 1'b1;
        #16
        J = 1'b1;
        K = 1'b0;
        #10
        J = 1'b0;
        K = 1'b0;
        #10
        J = 1'b0;
        K = 1'b1;
        #10
        J = 1'b0;
        K = 1'b0;
        #10
        set = 1'b1;
        #10
        set = 1'b0;
        #10
        J = 1'b1;
        K = 1'b1;
    end

endmodule
