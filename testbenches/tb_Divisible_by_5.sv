module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #200
        $finish;
    end

endmodule

module tb_Divisible_by_5;

    reg x, rst_n, clk;
    reg [0:15] seq = 'b1001110110011001;
    wire y;
    integer i;

    Divisible_by_5 ins(.x(x), .rst_n(rst_n), .clk(clk), .y(y));

    always #4 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst_n = 1'b1;
        x = 1'b0;
        #6
        rst_n = 1'b0;
        #2
        rst_n = 1'b1;

        for (i = 0; i < 16; i++)
            #8
            x = seq[i];
    end

endmodule
