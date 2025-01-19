`include "Mux.v"    // Links Mux.v to this file
`include "Incr.v"   // Links Incr.v to this file
`include "Mem.v"    // Links Mem.v to this file
`include "Pc_mod.v" // Links Pc_mod.v to this file
`include "If_id.v"  // Links If_id.v to this file

module I_Fetch (
    output wire [31:0] IF_ID_instr, // Output of IF/ID Intruction Register
    output wire [31:0] IF_ID_npc,   // Output of IF/ID NPC Register
    input wire EX_MEM_PCSrc,        // Input
    input wire [31:0] EX_MEM_NPC    // Input
    );

    // Signals
    wire [31:0] PC;            // Program Counter
    wire [31:0] dataout;       // Data out
    wire [31:0] npc, npc_mux;  // NPC and NPC out

    // Instantiations
    mux mux1 (.y(npc_mux), .a(EX_MEM_NPC), .b(npc), .sel(EX_MEM_PCSrc));
    pc_mod pc_mod1 (.PC(PC), .npc(npc_mux));
    memory memory1 (.data(dataout), .addr(PC));
    if_id if_id1 (.instrout(IF_ID_instr), .npcout(IF_ID_npc), .instr(dataout), .npc(npc));
    incrementer incrementer1 (.pcout(npc), .pcin(PC));

    initial begin
        $display ("Time\t PC\t npc\t dataout of MEM\t IF_ID_instr\t IF_ID_npc");
        $monitor ("", $time, PC, npc, dataout, IF_ID_instr, IF_ID_npc);
        #20 $finish;
    end

endmodule // End module I_Fetch