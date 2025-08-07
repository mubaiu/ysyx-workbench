module IFU(
    input wire clk,
    input wire rst,
    
    // 分支控制信号
    input wire branch_taken,
    input wire [31:0] branch_target,
    
    output reg [31:0] pc,
    output reg [31:0] snpc, // 静态下一个PC
    // output wire [31:0] dnpc, // 动态下一个PC
    output reg [31:0] inst // 从指令存储器获取的
);
    // reg [DATA_WIDTH-1:0] mem [0:1023]; // 假设存储器有1024个32位指令 
    reg [31:0] pc_ff; // PC的延迟寄存器
    import "DPI-C" function int intake(input int pc);
    import "DPI-C" function void set_snpc(input int pc);
    import "DPI-C" function void set_dnpc(input int pc);
    import "DPI-C" function void set_pc(input int pc);

    reg [31:0] dnpc; // 动态下一个PC
    reg [31:0] msnpc;
    reg [31:0] mdnpc;
    // // 静态PC（顺序执行的下一个PC）
    assign snpc = pc + 32'd4;

    // 动态PC（考虑分支/跳转的下一个PC）
    assign dnpc = branch_taken ? branch_target : snpc;
    

    // 指令传递
    always @(*) begin
        if (!rst) begin
            inst = intake(32'h80000000);
        end else begin
            inst = intake(pc);
        end
    end

    always @(*) begin
        set_snpc(msnpc);
        set_dnpc(mdnpc);
        set_pc(pc_ff);
    end

    // PC更新逻辑
    always @(posedge clk) begin
        if (!rst) begin
            pc <= 32'h80000000;
            pc_ff <= 32'h80000000;
            // 初始化其他寄存器
            msnpc <= 32'h80000004;  // 初始化静态下一PC
            mdnpc <= 32'h80000004;  // 初始化动态下一PC
        end 
        else begin
            // $display("PC: %h, dnpc: %h, branch_taken: %b, branch_target: %h", 
            //      pc, dnpc, branch_taken, branch_target);
            
            // 修改PC更新逻辑，直接使用dnpc更新pc，减少一个周期的延迟
            msnpc <= snpc;
            mdnpc <= dnpc;
            pc <= dnpc;
            pc_ff <= pc;
            // inst <= intake(pc);
        end
    end


endmodule

