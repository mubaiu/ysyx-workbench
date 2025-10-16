// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_fst_c.h"
#include "Vcomputer__Syms.h"


void Vcomputer___024root__trace_chg_0_sub_0(Vcomputer___024root* vlSelf, VerilatedFst::Buffer* bufp);

void Vcomputer___024root__trace_chg_0(void* voidSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_chg_0\n"); );
    // Init
    Vcomputer___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vcomputer___024root*>(voidSelf);

    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;

    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;

    // Body
    Vcomputer___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void Vcomputer___024root__trace_chg_0_sub_0(Vcomputer___024root* vlSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_chg_0_sub_0\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);

    // Body
    if (VL_UNLIKELY(((vlSelfRef.__Vm_traceActivity[1U] 
                      | vlSelfRef.__Vm_traceActivity
                      [2U])))) {
        bufp->chgCData(oldp+0,(vlSelfRef.computer__DOT__io_slave_size),2);
        bufp->chgCData(oldp+1,(((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                 ? (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg)
                                 : 0U)),4);
        bufp->chgBit(oldp+2,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg));
        bufp->chgBit(oldp+3,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg) 
                              & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg))));
        bufp->chgCData(oldp+4,(vlSelfRef.computer__DOT__cpu__DOT__rs1_addr),5);
        bufp->chgCData(oldp+5,(vlSelfRef.computer__DOT__cpu__DOT__rs2_addr),5);
        bufp->chgCData(oldp+6,(vlSelfRef.computer__DOT__cpu__DOT__rd_addr),5);
        bufp->chgIData(oldp+7,(vlSelfRef.computer__DOT__cpu__DOT__rs1_data),32);
        bufp->chgIData(oldp+8,(vlSelfRef.computer__DOT__cpu__DOT__rs2_data),32);
        bufp->chgIData(oldp+9,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__rd_data),32);
        bufp->chgBit(oldp+10,(vlSelfRef.computer__DOT__cpu__DOT__reg_write));
        bufp->chgIData(oldp+11,(vlSelfRef.computer__DOT__cpu__DOT__imm),32);
        bufp->chgCData(oldp+12,(vlSelfRef.computer__DOT__cpu__DOT__alu_op),4);
        bufp->chgBit(oldp+13,(vlSelfRef.computer__DOT__cpu__DOT__mem_read));
        bufp->chgBit(oldp+14,(vlSelfRef.computer__DOT__cpu__DOT__mem_write));
        bufp->chgBit(oldp+15,(vlSelfRef.computer__DOT__cpu__DOT__alu_src));
        bufp->chgBit(oldp+16,(vlSelfRef.computer__DOT__cpu__DOT__branch));
        bufp->chgBit(oldp+17,(vlSelfRef.computer__DOT__cpu__DOT__jal_en));
        bufp->chgBit(oldp+18,(vlSelfRef.computer__DOT__cpu__DOT__jalr_en));
        bufp->chgBit(oldp+19,(vlSelfRef.computer__DOT__cpu__DOT__ebreak_en));
        bufp->chgBit(oldp+20,(vlSelfRef.computer__DOT__cpu__DOT__ecall_en));
        bufp->chgBit(oldp+21,(vlSelfRef.computer__DOT__cpu__DOT__mret_en));
        bufp->chgBit(oldp+22,(vlSelfRef.computer__DOT__cpu__DOT__auipc_flag));
        bufp->chgBit(oldp+23,(vlSelfRef.computer__DOT__cpu__DOT__is_csr_op));
        bufp->chgCData(oldp+24,(vlSelfRef.computer__DOT__cpu__DOT__lsu_wmask),4);
        bufp->chgIData(oldp+25,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__alu_result),32);
        bufp->chgBit(oldp+26,(((~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)) 
                               & (((IData)(vlSelfRef.computer__DOT__cpu__DOT__branch) 
                                   & (((IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op) 
                                       >> 3U) & ((4U 
                                                  & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                  ? 
                                                 ((2U 
                                                   & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                   ? 
                                                  ((1U 
                                                    & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                    ? 
                                                   (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                    >= vlSelfRef.computer__DOT__cpu__DOT__rs2_data)
                                                    : 
                                                   (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                    < vlSelfRef.computer__DOT__cpu__DOT__rs2_data))
                                                   : 
                                                  ((1U 
                                                    & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                    ? 
                                                   VL_GTES_III(32, vlSelfRef.computer__DOT__cpu__DOT__rs1_data, vlSelfRef.computer__DOT__cpu__DOT__rs2_data)
                                                    : 
                                                   VL_LTS_III(32, vlSelfRef.computer__DOT__cpu__DOT__rs1_data, vlSelfRef.computer__DOT__cpu__DOT__rs2_data)))
                                                  : 
                                                 (((IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op) 
                                                   >> 1U) 
                                                  & ((1U 
                                                      & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                      ? 
                                                     (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                      != vlSelfRef.computer__DOT__cpu__DOT__rs2_data)
                                                      : 
                                                     (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                      == vlSelfRef.computer__DOT__cpu__DOT__rs2_data)))))) 
                                  | (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_0)))));
        bufp->chgIData(oldp+27,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)
                                  ? 0U : ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_0)
                                           ? (((0U 
                                                == (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op)) 
                                               & ((IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_src) 
                                                  & (IData)(vlSelfRef.computer__DOT__cpu__DOT__jal_en)))
                                               ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_1
                                               : (0xfffffffeU 
                                                  & (vlSelfRef.computer__DOT__cpu__DOT__imm 
                                                     + vlSelfRef.computer__DOT__cpu__DOT__rs1_data)))
                                           : vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_1))),32);
        bufp->chgBit(oldp+28,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__ecall_taken));
        bufp->chgIData(oldp+29,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__ecall_taken)
                                  ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec
                                  : 0U)),32);
        bufp->chgBit(oldp+30,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mret_taken));
        bufp->chgIData(oldp+31,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mret_taken)
                                  ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc
                                  : 0U)),32);
        bufp->chgIData(oldp+32,(vlSelfRef.computer__DOT__cpu__DOT__load_data),32);
        bufp->chgCData(oldp+33,(vlSelfRef.computer__DOT__cpu__DOT__funct3),3);
        bufp->chgCData(oldp+34,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg),4);
        bufp->chgCData(oldp+35,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__next_state),3);
        bufp->chgIData(oldp+36,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a),32);
        bufp->chgIData(oldp+37,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b),32);
        bufp->chgIData(oldp+38,(((0x00000300U == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                  ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus
                                  : ((0x00000341U == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                      ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc
                                      : ((0x00000342U 
                                          == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                          ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause
                                          : ((0x00000305U 
                                              == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                              ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec
                                              : ((0x00000b00U 
                                                  == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                                  ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle
                                                  : 
                                                 ((0x00000b80U 
                                                   == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                                   ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh
                                                   : 
                                                  ((0x00000f11U 
                                                    == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                                    ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mvendorid
                                                    : 
                                                   ((0x00000f12U 
                                                     == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                                     ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__marchid
                                                     : 0U))))))))),32);
        bufp->chgBit(oldp+39,((((IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op) 
                                >> 3U) & ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                           ? ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                               ? ((1U 
                                                   & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                   ? 
                                                  (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                   >= vlSelfRef.computer__DOT__cpu__DOT__rs2_data)
                                                   : 
                                                  (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                   < vlSelfRef.computer__DOT__cpu__DOT__rs2_data))
                                               : ((1U 
                                                   & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                   ? 
                                                  VL_GTES_III(32, vlSelfRef.computer__DOT__cpu__DOT__rs1_data, vlSelfRef.computer__DOT__cpu__DOT__rs2_data)
                                                   : 
                                                  VL_LTS_III(32, vlSelfRef.computer__DOT__cpu__DOT__rs1_data, vlSelfRef.computer__DOT__cpu__DOT__rs2_data)))
                                           : (((IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op) 
                                               >> 1U) 
                                              & ((1U 
                                                  & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                  ? 
                                                 (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                  != vlSelfRef.computer__DOT__cpu__DOT__rs2_data)
                                                  : 
                                                 (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                  == vlSelfRef.computer__DOT__cpu__DOT__rs2_data)))))));
        bufp->chgCData(oldp+40,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode),7);
        bufp->chgCData(oldp+41,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7),7);
        bufp->chgIData(oldp+42,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mret_taken)
                                  ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc
                                  : ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__ecall_taken)
                                      ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec
                                      : (((~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)) 
                                          & (((IData)(vlSelfRef.computer__DOT__cpu__DOT__branch) 
                                              & (((IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op) 
                                                  >> 3U) 
                                                 & ((4U 
                                                     & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                     ? 
                                                    ((2U 
                                                      & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                      ? 
                                                     ((1U 
                                                       & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                       ? 
                                                      (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                       >= vlSelfRef.computer__DOT__cpu__DOT__rs2_data)
                                                       : 
                                                      (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                       < vlSelfRef.computer__DOT__cpu__DOT__rs2_data))
                                                      : 
                                                     ((1U 
                                                       & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                       ? 
                                                      VL_GTES_III(32, vlSelfRef.computer__DOT__cpu__DOT__rs1_data, vlSelfRef.computer__DOT__cpu__DOT__rs2_data)
                                                       : 
                                                      VL_LTS_III(32, vlSelfRef.computer__DOT__cpu__DOT__rs1_data, vlSelfRef.computer__DOT__cpu__DOT__rs2_data)))
                                                     : 
                                                    (((IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op) 
                                                      >> 1U) 
                                                     & ((1U 
                                                         & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                         ? 
                                                        (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                         != vlSelfRef.computer__DOT__cpu__DOT__rs2_data)
                                                         : 
                                                        (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                         == vlSelfRef.computer__DOT__cpu__DOT__rs2_data)))))) 
                                             | (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_0)))
                                          ? ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)
                                              ? 0U : 
                                             ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_0)
                                               ? ((
                                                   (0U 
                                                    == (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op)) 
                                                   & ((IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_src) 
                                                      & (IData)(vlSelfRef.computer__DOT__cpu__DOT__jal_en)))
                                                   ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_1
                                                   : 
                                                  (0xfffffffeU 
                                                   & (vlSelfRef.computer__DOT__cpu__DOT__imm 
                                                      + vlSelfRef.computer__DOT__cpu__DOT__rs1_data)))
                                               : vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_1))
                                          : ((IData)(4U) 
                                             + vlSelfRef.computer__DOT__cpu__DOT__pc))))),32);
        bufp->chgIData(oldp+43,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg),32);
        bufp->chgIData(oldp+44,(((0U == (IData)(vlSelfRef.computer__DOT__io_slave_size))
                                  ? 1U : ((1U == (IData)(vlSelfRef.computer__DOT__io_slave_size))
                                           ? 2U : (
                                                   (2U 
                                                    == (IData)(vlSelfRef.computer__DOT__io_slave_size))
                                                    ? 4U
                                                    : 0U)))),32);
    }
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[2U]))) {
        bufp->chgIData(oldp+45,(((1U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                  ? vlSelfRef.computer__DOT__cpu__DOT__pc
                                  : vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)),32);
        bufp->chgBit(oldp+46,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_arvalid));
        bufp->chgBit(oldp+47,(((1U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                ? (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_ifu_rready)
                                : ((2U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                                   & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_rready)))));
        bufp->chgBit(oldp+48,(vlSelfRef.computer__DOT__io_slave_arready));
        bufp->chgIData(oldp+49,(vlSelfRef.computer__DOT__io_slave_rdata),32);
        bufp->chgCData(oldp+50,(vlSelfRef.computer__DOT__io_slave_rresp),2);
        bufp->chgBit(oldp+51,(vlSelfRef.computer__DOT__io_slave_rvalid));
        bufp->chgIData(oldp+52,(((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                  ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg
                                  : 0U)),32);
        bufp->chgBit(oldp+53,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_awvalid));
        bufp->chgIData(oldp+54,(((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                  ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg
                                  : 0U)),32);
        bufp->chgBit(oldp+55,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_wvalid));
        bufp->chgBit(oldp+56,(((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                               && (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_bready))));
        bufp->chgBit(oldp+57,(vlSelfRef.computer__DOT__io_slave_awready));
        bufp->chgBit(oldp+58,(vlSelfRef.computer__DOT__io_slave_wready));
        bufp->chgCData(oldp+59,(vlSelfRef.computer__DOT__io_slave_bresp),2);
        bufp->chgBit(oldp+60,(vlSelfRef.computer__DOT__io_slave_bvalid));
        bufp->chgIData(oldp+61,(vlSelfRef.computer__DOT__cpu__DOT__pc),32);
        bufp->chgIData(oldp+62,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg),32);
        bufp->chgBit(oldp+63,(vlSelfRef.computer__DOT__cpu__DOT__inst_valid));
        bufp->chgBit(oldp+64,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg));
        bufp->chgIData(oldp+65,(((IData)(4U) + vlSelfRef.computer__DOT__cpu__DOT__pc)),32);
        bufp->chgBit(oldp+66,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__mem_to_reg));
        bufp->chgBit(oldp+67,(vlSelfRef.computer__DOT__cpu__DOT__io_ifu_arvalid));
        bufp->chgBit(oldp+68,(vlSelfRef.computer__DOT__cpu__DOT__io_ifu_rready));
        bufp->chgBit(oldp+69,(((1U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                               & (IData)(vlSelfRef.computer__DOT__io_slave_rvalid))));
        bufp->chgBit(oldp+70,(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_arvalid));
        bufp->chgIData(oldp+71,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg),32);
        bufp->chgBit(oldp+72,(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_rready));
        bufp->chgIData(oldp+73,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata),32);
        bufp->chgBit(oldp+74,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid));
        bufp->chgCData(oldp+75,(((2U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                  ? (IData)(vlSelfRef.computer__DOT__io_slave_rresp)
                                  : ((4U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                      ? (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_clint_rresp)
                                      : 0U))),2);
        bufp->chgBit(oldp+76,(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_awvalid));
        bufp->chgIData(oldp+77,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg),32);
        bufp->chgBit(oldp+78,(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_wvalid));
        bufp->chgBit(oldp+79,(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_bready));
        bufp->chgBit(oldp+80,(((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                               & (IData)(vlSelfRef.computer__DOT__io_slave_bvalid))));
        bufp->chgBit(oldp+81,(vlSelfRef.computer__DOT__cpu__DOT__io_clint_arready));
        bufp->chgBit(oldp+82,(vlSelfRef.computer__DOT__cpu__DOT__io_clint_rvalid));
        bufp->chgIData(oldp+83,(vlSelfRef.computer__DOT__cpu__DOT__io_clint_rdata),32);
        bufp->chgCData(oldp+84,(vlSelfRef.computer__DOT__cpu__DOT__io_clint_rresp),2);
        bufp->chgBit(oldp+85,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_arvalid));
        bufp->chgIData(oldp+86,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_araddr),32);
        bufp->chgBit(oldp+87,(((4U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                               & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_rready))));
        bufp->chgBit(oldp+88,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__is_clint_access));
        bufp->chgCData(oldp+89,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state),3);
        bufp->chgBit(oldp+90,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_arvalid) 
                               & (IData)(vlSelfRef.computer__DOT__io_slave_arready))));
        bufp->chgBit(oldp+91,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake));
        bufp->chgBit(oldp+92,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_awvalid) 
                               & (IData)(vlSelfRef.computer__DOT__io_slave_awready))));
        bufp->chgBit(oldp+93,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_wvalid) 
                               & (IData)(vlSelfRef.computer__DOT__io_slave_wready))));
        bufp->chgBit(oldp+94,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake));
        bufp->chgBit(oldp+95,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_arvalid) 
                               & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_clint_arready))));
        bufp->chgBit(oldp+96,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__clint_r_handshake));
        bufp->chgBit(oldp+97,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_awvalid) 
                               & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_wvalid))));
        bufp->chgBit(oldp+98,(((~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__is_clint_access)) 
                               & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_arvalid))));
        bufp->chgBit(oldp+99,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_arvalid) 
                               & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__is_clint_access))));
        bufp->chgQData(oldp+100,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime),64);
        bufp->chgBit(oldp+102,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__ar_handshake));
        bufp->chgIData(oldp+103,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus),32);
        bufp->chgIData(oldp+104,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc),32);
        bufp->chgIData(oldp+105,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause),32);
        bufp->chgIData(oldp+106,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec),32);
        bufp->chgIData(oldp+107,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle),32);
        bufp->chgIData(oldp+108,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh),32);
        bufp->chgIData(oldp+109,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mvendorid),32);
        bufp->chgIData(oldp+110,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__marchid),32);
        bufp->chgIData(oldp+111,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg),32);
        bufp->chgCData(oldp+112,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state),3);
        bufp->chgBit(oldp+113,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake));
        bufp->chgBit(oldp+114,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake));
        bufp->chgBit(oldp+115,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake));
        bufp->chgBit(oldp+116,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake));
        bufp->chgBit(oldp+117,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake));
        bufp->chgBit(oldp+118,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake));
        bufp->chgBit(oldp+119,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag));
        bufp->chgIData(oldp+120,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0]),32);
        bufp->chgIData(oldp+121,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[1]),32);
        bufp->chgIData(oldp+122,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[2]),32);
        bufp->chgIData(oldp+123,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[3]),32);
        bufp->chgIData(oldp+124,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[4]),32);
        bufp->chgIData(oldp+125,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[5]),32);
        bufp->chgIData(oldp+126,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[6]),32);
        bufp->chgIData(oldp+127,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[7]),32);
        bufp->chgIData(oldp+128,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[8]),32);
        bufp->chgIData(oldp+129,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[9]),32);
        bufp->chgIData(oldp+130,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[10]),32);
        bufp->chgIData(oldp+131,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[11]),32);
        bufp->chgIData(oldp+132,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[12]),32);
        bufp->chgIData(oldp+133,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[13]),32);
        bufp->chgIData(oldp+134,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[14]),32);
        bufp->chgIData(oldp+135,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[15]),32);
        bufp->chgIData(oldp+136,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[16]),32);
        bufp->chgIData(oldp+137,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[17]),32);
        bufp->chgIData(oldp+138,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[18]),32);
        bufp->chgIData(oldp+139,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[19]),32);
        bufp->chgIData(oldp+140,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[20]),32);
        bufp->chgIData(oldp+141,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[21]),32);
        bufp->chgIData(oldp+142,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[22]),32);
        bufp->chgIData(oldp+143,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[23]),32);
        bufp->chgIData(oldp+144,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[24]),32);
        bufp->chgIData(oldp+145,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[25]),32);
        bufp->chgIData(oldp+146,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[26]),32);
        bufp->chgIData(oldp+147,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[27]),32);
        bufp->chgIData(oldp+148,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[28]),32);
        bufp->chgIData(oldp+149,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[29]),32);
        bufp->chgIData(oldp+150,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[30]),32);
        bufp->chgIData(oldp+151,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[31]),32);
        bufp->chgIData(oldp+152,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__i),32);
        bufp->chgIData(oldp+153,((0xfffffffcU & ((1U 
                                                  == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                                  ? vlSelfRef.computer__DOT__cpu__DOT__pc
                                                  : vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg))),32);
        bufp->chgBit(oldp+154,(vlSelfRef.computer__DOT__sdram__DOT__ar_handshake));
    }
    bufp->chgBit(oldp+155,(vlSelfRef.clock));
    bufp->chgBit(oldp+156,(vlSelfRef.reset));
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
