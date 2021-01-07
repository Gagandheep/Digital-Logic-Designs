module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #80
        $finish;
    end

endmodule


module tb_M16SyncCounter;

    reg clk = 0, rst_n = 1;
    wire [3:0] op;

    M10SyncCounter ctr(.clk(clk), .rst_n(rst_n), .out(op));

    always begin
        #2
        clk = !clk;
    end

    initial begin
        #3 rst_n = 0;
        #4 rst_n = 1;
    end

endmodule