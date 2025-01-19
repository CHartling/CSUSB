// Simulates a half adder
module halfAdder(op1, op2, sum, carry); // Create module called halfAdder

    // inputs and outputs
    input op1, op2;
    output sum, carry;

    assign sum = op1 ^ op2;   // op1 XOR op2
    assign carry = op1 & op2; // op1 AND op2

endmodule // End module halfAdder

// Simulates a full adder
module fullAdder(A, B, carryIn, sum, carryOut);  // Create module called fullAdder

    // inputs and outputs
    input A, B, carryIn;
    output sum, carryOut;

    // intermediary wires
    wire c, d, e, f;

    halfAdder u1(A, B, c, d);        // XOR result assigned to c, AND result assigned to d
    halfAdder u2(carryIn, c, e, f);  // XOR result assigned to e, AND result assigned to f

    assign carryOut = f | d; // f OR d result assigned to carryOut
    assign sum = e;          // Assign e to sum

endmodule  // End module fullAdder