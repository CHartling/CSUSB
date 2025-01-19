module mux (
    output wire [31:0] y, // Output of the Multiplexer
    input wire  [31:0] a, // Input 1 of the Multiplexer
                       b, // Input 0 of the Multiplexer
    input wire sel        // Select Input
    );
    
    // If sel = 0, then y = a. If sel = 1, then y = b.
    assign y = sel ? a : b;
endmodule // End module mux