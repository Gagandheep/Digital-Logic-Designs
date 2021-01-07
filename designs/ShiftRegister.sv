module ShiftRegister(input [3:0] in, input [1:0] s, input serial_in, clk, rst_n,
                     output reg [3:0] q);
    
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            q <= 4'b0000;
        else 
            case(s)
                2'b00: q <= q; // Store
                2'b01: q <= {serial_in, q[3:1]}; // right shift
                2'b10: q <= {q[2:0], serial_in}; // left shift
                2'b11: q <= in; // parallel in
            endcase
    end

endmodule
