module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #85
        $finish;
    end

endmodule

module tb_SRFF_DFF;

    reg clk, rst_n, S, R;
    wire Q;

    SRFF_DFF srff(.s(S), .r(R), .clk(clk), .rst_n(rst_n), .q(Q)); 

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst_n = 1'b1;
        S = 1'b0;
        R = 1'b0;
        #2
        rst_n = 1'b0;
        #5
        rst_n = 1'b1;
        #16
        S = 1'b1;
        R = 1'b0;
        #10
        S = 1'b0;
        R = 1'b0;
        #10
        S = 1'b0;
        R = 1'b1;
        #10
        S = 1'b0;
        R = 1'b0;
        #10
        S = 1'b1;
        R = 1'b1;
    end

endmodule
