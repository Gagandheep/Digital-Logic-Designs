module ALU(input [7:0] a, b, input [3:0] oper, input clk,
           output reg [7:0] msb, lsb);

    always @(posedge clk) begin
        case(oper)
            4'h0: {msb, lsb} <= a + b;  // Add
            4'h1: {msb, lsb} <= a - b;  // Subtract
            4'h2: {msb, lsb} <= a * b;  // Multiply
            4'h3: {msb, lsb} <= a / b;  // Divide
            4'h4: {msb, lsb} <= a % b;  // Modulo
            4'h5: {msb, lsb} <= a & b;  // And
            4'h6: {msb, lsb} <= ~(a & b); // Nand
            4'h7: {msb, lsb} <= a | b;  // Or
            4'h8: {msb, lsb} <= ~(a | b); // Nor
            4'h9: {msb, lsb} <= a ^ b;  // Xor
            4'hA: {msb, lsb} <= a ~^ b; // Xnor
            4'hB: {msb, lsb} <= ~a;     // Not
            4'hC: {msb, lsb} <= a << 1; // Left shift
            4'hD: {msb, lsb} <= a >> 1; // Right shift
            4'hE: {msb, lsb} <= a > b;    // Greater than
            4'hF: {msb, lsb} <= a < b;    // Lesser than
            default: {msb, lsb} <= 16'h0000;
        endcase
    end

endmodule
