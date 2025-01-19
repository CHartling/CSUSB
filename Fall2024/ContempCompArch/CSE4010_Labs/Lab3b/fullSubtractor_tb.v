`timescale 1 ns / 1 ns  // Sets time interval of fullSubtractor
`include "fullSubtractor.v"  // Links fullSubtractor.v to this file

module fullSubtractor_tb; // Create module called fullSubtractor_tb
    
    reg A, B, borrowIn;   // Input wires A, B, and borrowIn
    wire difference, borrowOut;  // Output wires difference and borrowOut

    fullSubtractor uut(A, B, borrowIn, difference, borrowOut); // Instantiate fullSubtractor as uut

    initial begin // Starts clock
        
        $dumpfile("fullSubtractor_tb.vcd"); // Sets file for output of the test
        $dumpvars(0, fullSubtractor_tb);

        {A, B, borrowIn} = 3'd0; #20; // Set A = 0, B = 0, and borrowIn = 0. Wait 20ns
        {A, B, borrowIn} = 3'd1; #20; // Set A = 0, B = 0, and borrowIn = 1. Wait 20ns
        {A, B, borrowIn} = 3'd2; #20; // Set A = 0, B = 1, and borrowIn = 0. Wait 20ns
        {A, B, borrowIn} = 3'd3; #20; // Set A = 0, B = 1, and borrowIn = 1. Wait 20ns
        {A, B, borrowIn} = 3'd4; #20; // Set A = 1, B = 0, and borrowIn = 0. Wait 20ns
        {A, B, borrowIn} = 3'd5; #20; // Set A = 1, B = 0, and borrowIn = 1. Wait 20ns
        {A, B, borrowIn} = 3'd6; #20; // Set A = 1, B = 1, and borrowIn = 0. Wait 20ns
        {A, B, borrowIn} = 3'd7; #20; // Set A = 1, B = 1, and borrowIn = 1. Wait 20ns
        $display("Finished subtractions!");
    end // Ends clock

endmodule  // End module fullSubtractor_tb