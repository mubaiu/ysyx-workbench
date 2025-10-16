// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcomputer.h for the primary calling header

#include "Vcomputer__pch.h"
#include "Vcomputer___024root.h"

VL_ATTR_COLD void Vcomputer___024root___eval_static(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_static\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vtrigprevexpr___TOP__clock__0 = vlSelfRef.clock;
}

VL_ATTR_COLD void Vcomputer___024root___eval_initial(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_initial\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vcomputer___024root___eval_final(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_final\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__stl(Vcomputer___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vcomputer___024root___eval_phase__stl(Vcomputer___024root* vlSelf);

VL_ATTR_COLD void Vcomputer___024root___eval_settle(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_settle\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY(((0x00000064U < __VstlIterCount)))) {
#ifdef VL_DEBUG
            Vcomputer___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("vsrc/computer.v", 1, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vcomputer___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelfRef.__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__stl(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___dump_triggers__stl\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VstlTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vcomputer___024root___stl_sequent__TOP__0(Vcomputer___024root* vlSelf);
VL_ATTR_COLD void Vcomputer___024root____Vm_traceActivitySetAll(Vcomputer___024root* vlSelf);

VL_ATTR_COLD void Vcomputer___024root___eval_stl(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_stl\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        Vcomputer___024root___stl_sequent__TOP__0(vlSelf);
        Vcomputer___024root____Vm_traceActivitySetAll(vlSelf);
    }
}

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(IData/*31:0*/ thispc);
extern const VlUnpacked<CData/*2:0*/, 2048> Vcomputer__ConstPool__TABLE_h79cc5618_0;
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__ebreak_TOP();

VL_ATTR_COLD void Vcomputer___024root___stl_sequent__TOP__0(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___stl_sequent__TOP__0\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_araddr 
        = ((4U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
            ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg
            : 0U);
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake 
        = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__io_ifu_rready) 
           & ((1U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
              & (IData)(vlSelfRef.computer__DOT__io_slave_rvalid)));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake 
        = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_bready) 
           & ((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
              & (IData)(vlSelfRef.computer__DOT__io_slave_bvalid)));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_awvalid 
        = ((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
           && (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_awvalid));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_wvalid 
        = ((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
           && (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_wvalid));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_arvalid 
        = ((4U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_arvalid));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_arvalid 
        = ((1U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
            ? (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_ifu_arvalid)
            : ((2U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
               & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_arvalid)));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__is_clint_access 
        = ((0xa0000048U <= vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg) 
           & (0xa000004cU >= vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg));
    if ((2U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))) {
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
            = vlSelfRef.computer__DOT__io_slave_rdata;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid 
            = vlSelfRef.computer__DOT__io_slave_rvalid;
    } else if ((4U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))) {
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
            = vlSelfRef.computer__DOT__cpu__DOT__io_clint_rdata;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid 
            = vlSelfRef.computer__DOT__cpu__DOT__io_clint_rvalid;
    } else {
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid = 0U;
    }
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake 
        = (((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
            && (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_bready)) 
           & (IData)(vlSelfRef.computer__DOT__io_slave_bvalid));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__clint_r_handshake 
        = (((4U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
            & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_rready)) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_clint_rvalid));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake 
        = (((1U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
             ? (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_ifu_rready)
             : ((2U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_rready))) 
           & (IData)(vlSelfRef.computer__DOT__io_slave_rvalid));
    vlSelfRef.computer__DOT__cpu__DOT__lsu_wmask = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__alu_op = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__mem_read = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__mem_write = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__reg_write = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__alu_src = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__auipc_flag = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__ecall_en = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__ebreak_en = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__mret_en = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__branch = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__jal_en = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__jalr_en = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__imm = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__is_csr_op = 0U;
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg = 1U;
    if (vlSelfRef.computer__DOT__cpu__DOT__inst_valid) {
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode 
            = (0x0000007fU & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg);
        vlSelfRef.computer__DOT__cpu__DOT__funct3 = 
            (7U & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                   >> 0x0cU));
        vlSelfRef.computer__DOT__cpu__DOT__rs2_addr 
            = (0x0fU & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                        >> 0x14U));
        vlSelfRef.computer__DOT__cpu__DOT__rd_addr 
            = (0x0fU & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                        >> 7U));
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg 
            = (1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__inst_valid)));
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7 
            = (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
               >> 0x19U);
        vlSelfRef.computer__DOT__cpu__DOT__rs1_addr 
            = (0x0fU & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                        >> 0x0fU));
        if ((0x00000040U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
            if ((0x00000020U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if ((0x00000010U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((8U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        if (vlSelfRef.reset) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                        }
                    } else if ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        if (vlSelfRef.reset) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                        }
                    } else if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                            if ((0U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))) {
                                if ((0U == (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                            >> 0x14U))) {
                                    vlSelfRef.computer__DOT__cpu__DOT__ecall_en = 1U;
                                } else if ((1U == (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                   >> 0x14U))) {
                                    vlSelfRef.computer__DOT__cpu__DOT__ebreak_en = 1U;
                                } else if ((0x0302U 
                                            == (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                >> 0x14U))) {
                                    vlSelfRef.computer__DOT__cpu__DOT__mret_en = 1U;
                                } else {
                                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                                }
                            } else if ((1U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))) {
                                vlSelfRef.computer__DOT__cpu__DOT__reg_write = 1U;
                                vlSelfRef.computer__DOT__cpu__DOT__is_csr_op = 1U;
                                vlSelfRef.computer__DOT__cpu__DOT__alu_op = 0x0cU;
                                vlSelfRef.computer__DOT__cpu__DOT__imm 
                                    = (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                       >> 0x14U);
                            } else if ((2U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))) {
                                vlSelfRef.computer__DOT__cpu__DOT__reg_write = 1U;
                                vlSelfRef.computer__DOT__cpu__DOT__is_csr_op 
                                    = (0U != (IData)(vlSelfRef.computer__DOT__cpu__DOT__rs1_addr));
                                vlSelfRef.computer__DOT__cpu__DOT__alu_op = 0x0cU;
                                vlSelfRef.computer__DOT__cpu__DOT__imm 
                                    = (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                       >> 0x14U);
                            } else {
                                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                            }
                        } else if (vlSelfRef.reset) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                        }
                    } else if (vlSelfRef.reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                    }
                } else if ((8U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                            if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                                vlSelfRef.computer__DOT__cpu__DOT__reg_write = 1U;
                                vlSelfRef.computer__DOT__cpu__DOT__jal_en = 1U;
                                vlSelfRef.computer__DOT__cpu__DOT__alu_src = 1U;
                                vlSelfRef.computer__DOT__cpu__DOT__alu_op = 0U;
                                vlSelfRef.computer__DOT__cpu__DOT__imm 
                                    = (((- (IData)(
                                                   (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                    >> 0x1fU))) 
                                        << 0x00000014U) 
                                       | ((((0x000001feU 
                                             & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                >> 0x0000000bU)) 
                                            | (1U & 
                                               (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                >> 0x14U))) 
                                           << 0x0000000bU) 
                                          | (0x000007feU 
                                             & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                >> 0x00000014U))));
                            } else if (vlSelfRef.reset) {
                                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                            }
                        } else if (vlSelfRef.reset) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                        }
                    } else if (vlSelfRef.reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                    }
                } else if ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                            vlSelfRef.computer__DOT__cpu__DOT__reg_write = 1U;
                            vlSelfRef.computer__DOT__cpu__DOT__jalr_en = 1U;
                            vlSelfRef.computer__DOT__cpu__DOT__alu_src = 1U;
                            vlSelfRef.computer__DOT__cpu__DOT__alu_op = 0U;
                            vlSelfRef.computer__DOT__cpu__DOT__imm 
                                = (((- (IData)((vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                >> 0x1fU))) 
                                    << 0x0000000cU) 
                                   | (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                      >> 0x14U));
                        } else if (vlSelfRef.reset) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                        }
                    } else if (vlSelfRef.reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                    }
                } else if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        vlSelfRef.computer__DOT__cpu__DOT__branch = 1U;
                        vlSelfRef.computer__DOT__cpu__DOT__alu_src = 0U;
                        if ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))) {
                            vlSelfRef.computer__DOT__cpu__DOT__alu_op 
                                = ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                    ? ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                        ? 0x0fU : 0x0eU)
                                    : ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                        ? 0x0dU : 0x0cU));
                        } else if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                        } else {
                            vlSelfRef.computer__DOT__cpu__DOT__alu_op 
                                = ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                    ? 0x0bU : 0x0aU);
                        }
                        vlSelfRef.computer__DOT__cpu__DOT__imm 
                            = (((- (IData)((vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                            >> 0x1fU))) 
                                << 0x0000000cU) | (
                                                   (0x00000800U 
                                                    & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                       << 4U)) 
                                                   | ((0x000007e0U 
                                                       & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                          >> 0x00000014U)) 
                                                      | (0x0000001eU 
                                                         & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                            >> 7U)))));
                    } else if (vlSelfRef.reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                    }
                } else if (vlSelfRef.reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                }
            } else if (vlSelfRef.reset) {
                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
            }
        } else if ((0x00000020U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
            if ((0x00000010U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if ((8U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if (vlSelfRef.reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                    }
                } else if ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                            vlSelfRef.computer__DOT__cpu__DOT__reg_write = 1U;
                            vlSelfRef.computer__DOT__cpu__DOT__alu_op = 0x0aU;
                            vlSelfRef.computer__DOT__cpu__DOT__alu_src = 1U;
                            vlSelfRef.computer__DOT__cpu__DOT__imm 
                                = (0xfffff000U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg);
                        } else if (vlSelfRef.reset) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                        }
                    } else if (vlSelfRef.reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                    }
                } else if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        vlSelfRef.computer__DOT__cpu__DOT__reg_write = 1U;
                        vlSelfRef.computer__DOT__cpu__DOT__alu_src = 0U;
                        vlSelfRef.computer__DOT__cpu__DOT__alu_op 
                            = ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                ? ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                    ? ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                        ? 9U : 8U) : 
                                   ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                     ? ((0U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7))
                                         ? 6U : 7U)
                                     : 5U)) : ((2U 
                                                & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                                ? (
                                                   (1U 
                                                    & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                                    ? 4U
                                                    : 3U)
                                                : (
                                                   (1U 
                                                    & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                                    ? 2U
                                                    : 
                                                   ((0U 
                                                     == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7))
                                                     ? 0U
                                                     : 1U))));
                    } else if (vlSelfRef.reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                    }
                } else if (vlSelfRef.reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                }
            } else if ((8U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if (vlSelfRef.reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                }
            } else if ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if (vlSelfRef.reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                }
            } else if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    vlSelfRef.computer__DOT__cpu__DOT__alu_src = 1U;
                    vlSelfRef.computer__DOT__cpu__DOT__mem_write = 1U;
                    vlSelfRef.computer__DOT__cpu__DOT__alu_op = 0U;
                    vlSelfRef.computer__DOT__cpu__DOT__imm 
                        = (((- (IData)((vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                        >> 0x1fU))) 
                            << 0x0000000cU) | ((0x00000fe0U 
                                                & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                   >> 0x00000014U)) 
                                               | (0x0000001fU 
                                                  & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                     >> 7U))));
                    vlSelfRef.computer__DOT__cpu__DOT__lsu_wmask 
                        = ((0U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                            ? 1U : ((1U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                     ? 3U : 0x0fU));
                } else if (vlSelfRef.reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                }
            } else if (vlSelfRef.reset) {
                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
            }
        } else if ((0x00000010U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
            if ((8U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if (vlSelfRef.reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                }
            } else if ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        vlSelfRef.computer__DOT__cpu__DOT__reg_write = 1U;
                        vlSelfRef.computer__DOT__cpu__DOT__alu_op = 0U;
                        vlSelfRef.computer__DOT__cpu__DOT__auipc_flag = 1U;
                        vlSelfRef.computer__DOT__cpu__DOT__alu_src = 1U;
                        vlSelfRef.computer__DOT__cpu__DOT__imm 
                            = (0xfffff000U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg);
                    } else if (vlSelfRef.reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                    }
                } else if (vlSelfRef.reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                }
            } else if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    vlSelfRef.computer__DOT__cpu__DOT__imm 
                        = (((- (IData)((vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                        >> 0x1fU))) 
                            << 0x0000000cU) | (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                               >> 0x14U));
                    vlSelfRef.computer__DOT__cpu__DOT__reg_write = 1U;
                    vlSelfRef.computer__DOT__cpu__DOT__alu_src = 1U;
                    vlSelfRef.computer__DOT__cpu__DOT__alu_op 
                        = ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                            ? ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                ? ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                    ? 9U : 8U) : ((1U 
                                                   & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                                   ? 
                                                  ((0U 
                                                    == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7))
                                                    ? 6U
                                                    : 7U)
                                                   : 5U))
                            : ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                ? ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                    ? ((0U == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                        ? 0x0bU : 4U)
                                    : 3U) : ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                                              ? 2U : 0U)));
                } else if (vlSelfRef.reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
                }
            } else if (vlSelfRef.reset) {
                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
            }
        } else if ((8U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
            if (vlSelfRef.reset) {
                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
            }
        } else if ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
            if (vlSelfRef.reset) {
                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
            }
        } else if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
            if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                vlSelfRef.computer__DOT__cpu__DOT__alu_src = 1U;
                vlSelfRef.computer__DOT__cpu__DOT__mem_read = 1U;
                vlSelfRef.computer__DOT__cpu__DOT__alu_op = 0U;
                vlSelfRef.computer__DOT__cpu__DOT__imm 
                    = (((- (IData)((vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                    >> 0x1fU))) << 0x0000000cU) 
                       | (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                          >> 0x14U));
            } else if (vlSelfRef.reset) {
                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
            }
        } else if (vlSelfRef.reset) {
            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
        }
    }
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake 
        = ((IData)(vlSelfRef.computer__DOT__io_slave_awready) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_awvalid));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake 
        = ((IData)(vlSelfRef.computer__DOT__io_slave_wready) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_wvalid));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__ar_handshake 
        = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__io_clint_arready) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_arvalid));
    vlSelfRef.computer__DOT__sdram__DOT__ar_handshake 
        = ((IData)(vlSelfRef.computer__DOT__io_slave_arready) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_arvalid));
    vlSelfRef.__Vtableidx1 = (((((((IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_arvalid) 
                                   & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__is_clint_access)) 
                                  << 5U) | ((((~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__is_clint_access)) 
                                              & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_arvalid)) 
                                             << 4U) 
                                            | ((IData)(vlSelfRef.computer__DOT__cpu__DOT__io_ifu_arvalid) 
                                               << 3U))) 
                                | ((((IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_awvalid) 
                                     & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_wvalid)) 
                                    << 2U) | (((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake) 
                                               << 1U) 
                                              | (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake)))) 
                               << 5U) | (((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__clint_r_handshake) 
                                          << 4U) | 
                                         (((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state) 
                                           << 1U) | (IData)(vlSelfRef.reset))));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__next_state 
        = Vcomputer__ConstPool__TABLE_h79cc5618_0[vlSelfRef.__Vtableidx1];
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake 
        = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_rready) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__mem_to_reg 
        = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag));
    if (vlSelfRef.computer__DOT__cpu__DOT__ebreak_en) {
        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__ebreak_TOP();
    }
    if (vlSelfRef.computer__DOT__cpu__DOT__mem_read) {
        vlSelfRef.computer__DOT__io_slave_size = ((
                                                   (0U 
                                                    == (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3)) 
                                                   | (4U 
                                                      == (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3)))
                                                   ? 0U
                                                   : 
                                                  (((1U 
                                                     == (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3)) 
                                                    | (5U 
                                                       == (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3)))
                                                    ? 1U
                                                    : 2U));
    } else if (vlSelfRef.computer__DOT__cpu__DOT__mem_write) {
        vlSelfRef.computer__DOT__io_slave_size = ((1U 
                                                   == (IData)(vlSelfRef.computer__DOT__cpu__DOT__lsu_wmask))
                                                   ? 0U
                                                   : 
                                                  ((3U 
                                                    == (IData)(vlSelfRef.computer__DOT__cpu__DOT__lsu_wmask))
                                                    ? 1U
                                                    : 2U));
    }
    vlSelfRef.computer__DOT__cpu__DOT__load_data = 0U;
    if (((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid) 
         & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag))) {
        vlSelfRef.computer__DOT__cpu__DOT__load_data 
            = ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                ? ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                    ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata
                    : ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                        ? ((2U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                            ? (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                               >> 0x10U) : (0x0000ffffU 
                                            & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata))
                        : ((2U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                            ? ((1U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                                ? (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                   >> 0x18U) : (0x000000ffU 
                                                & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                                   >> 0x10U)))
                            : ((1U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                                ? (0x000000ffU & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                                  >> 8U))
                                : (0x000000ffU & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata)))))
                : ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                    ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata
                    : ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__funct3))
                        ? ((2U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                            ? (((- (IData)((vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                            >> 0x1fU))) 
                                << 0x00000010U) | (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                                   >> 0x10U))
                            : (((- (IData)((1U & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                                  >> 0x0fU)))) 
                                << 0x00000010U) | (0x0000ffffU 
                                                   & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata)))
                        : ((2U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                            ? ((1U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                                ? (((- (IData)((vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                                >> 0x1fU))) 
                                    << 8U) | (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                              >> 0x18U))
                                : (((- (IData)((1U 
                                                & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                                   >> 0x17U)))) 
                                    << 8U) | (0x000000ffU 
                                              & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                                 >> 0x10U))))
                            : ((1U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                                ? (((- (IData)((1U 
                                                & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                                   >> 0x0fU)))) 
                                    << 8U) | (0x000000ffU 
                                              & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                                 >> 8U)))
                                : (((- (IData)((1U 
                                                & (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata 
                                                   >> 7U)))) 
                                    << 8U) | (0x000000ffU 
                                              & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata)))))));
    }
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__ecall_taken 
        = ((~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ecall_en));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mret_taken 
        = ((~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__mret_en));
    if (vlSelfRef.reset) {
        vlSelfRef.computer__DOT__cpu__DOT__rs1_data = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__rs2_data = 0U;
    } else {
        vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
            = ((0U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__rs1_addr))
                ? 0U : vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers
               [vlSelfRef.computer__DOT__cpu__DOT__rs1_addr]);
        vlSelfRef.computer__DOT__cpu__DOT__rs2_data 
            = ((0U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__rs2_addr))
                ? 0U : vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers
               [vlSelfRef.computer__DOT__cpu__DOT__rs2_addr]);
    }
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_0 
        = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__jal_en) 
           | (IData)(vlSelfRef.computer__DOT__cpu__DOT__jalr_en));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_1 
        = (vlSelfRef.computer__DOT__cpu__DOT__imm + vlSelfRef.computer__DOT__cpu__DOT__pc);
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake 
        = ((IData)(vlSelfRef.computer__DOT__sdram__DOT__ar_handshake) 
           | (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__ar_handshake));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
        = (((IData)(vlSelfRef.computer__DOT__cpu__DOT__auipc_flag) 
            | (IData)(vlSelfRef.computer__DOT__cpu__DOT__jal_en))
            ? vlSelfRef.computer__DOT__cpu__DOT__pc
            : vlSelfRef.computer__DOT__cpu__DOT__rs1_data);
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b 
        = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_src)
            ? vlSelfRef.computer__DOT__cpu__DOT__imm
            : vlSelfRef.computer__DOT__cpu__DOT__rs2_data);
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__alu_result 
        = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)
            ? 0U : ((8U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                     ? ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                         ? ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                             ? 0U : ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                      ? 0U : ((0x00000300U 
                                               == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                               ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus
                                               : ((0x00000341U 
                                                   == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                                   ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc
                                                   : 
                                                  ((0x00000342U 
                                                    == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                                    ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause
                                                    : 
                                                   ((0x00000305U 
                                                     == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                                     ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec
                                                     : 
                                                    ((0x00000b00U 
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
                                                         : 0U))))))))))
                         : ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                             ? ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                 ? (0U == vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a)
                                 : vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)
                             : ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                 ? (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                                    & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)
                                 : (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                                    | vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b))))
                     : ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                         ? ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                             ? ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                 ? VL_SHIFTRS_III(32,32,5, vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a, 
                                                  (0x0000001fU 
                                                   & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b))
                                 : (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                                    >> (0x0000001fU 
                                        & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)))
                             : ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                 ? (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                                    ^ vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)
                                 : (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                                    < vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)))
                         : ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                             ? ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                 ? VL_LTS_III(32, vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a, vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)
                                 : (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                                    << (0x0000001fU 
                                        & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)))
                             : ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                 ? (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                                    - vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)
                                 : (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                                    + vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b))))));
    if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__mem_read)))) {
        if (vlSelfRef.computer__DOT__cpu__DOT__mem_write) {
            if ((1U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__lsu_wmask))) {
                if ((2U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__alu_result)) {
                    if ((1U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__alu_result)) {
                        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 8U;
                        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                            = (vlSelfRef.computer__DOT__cpu__DOT__rs2_data 
                               << 0x00000018U);
                    } else {
                        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 4U;
                        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                            = (0x00ff0000U & (vlSelfRef.computer__DOT__cpu__DOT__rs2_data 
                                              << 0x00000010U));
                    }
                } else if ((1U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__alu_result)) {
                    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 2U;
                    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                        = (0x0000ff00U & (vlSelfRef.computer__DOT__cpu__DOT__rs2_data 
                                          << 8U));
                } else {
                    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 1U;
                    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                        = (0x000000ffU & vlSelfRef.computer__DOT__cpu__DOT__rs2_data);
                }
            } else if ((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__lsu_wmask))) {
                if ((2U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__alu_result)) {
                    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 0x0cU;
                    if ((2U & vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__alu_result)) {
                        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                            = (vlSelfRef.computer__DOT__cpu__DOT__rs2_data 
                               << 0x00000010U);
                    }
                } else {
                    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 3U;
                    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                        = (0x0000ffffU & vlSelfRef.computer__DOT__cpu__DOT__rs2_data);
                }
            } else if ((0x0fU == (IData)(vlSelfRef.computer__DOT__cpu__DOT__lsu_wmask))) {
                vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 0x0fU;
                vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                    = vlSelfRef.computer__DOT__cpu__DOT__rs2_data;
            } else {
                vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 0U;
                vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg = 0U;
            }
        }
    }
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__rd_data 
        = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_0)
            ? ((IData)(4U) + vlSelfRef.computer__DOT__cpu__DOT__pc)
            : ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__mem_to_reg)
                ? vlSelfRef.computer__DOT__cpu__DOT__load_data
                : vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__alu_result));
}

VL_ATTR_COLD void Vcomputer___024root___eval_triggers__stl(Vcomputer___024root* vlSelf);

VL_ATTR_COLD bool Vcomputer___024root___eval_phase__stl(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_phase__stl\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vcomputer___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelfRef.__VstlTriggered.any();
    if (__VstlExecute) {
        Vcomputer___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__ico(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___dump_triggers__ico\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VicoTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VicoTriggered.word(0U))) {
        VL_DBG_MSGF("         'ico' region trigger index 0 is active: Internal 'ico' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__act(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___dump_triggers__act\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge clock)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__nba(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___dump_triggers__nba\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge clock)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vcomputer___024root____Vm_traceActivitySetAll(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vm_traceActivitySetAll\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vm_traceActivity[0U] = 1U;
    vlSelfRef.__Vm_traceActivity[1U] = 1U;
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
}

VL_ATTR_COLD void Vcomputer___024root___ctor_var_reset(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___ctor_var_reset\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->name());
    vlSelf->clock = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5452235342940299466ull);
    vlSelf->reset = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9928399931838511862ull);
    vlSelf->computer__DOT__io_slave_arready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3170146307613508975ull);
    vlSelf->computer__DOT__io_slave_rdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6439128779935909473ull);
    vlSelf->computer__DOT__io_slave_rresp = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 8167061920603346713ull);
    vlSelf->computer__DOT__io_slave_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1092261628868891414ull);
    vlSelf->computer__DOT__io_slave_size = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 5519889729567925883ull);
    vlSelf->computer__DOT__io_slave_awready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8846459253525157420ull);
    vlSelf->computer__DOT__io_slave_wready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4355914108995656706ull);
    vlSelf->computer__DOT__io_slave_bresp = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 17918310465290558985ull);
    vlSelf->computer__DOT__io_slave_bvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14587874864547656392ull);
    vlSelf->computer__DOT__cpu__DOT__pc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17219074457799563652ull);
    vlSelf->computer__DOT__cpu__DOT__inst_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5214560662488738361ull);
    vlSelf->computer__DOT__cpu__DOT__rs1_addr = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 376447365872044272ull);
    vlSelf->computer__DOT__cpu__DOT__rs2_addr = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 12015046346552296547ull);
    vlSelf->computer__DOT__cpu__DOT__rd_addr = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 11255698968025412919ull);
    vlSelf->computer__DOT__cpu__DOT__rs1_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15376567162162720298ull);
    vlSelf->computer__DOT__cpu__DOT__rs2_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6021710590679907066ull);
    vlSelf->computer__DOT__cpu__DOT__reg_write = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4774574171756308548ull);
    vlSelf->computer__DOT__cpu__DOT__imm = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12244751767503021272ull);
    vlSelf->computer__DOT__cpu__DOT__alu_op = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 15174934517299865825ull);
    vlSelf->computer__DOT__cpu__DOT__mem_read = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12340585633578062694ull);
    vlSelf->computer__DOT__cpu__DOT__mem_write = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4381794698322742427ull);
    vlSelf->computer__DOT__cpu__DOT__alu_src = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12920938848033071605ull);
    vlSelf->computer__DOT__cpu__DOT__branch = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8645111501247683593ull);
    vlSelf->computer__DOT__cpu__DOT__jal_en = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10310541716038884832ull);
    vlSelf->computer__DOT__cpu__DOT__jalr_en = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13413363335292667848ull);
    vlSelf->computer__DOT__cpu__DOT__ebreak_en = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8696056952233828949ull);
    vlSelf->computer__DOT__cpu__DOT__ecall_en = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12727827365924975655ull);
    vlSelf->computer__DOT__cpu__DOT__mret_en = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7516759958826905608ull);
    vlSelf->computer__DOT__cpu__DOT__auipc_flag = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3441961866458657058ull);
    vlSelf->computer__DOT__cpu__DOT__is_csr_op = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3128655047189270205ull);
    vlSelf->computer__DOT__cpu__DOT__lsu_wmask = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 12823413668334536629ull);
    vlSelf->computer__DOT__cpu__DOT__load_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17640463895850035962ull);
    vlSelf->computer__DOT__cpu__DOT__funct3 = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 16444543896598050208ull);
    vlSelf->computer__DOT__cpu__DOT__io_ifu_arvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1866531558656326724ull);
    vlSelf->computer__DOT__cpu__DOT__io_ifu_rready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17964230381441296781ull);
    vlSelf->computer__DOT__cpu__DOT__io_lsu_arvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11774920975237089459ull);
    vlSelf->computer__DOT__cpu__DOT__io_lsu_rready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17941486394313546611ull);
    vlSelf->computer__DOT__cpu__DOT__io_lsu_awvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15976400925927273217ull);
    vlSelf->computer__DOT__cpu__DOT__io_lsu_wvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9233601189409034232ull);
    vlSelf->computer__DOT__cpu__DOT__io_lsu_bready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11496015083906834475ull);
    vlSelf->computer__DOT__cpu__DOT__io_clint_arready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5587335827167350962ull);
    vlSelf->computer__DOT__cpu__DOT__io_clint_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4046242537308461236ull);
    vlSelf->computer__DOT__cpu__DOT__io_clint_rdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 11793995486011885142ull);
    vlSelf->computer__DOT__cpu__DOT__io_clint_rresp = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 8067859121551227315ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8945278634489565976ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12886808241448818564ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 4235364278819013018ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9572642448340893952ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7830915185663045091ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3452790188117018937ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15846732489888048553ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18381135771244018534ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15445763646525820059ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4582058858354086041ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2872629568240053417ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_arvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4024186315752629881ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_araddr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14108660037929926538ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_arvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10362318362675974195ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_awvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16455533698112521142ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_wvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9682564968117495268ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__is_clint_access = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7412820627617250912ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 2731555819007856363ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__next_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 10961873754562710650ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13323377050421435718ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14229500368923295591ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__clint_r_handshake = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1449813680289399463ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 3967649931503252226ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__ar_handshake = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18050170687222539592ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__ar_ready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15185057707888657489ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__read_req = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3839860602783109265ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__read_addr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 5404698692814797764ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode = VL_SCOPED_RAND_RESET_I(7, __VscopeHash, 12479909493703944402ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7 = VL_SCOPED_RAND_RESET_I(7, __VscopeHash, 10218770837042132948ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16039069200610481486ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__rd_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4708914406902771515ull);
    for (int __Vi0 = 0; __Vi0 < 32; ++__Vi0) {
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[__Vi0] = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10568161314741241049ull);
    }
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__i = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3685651534283466630ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__alu_result = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13330647068946377916ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__ecall_taken = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8474268051558671359ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mret_taken = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12233487349282940240ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4549536398095408473ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17473143859810509597ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 1759055740222364006ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9590644275953571504ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12050566858243650228ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4990683368283652798ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13793141193803727315ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12609478090597460057ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mvendorid = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15934482174054402004ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__marchid = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 11665845464552462752ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 377142604303106489ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_1 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3623117734918605653ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__mem_to_reg = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5948937225223130945ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2674082748722576555ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 562231207824576004ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6656410088720016900ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5297230929553734974ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 307694186342461245ull);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15054613422674726592ull);
    vlSelf->computer__DOT__sdram__DOT__ar_handshake = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11840385210949936089ull);
    vlSelf->__Vtableidx1 = 0;
    vlSelf->__Vtrigprevexpr___TOP__clock__0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13272892335938733197ull);
    for (int __Vi0 = 0; __Vi0 < 3; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
