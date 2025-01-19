`timescale 1ns/1ns          // Sets time interval of wireTest
`include "NANDusingNOR.v"   // Links NANDusingNOR.v to this file

module NANDusingNOR_tb; // Create module called NANDusingNOR_tb

    reg A;  // Input wire called A
    reg B;  // Input wire called B
    wire Q; // Output wire called Q

    NANDusingNOR uut(A, B, Q); // Instantiate wireTest as uut

    initial begin // Starts clock

        $dumpfile("NANDusingNOR_tb.vcd"); // Sets file for output of the test
        $dumpvars(0, NANDusingNOR_tb);

        A = 0; B = 0; #20 // Set wire A to 0, B to 0, and wait 20ns
        A = 0; B = 1; #20 // Set wire A to 0, B to 1, and wait 20ns
        A = 1; B = 0; #20 // Set wire A to 1, B to 0, and wait 20ns
        A = 1; B = 1; #20 // Set wire A to 1, B to 1, and wait 20ns

        $display("Complete!"); // Print the string

    end // Ends clock

endmodule // End module NANDusingNOR_tb