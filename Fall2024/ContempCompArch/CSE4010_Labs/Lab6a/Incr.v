module incrementer (
    input wire [31:0] pcin,  // Input of the incrementer
    output wire [31:0] pcout // Output of the incrementer
    );

    assign pcout = pcin + 1; // Increment PC by 1 to make the memory word addressable.
endmodule