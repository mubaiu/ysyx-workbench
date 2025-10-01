// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_fst_c.h"
#include "Vcomputer__Syms.h"


void Vcomputer___024root__trace_chg_sub_0(Vcomputer___024root* vlSelf, VerilatedFst::Buffer* bufp);

void Vcomputer___024root__trace_chg_top_0(void* voidSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_chg_top_0\n"); );
    // Init
    Vcomputer___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vcomputer___024root*>(voidSelf);
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vcomputer___024root__trace_chg_sub_0((&vlSymsp->TOP), bufp);
}

void Vcomputer___024root__trace_chg_sub_0(Vcomputer___024root* vlSelf, VerilatedFst::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_chg_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    if (VL_UNLIKELY((vlSelf->__Vm_traceActivity[1U] 
                     | vlSelf->__Vm_traceActivity[2U]))) {
        bufp->chgCData(oldp+0,(vlSelf->computer__DOT__io_slave_size),2);
        bufp->chgCData(oldp+1,(((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                 ? (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg)
                                 : 0U)),4);
        bufp->chgBit(oldp+2,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg));
        bufp->chgBit(oldp+3,(((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg) 
                              & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg))));
        bufp->chgCData(oldp+4,(vlSelf->computer__DOT__cpu__DOT__rs1_addr),5);
        bufp->chgCData(oldp+5,(vlSelf->computer__DOT__cpu__DOT__rs2_addr),5);
        bufp->chgCData(oldp+6,(vlSelf->computer__DOT__cpu__DOT__rd_addr),5);
        bufp->chgIData(oldp+7,(vlSelf->computer__DOT__cpu__DOT__rs1_data),32);
        bufp->chgIData(oldp+8,(vlSelf->computer__DOT__cpu__DOT__rs2_data),32);
        bufp->chgIData(oldp+9,(vlSelf->computer__DOT__cpu__DOT__wb_data),32);
        bufp->chgBit(oldp+10,(vlSelf->computer__DOT__cpu__DOT__reg_write));
        bufp->chgIData(oldp+11,(vlSelf->computer__DOT__cpu__DOT__imm),32);
        bufp->chgCData(oldp+12,(vlSelf->computer__DOT__cpu__DOT__alu_op),4);
        bufp->chgBit(oldp+13,(vlSelf->computer__DOT__cpu__DOT__mem_read));
        bufp->chgBit(oldp+14,(vlSelf->computer__DOT__cpu__DOT__mem_write));
        bufp->chgBit(oldp+15,(vlSelf->computer__DOT__cpu__DOT__alu_src));
        bufp->chgBit(oldp+16,(vlSelf->computer__DOT__cpu__DOT__branch));
        bufp->chgBit(oldp+17,(vlSelf->computer__DOT__cpu__DOT__jal_en));
        bufp->chgBit(oldp+18,(vlSelf->computer__DOT__cpu__DOT__jalr_en));
        bufp->chgBit(oldp+19,(vlSelf->computer__DOT__cpu__DOT__ebreak_en));
        bufp->chgBit(oldp+20,(vlSelf->computer__DOT__cpu__DOT__ecall_en));
        bufp->chgBit(oldp+21,(vlSelf->computer__DOT__cpu__DOT__mret_en));
        bufp->chgBit(oldp+22,(vlSelf->computer__DOT__cpu__DOT__auipc_flag));
        bufp->chgBit(oldp+23,(vlSelf->computer__DOT__cpu__DOT__is_csr_op));
        bufp->chgCData(oldp+24,(vlSelf->computer__DOT__cpu__DOT__lsu_wmask),4);
        bufp->chgIData(oldp+25,(vlSelf->computer__DOT__cpu__DOT__alu_result),32);
        bufp->chgBit(oldp+26,(((~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)) 
                               & (((IData)(vlSelf->computer__DOT__cpu__DOT__branch) 
                                   & (((IData)(vlSelf->computer__DOT__cpu__DOT__alu_op) 
                                       >> 3U) & ((4U 
                                                  & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                  ? 
                                                 ((2U 
                                                   & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                   ? 
                                                  ((1U 
                                                    & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                    ? 
                                                   (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                    >= vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                    : 
                                                   (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                    < vlSelf->computer__DOT__cpu__DOT__rs2_data))
                                                   : 
                                                  ((1U 
                                                    & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                    ? 
                                                   VL_GTES_III(32, vlSelf->computer__DOT__cpu__DOT__rs1_data, vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                    : 
                                                   VL_LTS_III(32, vlSelf->computer__DOT__cpu__DOT__rs1_data, vlSelf->computer__DOT__cpu__DOT__rs2_data)))
                                                  : 
                                                 (((IData)(vlSelf->computer__DOT__cpu__DOT__alu_op) 
                                                   >> 1U) 
                                                  & ((1U 
                                                      & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                      ? 
                                                     (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                      != vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                      : 
                                                     (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                      == vlSelf->computer__DOT__cpu__DOT__rs2_data)))))) 
                                  | (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h826bb330__0)))));
        bufp->chgIData(oldp+27,(((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)
                                  ? 0U : ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h826bb330__0)
                                           ? (((0U 
                                                == (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op)) 
                                               & ((IData)(vlSelf->computer__DOT__cpu__DOT__alu_src) 
                                                  & (IData)(vlSelf->computer__DOT__cpu__DOT__jal_en)))
                                               ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h8a6dd3c2__0
                                               : (0xfffffffeU 
                                                  & (vlSelf->computer__DOT__cpu__DOT__imm 
                                                     + vlSelf->computer__DOT__cpu__DOT__rs1_data)))
                                           : vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h8a6dd3c2__0))),32);
        bufp->chgBit(oldp+28,(vlSelf->computer__DOT__cpu__DOT__ecall_taken));
        bufp->chgIData(oldp+29,(vlSelf->computer__DOT__cpu__DOT__ecall_target),32);
        bufp->chgBit(oldp+30,(vlSelf->computer__DOT__cpu__DOT__mret_taken));
        bufp->chgIData(oldp+31,(vlSelf->computer__DOT__cpu__DOT__mret_target),32);
        bufp->chgIData(oldp+32,(vlSelf->computer__DOT__cpu__DOT__load_data),32);
        bufp->chgCData(oldp+33,(vlSelf->computer__DOT__cpu__DOT__funct3),3);
        bufp->chgCData(oldp+34,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg),4);
        bufp->chgCData(oldp+35,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__next_state),2);
        bufp->chgIData(oldp+36,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a),32);
        bufp->chgIData(oldp+37,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b),32);
        bufp->chgIData(oldp+38,(((0x300U == vlSelf->computer__DOT__cpu__DOT__imm)
                                  ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus
                                  : ((0x341U == vlSelf->computer__DOT__cpu__DOT__imm)
                                      ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc
                                      : ((0x342U == vlSelf->computer__DOT__cpu__DOT__imm)
                                          ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause
                                          : ((0x305U 
                                              == vlSelf->computer__DOT__cpu__DOT__imm)
                                              ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec
                                              : ((0xb00U 
                                                  == vlSelf->computer__DOT__cpu__DOT__imm)
                                                  ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle
                                                  : 
                                                 ((0xb80U 
                                                   == vlSelf->computer__DOT__cpu__DOT__imm)
                                                   ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh
                                                   : 
                                                  ((0xf11U 
                                                    == vlSelf->computer__DOT__cpu__DOT__imm)
                                                    ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mvendorid
                                                    : 
                                                   ((0xf12U 
                                                     == vlSelf->computer__DOT__cpu__DOT__imm)
                                                     ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__marchid
                                                     : 0U))))))))),32);
        bufp->chgBit(oldp+39,((((IData)(vlSelf->computer__DOT__cpu__DOT__alu_op) 
                                >> 3U) & ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                           ? ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                               ? ((1U 
                                                   & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                   ? 
                                                  (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                   >= vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                   : 
                                                  (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                   < vlSelf->computer__DOT__cpu__DOT__rs2_data))
                                               : ((1U 
                                                   & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                   ? 
                                                  VL_GTES_III(32, vlSelf->computer__DOT__cpu__DOT__rs1_data, vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                   : 
                                                  VL_LTS_III(32, vlSelf->computer__DOT__cpu__DOT__rs1_data, vlSelf->computer__DOT__cpu__DOT__rs2_data)))
                                           : (((IData)(vlSelf->computer__DOT__cpu__DOT__alu_op) 
                                               >> 1U) 
                                              & ((1U 
                                                  & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                  ? 
                                                 (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                  != vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                  : 
                                                 (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                  == vlSelf->computer__DOT__cpu__DOT__rs2_data)))))));
        bufp->chgCData(oldp+40,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode),7);
        bufp->chgCData(oldp+41,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7),7);
        bufp->chgIData(oldp+42,(((IData)(vlSelf->computer__DOT__cpu__DOT__mret_taken)
                                  ? vlSelf->computer__DOT__cpu__DOT__mret_target
                                  : ((IData)(vlSelf->computer__DOT__cpu__DOT__ecall_taken)
                                      ? vlSelf->computer__DOT__cpu__DOT__ecall_target
                                      : (((~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)) 
                                          & (((IData)(vlSelf->computer__DOT__cpu__DOT__branch) 
                                              & (((IData)(vlSelf->computer__DOT__cpu__DOT__alu_op) 
                                                  >> 3U) 
                                                 & ((4U 
                                                     & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                     ? 
                                                    ((2U 
                                                      & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                      ? 
                                                     ((1U 
                                                       & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                       ? 
                                                      (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                       >= vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                       : 
                                                      (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                       < vlSelf->computer__DOT__cpu__DOT__rs2_data))
                                                      : 
                                                     ((1U 
                                                       & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                       ? 
                                                      VL_GTES_III(32, vlSelf->computer__DOT__cpu__DOT__rs1_data, vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                       : 
                                                      VL_LTS_III(32, vlSelf->computer__DOT__cpu__DOT__rs1_data, vlSelf->computer__DOT__cpu__DOT__rs2_data)))
                                                     : 
                                                    (((IData)(vlSelf->computer__DOT__cpu__DOT__alu_op) 
                                                      >> 1U) 
                                                     & ((1U 
                                                         & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                         ? 
                                                        (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                         != vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                         : 
                                                        (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                         == vlSelf->computer__DOT__cpu__DOT__rs2_data)))))) 
                                             | (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h826bb330__0)))
                                          ? ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)
                                              ? 0U : 
                                             ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h826bb330__0)
                                               ? ((
                                                   (0U 
                                                    == (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op)) 
                                                   & ((IData)(vlSelf->computer__DOT__cpu__DOT__alu_src) 
                                                      & (IData)(vlSelf->computer__DOT__cpu__DOT__jal_en)))
                                                   ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h8a6dd3c2__0
                                                   : 
                                                  (0xfffffffeU 
                                                   & (vlSelf->computer__DOT__cpu__DOT__imm 
                                                      + vlSelf->computer__DOT__cpu__DOT__rs1_data)))
                                               : vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h8a6dd3c2__0))
                                          : ((IData)(4U) 
                                             + vlSelf->computer__DOT__cpu__DOT__pc))))),32);
        bufp->chgIData(oldp+43,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg),32);
        bufp->chgIData(oldp+44,(((0U == (IData)(vlSelf->computer__DOT__io_slave_size))
                                  ? 1U : ((1U == (IData)(vlSelf->computer__DOT__io_slave_size))
                                           ? 2U : (
                                                   (2U 
                                                    == (IData)(vlSelf->computer__DOT__io_slave_size))
                                                    ? 4U
                                                    : 0U)))),32);
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[2U])) {
        bufp->chgIData(oldp+45,(((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                  ? vlSelf->computer__DOT__cpu__DOT__pc
                                  : vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)),32);
        bufp->chgBit(oldp+46,(vlSelf->computer__DOT__io_slave_arvalid));
        bufp->chgBit(oldp+47,(((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                ? (IData)(vlSelf->computer__DOT__cpu__DOT__io_ifu_rready)
                                : ((2U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                                   & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_rready)))));
        bufp->chgBit(oldp+48,(vlSelf->computer__DOT__io_slave_arready));
        bufp->chgIData(oldp+49,(vlSelf->computer__DOT__io_slave_rdata),32);
        bufp->chgCData(oldp+50,(vlSelf->computer__DOT__io_slave_rresp),2);
        bufp->chgBit(oldp+51,(vlSelf->computer__DOT__io_slave_rvalid));
        bufp->chgIData(oldp+52,(((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                  ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg
                                  : 0U)),32);
        bufp->chgBit(oldp+53,(vlSelf->computer__DOT__io_slave_awvalid));
        bufp->chgIData(oldp+54,(((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                  ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg
                                  : 0U)),32);
        bufp->chgBit(oldp+55,(vlSelf->computer__DOT__io_slave_wvalid));
        bufp->chgBit(oldp+56,(((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                               & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_bready))));
        bufp->chgBit(oldp+57,(vlSelf->computer__DOT__io_slave_awready));
        bufp->chgBit(oldp+58,(vlSelf->computer__DOT__io_slave_wready));
        bufp->chgCData(oldp+59,(vlSelf->computer__DOT__io_slave_bresp),2);
        bufp->chgBit(oldp+60,(vlSelf->computer__DOT__io_slave_bvalid));
        bufp->chgIData(oldp+61,(vlSelf->computer__DOT__cpu__DOT__pc),32);
        bufp->chgIData(oldp+62,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg),32);
        bufp->chgBit(oldp+63,(vlSelf->computer__DOT__cpu__DOT__inst_valid));
        bufp->chgBit(oldp+64,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg));
        bufp->chgIData(oldp+65,(((IData)(4U) + vlSelf->computer__DOT__cpu__DOT__pc)),32);
        bufp->chgBit(oldp+66,(vlSelf->computer__DOT__cpu__DOT__mem_to_reg));
        bufp->chgBit(oldp+67,(vlSelf->computer__DOT__cpu__DOT__io_ifu_arvalid));
        bufp->chgBit(oldp+68,(vlSelf->computer__DOT__cpu__DOT__io_ifu_rready));
        bufp->chgBit(oldp+69,(((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                               & (IData)(vlSelf->computer__DOT__io_slave_rvalid))));
        bufp->chgBit(oldp+70,(vlSelf->computer__DOT__cpu__DOT__io_lsu_arvalid));
        bufp->chgIData(oldp+71,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg),32);
        bufp->chgBit(oldp+72,(vlSelf->computer__DOT__cpu__DOT__io_lsu_rready));
        bufp->chgBit(oldp+73,(vlSelf->computer__DOT__cpu__DOT__io_lsu_rvalid));
        bufp->chgBit(oldp+74,(vlSelf->computer__DOT__cpu__DOT__io_lsu_awvalid));
        bufp->chgIData(oldp+75,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg),32);
        bufp->chgBit(oldp+76,(vlSelf->computer__DOT__cpu__DOT__io_lsu_wvalid));
        bufp->chgBit(oldp+77,(vlSelf->computer__DOT__cpu__DOT__io_lsu_bready));
        bufp->chgBit(oldp+78,(((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                               & (IData)(vlSelf->computer__DOT__io_slave_bvalid))));
        bufp->chgCData(oldp+79,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state),2);
        bufp->chgBit(oldp+80,(((IData)(vlSelf->computer__DOT__io_slave_arvalid) 
                               & (IData)(vlSelf->computer__DOT__io_slave_arready))));
        bufp->chgBit(oldp+81,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake));
        bufp->chgBit(oldp+82,(((IData)(vlSelf->computer__DOT__io_slave_awvalid) 
                               & (IData)(vlSelf->computer__DOT__io_slave_awready))));
        bufp->chgBit(oldp+83,(((IData)(vlSelf->computer__DOT__io_slave_wvalid) 
                               & (IData)(vlSelf->computer__DOT__io_slave_wready))));
        bufp->chgBit(oldp+84,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake));
        bufp->chgBit(oldp+85,(((IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_awvalid) 
                               & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_wvalid))));
        bufp->chgIData(oldp+86,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus),32);
        bufp->chgIData(oldp+87,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc),32);
        bufp->chgIData(oldp+88,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause),32);
        bufp->chgIData(oldp+89,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec),32);
        bufp->chgIData(oldp+90,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle),32);
        bufp->chgIData(oldp+91,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh),32);
        bufp->chgIData(oldp+92,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mvendorid),32);
        bufp->chgIData(oldp+93,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__marchid),32);
        bufp->chgIData(oldp+94,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg),32);
        bufp->chgCData(oldp+95,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state),3);
        bufp->chgBit(oldp+96,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake));
        bufp->chgBit(oldp+97,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake));
        bufp->chgBit(oldp+98,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake));
        bufp->chgBit(oldp+99,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake));
        bufp->chgBit(oldp+100,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake));
        bufp->chgBit(oldp+101,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake));
        bufp->chgBit(oldp+102,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag));
        bufp->chgIData(oldp+103,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0]),32);
        bufp->chgIData(oldp+104,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[1]),32);
        bufp->chgIData(oldp+105,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[2]),32);
        bufp->chgIData(oldp+106,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[3]),32);
        bufp->chgIData(oldp+107,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[4]),32);
        bufp->chgIData(oldp+108,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[5]),32);
        bufp->chgIData(oldp+109,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[6]),32);
        bufp->chgIData(oldp+110,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[7]),32);
        bufp->chgIData(oldp+111,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[8]),32);
        bufp->chgIData(oldp+112,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[9]),32);
        bufp->chgIData(oldp+113,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[10]),32);
        bufp->chgIData(oldp+114,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[11]),32);
        bufp->chgIData(oldp+115,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[12]),32);
        bufp->chgIData(oldp+116,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[13]),32);
        bufp->chgIData(oldp+117,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[14]),32);
        bufp->chgIData(oldp+118,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[15]),32);
        bufp->chgIData(oldp+119,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[16]),32);
        bufp->chgIData(oldp+120,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[17]),32);
        bufp->chgIData(oldp+121,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[18]),32);
        bufp->chgIData(oldp+122,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[19]),32);
        bufp->chgIData(oldp+123,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[20]),32);
        bufp->chgIData(oldp+124,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[21]),32);
        bufp->chgIData(oldp+125,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[22]),32);
        bufp->chgIData(oldp+126,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[23]),32);
        bufp->chgIData(oldp+127,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[24]),32);
        bufp->chgIData(oldp+128,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[25]),32);
        bufp->chgIData(oldp+129,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[26]),32);
        bufp->chgIData(oldp+130,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[27]),32);
        bufp->chgIData(oldp+131,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[28]),32);
        bufp->chgIData(oldp+132,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[29]),32);
        bufp->chgIData(oldp+133,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[30]),32);
        bufp->chgIData(oldp+134,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[31]),32);
        bufp->chgIData(oldp+135,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__i),32);
        bufp->chgIData(oldp+136,((0xfffffffcU & ((1U 
                                                  == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                                  ? vlSelf->computer__DOT__cpu__DOT__pc
                                                  : vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg))),32);
    }
    bufp->chgBit(oldp+137,(vlSelf->clock));
    bufp->chgBit(oldp+138,(vlSelf->reset));
}

void Vcomputer___024root__trace_cleanup(void* voidSelf, VerilatedFst* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_cleanup\n"); );
    // Init
    Vcomputer___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vcomputer___024root*>(voidSelf);
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
}
