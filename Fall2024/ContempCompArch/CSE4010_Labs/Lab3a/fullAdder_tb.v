`timescale 1 ns / 1 ns  // Sets time interval of fullAdder
`include "fullAdder.v"  // Links fullAdder.v to this file

module fullAdder_tb; // Create module called fullAdder_tb
    
    reg A, B, carryIn;   // Input wires A, B, and carryIn
    wire sum, carryOut;  // Output wires sum and carryOut

    fullAdder uut(A, B, carryIn, sum, carryOut); // Instantiate fullAdder as uut

    initial begin // Starts clock
        
        $dumpfile("fullAdder_tb.vcd"); // Sets file for output of the test
        $dumpvars(0, fullAdder_tb);

        {A, B, carryIn} = 3'd0; #20; // Set A = 0, B = 0, and carryIn = 0. Wait 20ns
        {A, B, carryIn} = 3'd1; #20; // Set A = 0, B = 0, and carryIn = 1. Wait 20ns
        {A, B, carryIn} = 3'd2; #20; // Set A = 0, B = 1, and carryIn = 0. Wait 20ns
        {A, B, carryIn} = 3'd3; #20; // Set A = 0, B = 1, and carryIn = 1. Wait 20ns
        {A, B, carryIn} = 3'd4; #20; // Set A = 1, B = 0, and carryIn = 0. Wait 20ns
        {A, B, carryIn} = 3'd5; #20; // Set A = 1, B = 0, and carryIn = 1. Wait 20ns
        {A, B, carryIn} = 3'd6; #20; // Set A = 1, B = 1, and carryIn = 0. Wait 20ns
        {A, B, carryIn} = 3'd7; #20; // Set A = 1, B = 1, and carryIn = 1. Wait 20ns
        $display("Finished additions!");
    end // Ends clock

endmodule  // End module fullAdder_tb