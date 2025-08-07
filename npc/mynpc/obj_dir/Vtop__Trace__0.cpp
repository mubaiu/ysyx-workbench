// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_fst_c.h"
#include "Vtop__Syms.h"


void Vtop___024root__trace_chg_sub_0(Vtop___024root* vlSelf, VerilatedFst::Buffer* bufp);

void Vtop___024root__trace_chg_top_0(void* voidSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_chg_top_0\n"); );
    // Init
    Vtop___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtop___024root*>(voidSelf);
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vtop___024root__trace_chg_sub_0((&vlSymsp->TOP), bufp);
}

void Vtop___024root__trace_chg_sub_0(Vtop___024root* vlSelf, VerilatedFst::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_chg_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    if (VL_UNLIKELY((vlSelf->__Vm_traceActivity[1U] 
                     | vlSelf->__Vm_traceActivity[2U]))) {
        bufp->chgIData(oldp+0,(vlSelf->top__DOT__inst_out),32);
        bufp->chgCData(oldp+1,((0xfU & (vlSelf->top__DOT__inst_out 
                                        >> 0xfU))),5);
        bufp->chgCData(oldp+2,((0xfU & (vlSelf->top__DOT__inst_out 
                                        >> 0x14U))),5);
        bufp->chgCData(oldp+3,((0xfU & (vlSelf->top__DOT__inst_out 
                                        >> 7U))),5);
        bufp->chgIData(oldp+4,(vlSelf->top__DOT__rs1_data),32);
        bufp->chgIData(oldp+5,(vlSelf->top__DOT__rs2_data),32);
        bufp->chgIData(oldp+6,(vlSelf->top__DOT__wb_data),32);
        bufp->chgBit(oldp+7,(vlSelf->top__DOT__reg_write));
        bufp->chgIData(oldp+8,(vlSelf->top__DOT__imm),32);
        bufp->chgCData(oldp+9,(vlSelf->top__DOT__alu_op),4);
        bufp->chgBit(oldp+10,(vlSelf->top__DOT__mem_read));
        bufp->chgBit(oldp+11,(vlSelf->top__DOT__mem_write));
        bufp->chgBit(oldp+12,(vlSelf->top__DOT__alu_src));
        bufp->chgBit(oldp+13,(vlSelf->top__DOT__mem_to_reg));
        bufp->chgBit(oldp+14,(vlSelf->top__DOT__branch));
        bufp->chgBit(oldp+15,(vlSelf->top__DOT__jal_en));
        bufp->chgBit(oldp+16,(vlSelf->top__DOT__jalr_en));
        bufp->chgBit(oldp+17,(vlSelf->top__DOT__ebreak_en));
        bufp->chgBit(oldp+18,(vlSelf->top__DOT__auipc_flag));
        bufp->chgIData(oldp+19,(vlSelf->top__DOT__alu_result),32);
        bufp->chgBit(oldp+20,((((IData)(vlSelf->top__DOT__branch) 
                                & (((IData)(vlSelf->top__DOT__alu_op) 
                                    >> 3U) & ((4U & (IData)(vlSelf->top__DOT__alu_op))
                                               ? ((2U 
                                                   & (IData)(vlSelf->top__DOT__alu_op))
                                                   ? 
                                                  ((1U 
                                                    & (IData)(vlSelf->top__DOT__alu_op))
                                                    ? 
                                                   (vlSelf->top__DOT__rs1_data 
                                                    >= vlSelf->top__DOT__rs2_data)
                                                    : 
                                                   (vlSelf->top__DOT__rs1_data 
                                                    < vlSelf->top__DOT__rs2_data))
                                                   : 
                                                  ((1U 
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
        bufp->chgIData(oldp+21,(((IData)(vlSelf->top__DOT__exu__DOT____VdfgTmp_h826bb330__0)
                                  ? (((0U == (IData)(vlSelf->top__DOT__alu_op)) 
                                      & ((IData)(vlSelf->top__DOT__alu_src) 
                                         & (IData)(vlSelf->top__DOT__jal_en)))
                                      ? vlSelf->top__DOT__exu__DOT____VdfgTmp_h8a6dd3c2__0
                                      : (0xfffffffeU 
                                         & (vlSelf->top__DOT__imm 
                                            + vlSelf->top__DOT__rs1_data)))
                                  : vlSelf->top__DOT__exu__DOT____VdfgTmp_h8a6dd3c2__0)),32);
        bufp->chgIData(oldp+22,(vlSelf->top__DOT__load_data),32);
        bufp->chgCData(oldp+23,((7U & (vlSelf->top__DOT__inst_out 
                                       >> 0xcU))),3);
        bufp->chgIData(oldp+24,(vlSelf->top__DOT__exu__DOT__operand_a),32);
        bufp->chgIData(oldp+25,(vlSelf->top__DOT__exu__DOT__operand_b),32);
        bufp->chgBit(oldp+26,((((IData)(vlSelf->top__DOT__alu_op) 
                                >> 3U) & ((4U & (IData)(vlSelf->top__DOT__alu_op))
                                           ? ((2U & (IData)(vlSelf->top__DOT__alu_op))
                                               ? ((1U 
                                                   & (IData)(vlSelf->top__DOT__alu_op))
                                                   ? 
                                                  (vlSelf->top__DOT__rs1_data 
                                                   >= vlSelf->top__DOT__rs2_data)
                                                   : 
                                                  (vlSelf->top__DOT__rs1_data 
                                                   < vlSelf->top__DOT__rs2_data))
                                               : ((1U 
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
                                                  == vlSelf->top__DOT__rs2_data)))))));
        bufp->chgCData(oldp+27,((0x7fU & vlSelf->top__DOT__inst_out)),7);
        bufp->chgCData(oldp+28,((vlSelf->top__DOT__inst_out 
                                 >> 0x19U)),7);
        bufp->chgIData(oldp+29,(vlSelf->top__DOT__ifu__DOT__dnpc),32);
        bufp->chgIData(oldp+30,(vlSelf->top__DOT__lsu__DOT__temp_data),32);
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[2U])) {
        bufp->chgIData(oldp+31,(vlSelf->top__DOT__ifu__DOT__pc_ff),32);
        bufp->chgIData(oldp+32,(vlSelf->top__DOT__ifu__DOT__msnpc),32);
        bufp->chgIData(oldp+33,(vlSelf->top__DOT__ifu__DOT__mdnpc),32);
        bufp->chgIData(oldp+34,(vlSelf->top__DOT__reg_file__DOT__registers[0]),32);
        bufp->chgIData(oldp+35,(vlSelf->top__DOT__reg_file__DOT__registers[1]),32);
        bufp->chgIData(oldp+36,(vlSelf->top__DOT__reg_file__DOT__registers[2]),32);
        bufp->chgIData(oldp+37,(vlSelf->top__DOT__reg_file__DOT__registers[3]),32);
        bufp->chgIData(oldp+38,(vlSelf->top__DOT__reg_file__DOT__registers[4]),32);
        bufp->chgIData(oldp+39,(vlSelf->top__DOT__reg_file__DOT__registers[5]),32);
        bufp->chgIData(oldp+40,(vlSelf->top__DOT__reg_file__DOT__registers[6]),32);
        bufp->chgIData(oldp+41,(vlSelf->top__DOT__reg_file__DOT__registers[7]),32);
        bufp->chgIData(oldp+42,(vlSelf->top__DOT__reg_file__DOT__registers[8]),32);
        bufp->chgIData(oldp+43,(vlSelf->top__DOT__reg_file__DOT__registers[9]),32);
        bufp->chgIData(oldp+44,(vlSelf->top__DOT__reg_file__DOT__registers[10]),32);
        bufp->chgIData(oldp+45,(vlSelf->top__DOT__reg_file__DOT__registers[11]),32);
        bufp->chgIData(oldp+46,(vlSelf->top__DOT__reg_file__DOT__registers[12]),32);
        bufp->chgIData(oldp+47,(vlSelf->top__DOT__reg_file__DOT__registers[13]),32);
        bufp->chgIData(oldp+48,(vlSelf->top__DOT__reg_file__DOT__registers[14]),32);
        bufp->chgIData(oldp+49,(vlSelf->top__DOT__reg_file__DOT__registers[15]),32);
        bufp->chgIData(oldp+50,(vlSelf->top__DOT__reg_file__DOT__registers[16]),32);
        bufp->chgIData(oldp+51,(vlSelf->top__DOT__reg_file__DOT__registers[17]),32);
        bufp->chgIData(oldp+52,(vlSelf->top__DOT__reg_file__DOT__registers[18]),32);
        bufp->chgIData(oldp+53,(vlSelf->top__DOT__reg_file__DOT__registers[19]),32);
        bufp->chgIData(oldp+54,(vlSelf->top__DOT__reg_file__DOT__registers[20]),32);
        bufp->chgIData(oldp+55,(vlSelf->top__DOT__reg_file__DOT__registers[21]),32);
        bufp->chgIData(oldp+56,(vlSelf->top__DOT__reg_file__DOT__registers[22]),32);
        bufp->chgIData(oldp+57,(vlSelf->top__DOT__reg_file__DOT__registers[23]),32);
        bufp->chgIData(oldp+58,(vlSelf->top__DOT__reg_file__DOT__registers[24]),32);
        bufp->chgIData(oldp+59,(vlSelf->top__DOT__reg_file__DOT__registers[25]),32);
        bufp->chgIData(oldp+60,(vlSelf->top__DOT__reg_file__DOT__registers[26]),32);
        bufp->chgIData(oldp+61,(vlSelf->top__DOT__reg_file__DOT__registers[27]),32);
        bufp->chgIData(oldp+62,(vlSelf->top__DOT__reg_file__DOT__registers[28]),32);
        bufp->chgIData(oldp+63,(vlSelf->top__DOT__reg_file__DOT__registers[29]),32);
        bufp->chgIData(oldp+64,(vlSelf->top__DOT__reg_file__DOT__registers[30]),32);
        bufp->chgIData(oldp+65,(vlSelf->top__DOT__reg_file__DOT__registers[31]),32);
        bufp->chgIData(oldp+66,(vlSelf->top__DOT__reg_file__DOT__i),32);
    }
    bufp->chgBit(oldp+67,(vlSelf->clk));
    bufp->chgBit(oldp+68,(vlSelf->rst));
    bufp->chgIData(oldp+69,(vlSelf->pc),32);
    bufp->chgBit(oldp+70,(vlSelf->ram_we));
    bufp->chgIData(oldp+71,(vlSelf->ram_addr),32);
    bufp->chgIData(oldp+72,(vlSelf->ram_wdata),32);
    bufp->chgIData(oldp+73,(((IData)(4U) + vlSelf->pc)),32);
}

void Vtop___024root__trace_cleanup(void* voidSelf, VerilatedFst* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_cleanup\n"); );
    // Init
    Vtop___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtop___024root*>(voidSelf);
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
}
