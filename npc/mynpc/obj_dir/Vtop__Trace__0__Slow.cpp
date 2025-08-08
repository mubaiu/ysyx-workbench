// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_fst_c.h"
#include "Vtop__Syms.h"


VL_ATTR_COLD void Vtop___024root__trace_init_sub__TOP__0(Vtop___024root* vlSelf, VerilatedFst* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+80,"clk",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+81,"rst",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+82,"pc",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+83,"ram_we",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+84,"ram_addr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+85,"ram_wdata",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->pushNamePrefix("top ");
    tracep->declBit(c+80,"clk",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+81,"rst",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+82,"pc",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+83,"ram_we",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+84,"ram_addr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+85,"ram_wdata",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+1,"inst_out",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+86,"snpc",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+2,"rs1_addr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+3,"rs2_addr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+4,"rd_addr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+5,"rs1_data",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+6,"rs2_data",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+7,"wb_data",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+8,"reg_write",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+9,"imm",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+10,"alu_op",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+11,"mem_read",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+12,"mem_write",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+13,"alu_src",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+14,"mem_to_reg",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+15,"branch",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+16,"jal_en",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+17,"jalr_en",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+18,"ebreak_en",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+19,"ecall_en",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+20,"mret_en",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+21,"auipc_flag",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+22,"is_csr_op",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+23,"alu_result",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+24,"branch_taken",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+25,"branch_target",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+26,"ecall_taken",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+27,"ecall_target",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+28,"mret_taken",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+29,"mret_target",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+30,"load_data",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+31,"funct3",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 2,0);
    tracep->pushNamePrefix("exu ");
    tracep->declBit(c+80,"clk",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+81,"rst",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+10,"alu_op",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+18,"ebreak_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+19,"ecall_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+20,"mret_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+5,"rs1_data",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+6,"rs2_data",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+9,"imm",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+13,"alu_src",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+22,"is_csr_op",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+82,"pc",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+15,"branch",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+16,"jal_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+17,"jalr_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+21,"auipc_flag",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+23,"alu_result",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+26,"ecall_taken",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+27,"ecall_target",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+28,"mret_taken",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+29,"mret_target",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+24,"branch_taken",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+25,"branch_target",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+32,"operand_a",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+33,"operand_b",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+34,"csr_read_data",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+40,"mstatus",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+41,"mepc",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+42,"mcause",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+43,"mtvec",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBit(c+35,"branch_cond",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("idu ");
    tracep->declBus(c+1,"inst",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+82,"pc",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+81,"rst",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+2,"rs1_addr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+3,"rs2_addr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+4,"rd_addr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+9,"imm",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+10,"alu_op",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+11,"mem_read",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+12,"mem_write",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+8,"reg_write",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+13,"alu_src",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+14,"mem_to_reg",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+15,"branch",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+16,"jal_en",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+17,"jalr_en",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+18,"ebreak_en",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+19,"ecall_en",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+20,"mret_en",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+31,"funct3",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 2,0);
    tracep->declBit(c+21,"auipc_flag",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+22,"is_csr_op",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+36,"opcode",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 6,0);
    tracep->declBus(c+37,"funct7",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 6,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("ifu ");
    tracep->declBit(c+80,"clk",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+81,"rst",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+28,"mret_taken",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+29,"mret_target",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+26,"ecall_taken",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+27,"ecall_target",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+24,"branch_taken",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+25,"branch_target",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+82,"pc",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+86,"snpc",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+1,"inst",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+44,"pc_ff",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+38,"dnpc",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+45,"msnpc",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+46,"mdnpc",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("lsu ");
    tracep->declBit(c+11,"mem_read",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+12,"mem_write",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+31,"funct3",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 2,0);
    tracep->declBus(c+23,"addr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+6,"store_data",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+30,"load_data",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+83,"ram_we",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+84,"ram_addr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+85,"ram_wdata",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+39,"temp_data",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("reg_file ");
    tracep->declBit(c+80,"clk",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+81,"rst",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+2,"rs1_addr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+3,"rs2_addr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+4,"rd_addr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+7,"rd_data",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+8,"rd_wen",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+5,"rs1_data",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+6,"rs2_data",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    for (int i = 0; i < 32; ++i) {
        tracep->declBus(c+47+i*1,"registers",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, true,(i+0), 31,0);
    }
    tracep->declBus(c+79,"i",-1, FST_VD_IMPLICIT,FST_VT_VCD_INTEGER, false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("wbu ");
    tracep->declBus(c+23,"alu_result",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+30,"load_data",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+86,"snpc",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+14,"mem_to_reg",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+16,"jal_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+17,"jalr_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+7,"wb_data",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->popNamePrefix(2);
}

VL_ATTR_COLD void Vtop___024root__trace_init_top(Vtop___024root* vlSelf, VerilatedFst* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_init_top\n"); );
    // Body
    Vtop___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void Vtop___024root__trace_full_top_0(void* voidSelf, VerilatedFst::Buffer* bufp);
void Vtop___024root__trace_chg_top_0(void* voidSelf, VerilatedFst::Buffer* bufp);
void Vtop___024root__trace_cleanup(void* voidSelf, VerilatedFst* /*unused*/);

VL_ATTR_COLD void Vtop___024root__trace_register(Vtop___024root* vlSelf, VerilatedFst* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_register\n"); );
    // Body
    tracep->addFullCb(&Vtop___024root__trace_full_top_0, vlSelf);
    tracep->addChgCb(&Vtop___024root__trace_chg_top_0, vlSelf);
    tracep->addCleanupCb(&Vtop___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void Vtop___024root__trace_full_sub_0(Vtop___024root* vlSelf, VerilatedFst::Buffer* bufp);

VL_ATTR_COLD void Vtop___024root__trace_full_top_0(void* voidSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_full_top_0\n"); );
    // Init
    Vtop___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtop___024root*>(voidSelf);
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    Vtop___024root__trace_full_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vtop___024root__trace_full_sub_0(Vtop___024root* vlSelf, VerilatedFst::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_full_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullIData(oldp+1,(vlSelf->top__DOT__inst_out),32);
    bufp->fullCData(oldp+2,((0xfU & (vlSelf->top__DOT__inst_out 
                                     >> 0xfU))),5);
    bufp->fullCData(oldp+3,((0xfU & (vlSelf->top__DOT__inst_out 
                                     >> 0x14U))),5);
    bufp->fullCData(oldp+4,((0xfU & (vlSelf->top__DOT__inst_out 
                                     >> 7U))),5);
    bufp->fullIData(oldp+5,(vlSelf->top__DOT__rs1_data),32);
    bufp->fullIData(oldp+6,(vlSelf->top__DOT__rs2_data),32);
    bufp->fullIData(oldp+7,(vlSelf->top__DOT__wb_data),32);
    bufp->fullBit(oldp+8,(vlSelf->top__DOT__reg_write));
    bufp->fullIData(oldp+9,(vlSelf->top__DOT__imm),32);
    bufp->fullCData(oldp+10,(vlSelf->top__DOT__alu_op),4);
    bufp->fullBit(oldp+11,(vlSelf->top__DOT__mem_read));
    bufp->fullBit(oldp+12,(vlSelf->top__DOT__mem_write));
    bufp->fullBit(oldp+13,(vlSelf->top__DOT__alu_src));
    bufp->fullBit(oldp+14,(vlSelf->top__DOT__mem_to_reg));
    bufp->fullBit(oldp+15,(vlSelf->top__DOT__branch));
    bufp->fullBit(oldp+16,(vlSelf->top__DOT__jal_en));
    bufp->fullBit(oldp+17,(vlSelf->top__DOT__jalr_en));
    bufp->fullBit(oldp+18,(vlSelf->top__DOT__ebreak_en));
    bufp->fullBit(oldp+19,(vlSelf->top__DOT__ecall_en));
    bufp->fullBit(oldp+20,(vlSelf->top__DOT__mret_en));
    bufp->fullBit(oldp+21,(vlSelf->top__DOT__auipc_flag));
    bufp->fullBit(oldp+22,(vlSelf->top__DOT__is_csr_op));
    bufp->fullIData(oldp+23,(vlSelf->top__DOT__alu_result),32);
    bufp->fullBit(oldp+24,((((IData)(vlSelf->top__DOT__branch) 
                             & (((IData)(vlSelf->top__DOT__alu_op) 
                                 >> 3U) & ((4U & (IData)(vlSelf->top__DOT__alu_op))
                                            ? ((2U 
                                                & (IData)(vlSelf->top__DOT__alu_op))
                                                ? (
                                                   (1U 
                                                    & (IData)(vlSelf->top__DOT__alu_op))
                                                    ? 
                                                   (vlSelf->top__DOT__rs1_data 
                                                    >= vlSelf->top__DOT__rs2_data)
                                                    : 
                                                   (vlSelf->top__DOT__rs1_data 
                                                    < vlSelf->top__DOT__rs2_data))
                                                : (
                                                   (1U 
                                                    & (IData)(vlSelf->top__DOT__alu_op))
                                                    ? 
                                                   VL_GTES_III(32, vlSelf->top__DOT__rs1_data, vlSelf->top__DOT__rs2_data)
                                                    : 
                                                   VL_LTS_III(32, vlSelf->top__DOT__rs1_data, vlSelf->top__DOT__rs2_data)))
                                            : (((IData)(vlSelf->top__DOT__alu_op) 
                                                >> 1U) 
                                               & ((1U 
                                                   & (IData)(vlSelf->top__DOT__alu_op))
                                                   ? 
                                                  (vlSelf->top__DOT__rs1_data 
                                                   != vlSelf->top__DOT__rs2_data)
                                                   : 
                                                  (vlSelf->top__DOT__rs1_data 
                                                   == vlSelf->top__DOT__rs2_data)))))) 
                            | (IData)(vlSelf->top__DOT__exu__DOT____VdfgTmp_h826bb330__0))));
    bufp->fullIData(oldp+25,(((IData)(vlSelf->top__DOT__exu__DOT____VdfgTmp_h826bb330__0)
                               ? (((0U == (IData)(vlSelf->top__DOT__alu_op)) 
                                   & ((IData)(vlSelf->top__DOT__alu_src) 
                                      & (IData)(vlSelf->top__DOT__jal_en)))
                                   ? vlSelf->top__DOT__exu__DOT____VdfgTmp_h8a6dd3c2__0
                                   : (0xfffffffeU & 
                                      (vlSelf->top__DOT__imm 
                                       + vlSelf->top__DOT__rs1_data)))
                               : vlSelf->top__DOT__exu__DOT____VdfgTmp_h8a6dd3c2__0)),32);
    bufp->fullBit(oldp+26,(vlSelf->top__DOT__ecall_taken));
    bufp->fullIData(oldp+27,(vlSelf->top__DOT__ecall_target),32);
    bufp->fullBit(oldp+28,(vlSelf->top__DOT__mret_taken));
    bufp->fullIData(oldp+29,(vlSelf->top__DOT__mret_target),32);
    bufp->fullIData(oldp+30,(vlSelf->top__DOT__load_data),32);
    bufp->fullCData(oldp+31,((7U & (vlSelf->top__DOT__inst_out 
                                    >> 0xcU))),3);
    bufp->fullIData(oldp+32,(vlSelf->top__DOT__exu__DOT__operand_a),32);
    bufp->fullIData(oldp+33,(vlSelf->top__DOT__exu__DOT__operand_b),32);
    bufp->fullIData(oldp+34,(((0x300U == vlSelf->top__DOT__imm)
                               ? vlSelf->top__DOT__exu__DOT__mstatus
                               : ((0x341U == vlSelf->top__DOT__imm)
                                   ? vlSelf->top__DOT__exu__DOT__mepc
                                   : ((0x342U == vlSelf->top__DOT__imm)
                                       ? vlSelf->top__DOT__exu__DOT__mcause
                                       : ((0x305U == vlSelf->top__DOT__imm)
                                           ? vlSelf->top__DOT__exu__DOT__mtvec
                                           : 0U))))),32);
    bufp->fullBit(oldp+35,((((IData)(vlSelf->top__DOT__alu_op) 
                             >> 3U) & ((4U & (IData)(vlSelf->top__DOT__alu_op))
                                        ? ((2U & (IData)(vlSelf->top__DOT__alu_op))
                                            ? ((1U 
                                                & (IData)(vlSelf->top__DOT__alu_op))
                                                ? (vlSelf->top__DOT__rs1_data 
                                                   >= vlSelf->top__DOT__rs2_data)
                                                : (vlSelf->top__DOT__rs1_data 
                                                   < vlSelf->top__DOT__rs2_data))
                                            : ((1U 
                                                & (IData)(vlSelf->top__DOT__alu_op))
                                                ? VL_GTES_III(32, vlSelf->top__DOT__rs1_data, vlSelf->top__DOT__rs2_data)
                                                : VL_LTS_III(32, vlSelf->top__DOT__rs1_data, vlSelf->top__DOT__rs2_data)))
                                        : (((IData)(vlSelf->top__DOT__alu_op) 
                                            >> 1U) 
                                           & ((1U & (IData)(vlSelf->top__DOT__alu_op))
                                               ? (vlSelf->top__DOT__rs1_data 
                                                  != vlSelf->top__DOT__rs2_data)
                                               : (vlSelf->top__DOT__rs1_data 
                                                  == vlSelf->top__DOT__rs2_data)))))));
    bufp->fullCData(oldp+36,((0x7fU & vlSelf->top__DOT__inst_out)),7);
    bufp->fullCData(oldp+37,((vlSelf->top__DOT__inst_out 
                              >> 0x19U)),7);
    bufp->fullIData(oldp+38,(vlSelf->top__DOT__ifu__DOT__dnpc),32);
    bufp->fullIData(oldp+39,(vlSelf->top__DOT__lsu__DOT__temp_data),32);
    bufp->fullIData(oldp+40,(vlSelf->top__DOT__exu__DOT__mstatus),32);
    bufp->fullIData(oldp+41,(vlSelf->top__DOT__exu__DOT__mepc),32);
    bufp->fullIData(oldp+42,(vlSelf->top__DOT__exu__DOT__mcause),32);
    bufp->fullIData(oldp+43,(vlSelf->top__DOT__exu__DOT__mtvec),32);
    bufp->fullIData(oldp+44,(vlSelf->top__DOT__ifu__DOT__pc_ff),32);
    bufp->fullIData(oldp+45,(vlSelf->top__DOT__ifu__DOT__msnpc),32);
    bufp->fullIData(oldp+46,(vlSelf->top__DOT__ifu__DOT__mdnpc),32);
    bufp->fullIData(oldp+47,(vlSelf->top__DOT__reg_file__DOT__registers[0]),32);
    bufp->fullIData(oldp+48,(vlSelf->top__DOT__reg_file__DOT__registers[1]),32);
    bufp->fullIData(oldp+49,(vlSelf->top__DOT__reg_file__DOT__registers[2]),32);
    bufp->fullIData(oldp+50,(vlSelf->top__DOT__reg_file__DOT__registers[3]),32);
    bufp->fullIData(oldp+51,(vlSelf->top__DOT__reg_file__DOT__registers[4]),32);
    bufp->fullIData(oldp+52,(vlSelf->top__DOT__reg_file__DOT__registers[5]),32);
    bufp->fullIData(oldp+53,(vlSelf->top__DOT__reg_file__DOT__registers[6]),32);
    bufp->fullIData(oldp+54,(vlSelf->top__DOT__reg_file__DOT__registers[7]),32);
    bufp->fullIData(oldp+55,(vlSelf->top__DOT__reg_file__DOT__registers[8]),32);
    bufp->fullIData(oldp+56,(vlSelf->top__DOT__reg_file__DOT__registers[9]),32);
    bufp->fullIData(oldp+57,(vlSelf->top__DOT__reg_file__DOT__registers[10]),32);
    bufp->fullIData(oldp+58,(vlSelf->top__DOT__reg_file__DOT__registers[11]),32);
    bufp->fullIData(oldp+59,(vlSelf->top__DOT__reg_file__DOT__registers[12]),32);
    bufp->fullIData(oldp+60,(vlSelf->top__DOT__reg_file__DOT__registers[13]),32);
    bufp->fullIData(oldp+61,(vlSelf->top__DOT__reg_file__DOT__registers[14]),32);
    bufp->fullIData(oldp+62,(vlSelf->top__DOT__reg_file__DOT__registers[15]),32);
    bufp->fullIData(oldp+63,(vlSelf->top__DOT__reg_file__DOT__registers[16]),32);
    bufp->fullIData(oldp+64,(vlSelf->top__DOT__reg_file__DOT__registers[17]),32);
    bufp->fullIData(oldp+65,(vlSelf->top__DOT__reg_file__DOT__registers[18]),32);
    bufp->fullIData(oldp+66,(vlSelf->top__DOT__reg_file__DOT__registers[19]),32);
    bufp->fullIData(oldp+67,(vlSelf->top__DOT__reg_file__DOT__registers[20]),32);
    bufp->fullIData(oldp+68,(vlSelf->top__DOT__reg_file__DOT__registers[21]),32);
    bufp->fullIData(oldp+69,(vlSelf->top__DOT__reg_file__DOT__registers[22]),32);
    bufp->fullIData(oldp+70,(vlSelf->top__DOT__reg_file__DOT__registers[23]),32);
    bufp->fullIData(oldp+71,(vlSelf->top__DOT__reg_file__DOT__registers[24]),32);
    bufp->fullIData(oldp+72,(vlSelf->top__DOT__reg_file__DOT__registers[25]),32);
    bufp->fullIData(oldp+73,(vlSelf->top__DOT__reg_file__DOT__registers[26]),32);
    bufp->fullIData(oldp+74,(vlSelf->top__DOT__reg_file__DOT__registers[27]),32);
    bufp->fullIData(oldp+75,(vlSelf->top__DOT__reg_file__DOT__registers[28]),32);
    bufp->fullIData(oldp+76,(vlSelf->top__DOT__reg_file__DOT__registers[29]),32);
    bufp->fullIData(oldp+77,(vlSelf->top__DOT__reg_file__DOT__registers[30]),32);
    bufp->fullIData(oldp+78,(vlSelf->top__DOT__reg_file__DOT__registers[31]),32);
    bufp->fullIData(oldp+79,(vlSelf->top__DOT__reg_file__DOT__i),32);
    bufp->fullBit(oldp+80,(vlSelf->clk));
    bufp->fullBit(oldp+81,(vlSelf->rst));
    bufp->fullIData(oldp+82,(vlSelf->pc),32);
    bufp->fullBit(oldp+83,(vlSelf->ram_we));
    bufp->fullIData(oldp+84,(vlSelf->ram_addr),32);
    bufp->fullIData(oldp+85,(vlSelf->ram_wdata),32);
    bufp->fullIData(oldp+86,(((IData)(4U) + vlSelf->pc)),32);
}
