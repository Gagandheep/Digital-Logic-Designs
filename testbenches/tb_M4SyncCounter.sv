module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #50
        $finish;
    end

endmodule


module tb_M4SyncCounter;

    reg clk = 1'b0, rst_n = 1'b1;
    wire [1:0] op;

    M4SyncCounter ctr(.clk(clk), .rst_n(rst_n), .op(op));

    always begin
        #2
        clk = ~clk;
    end

    initial begin
        #3 rst_n = 1'b0;
        #4 rst_n = 1'b1;
    end

endmodule