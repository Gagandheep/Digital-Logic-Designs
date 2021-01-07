module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #200
        $finish;
    end

endmodule

module tb_Seq_1010_Mealy_Overlap;

    reg x, rst_n, clk;
    reg [0:19] seq = 'b00101010001001010110;
    wire y;
    integer i;

    Seq_1010_Mealy_Overlap ins(.x(x), .rst_n(rst_n), .clk(clk), .y(y));

    always #4 clk = ~clk;

    initial begin
        clk = 1'b0;
        x = 1'b0;
        rst_n = 1'b1;
        #6
        rst_n = 1'b0;
        #2
        rst_n = 1'b1;

        for (i = 0; i < 20; i++)
            #8
            x = seq[i];
    end

endmodule
