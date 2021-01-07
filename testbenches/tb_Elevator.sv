module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #350
        $finish;
    end

endmodule


module tb_Elevator;

    reg [2:0] floor_no;
    reg clk, ip, rst_n;
    wire [2:0] curr_floor;
    wire door;

    Elevator ins(floor_no, clk, rst_n, ip, curr_floor, door);

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst_n = 1'b1;
        floor_no = 3'd0;
        ip = 1'b0;
        #13
        rst_n = 1'b0;
        #10
        rst_n = 1'b1;
        #10
        floor_no = 3'd4;
        ip = 1'b1;
        #10
        ip = 1'b0;
        #10
        floor_no = 3'd6;
        ip = 1'b1;
        #10
        ip = 1'b0;
        #10
        floor_no = 3'd5;
        ip = 1'b1;
        #10
        ip = 1'b0;
        #10
        floor_no = 3'd0;
        ip = 1'b1;
        #10
        ip = 1'b0;
        #50
        floor_no = 3'd3;
        ip = 1'b1;
        #10
        ip = 1'b0;
    end

endmodule
