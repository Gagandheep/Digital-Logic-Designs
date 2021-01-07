module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #100
        $finish;
    end

endmodule


module tb_M16SyncCounter;

    reg clk = 0, rst = 1;
    wire [3:0] q;

    M16SyncCounter ctr(clk, rst, q);

    always #2 clk = ~clk;

    initial begin
        #3 rst = 0;
        #4 rst = 1;
    end

endmodule