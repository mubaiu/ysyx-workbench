// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcomputer.h for the primary calling header

#include "Vcomputer__pch.h"
#include "Vcomputer___024root.h"

void Vcomputer___024root___ico_sequent__TOP__0(Vcomputer___024root* vlSelf);

void Vcomputer___024root___eval_ico(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_ico\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VicoTriggered.word(0U))) {
        Vcomputer___024root___ico_sequent__TOP__0(vlSelf);
        vlSelfRef.__Vm_traceActivity[1U] = 1U;
    }
}

extern const VlUnpacked<CData/*2:0*/, 2048> Vcomputer__ConstPool__TABLE_h79cc5618_0;
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(IData/*31:0*/ thispc);
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__ebreak_TOP();

void Vcomputer___024root___ico_sequent__TOP__0(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___ico_sequent__TOP__0\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
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

void Vcomputer___024root___eval_triggers__ico(Vcomputer___024root* vlSelf);

bool Vcomputer___024root___eval_phase__ico(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_phase__ico\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VicoExecute;
    // Body
    Vcomputer___024root___eval_triggers__ico(vlSelf);
    __VicoExecute = vlSelfRef.__VicoTriggered.any();
    if (__VicoExecute) {
        Vcomputer___024root___eval_ico(vlSelf);
    }
    return (__VicoExecute);
}

void Vcomputer___024root___eval_act(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_act\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void Vcomputer___024root___nba_sequent__TOP__0(Vcomputer___024root* vlSelf);

void Vcomputer___024root___eval_nba(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_nba\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vcomputer___024root___nba_sequent__TOP__0(vlSelf);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
    }
}

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__set_callfunc_TOP();
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__set_retfunc_TOP();
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_snpc_TOP(IData/*31:0*/ pc);
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_dnpc_TOP(IData/*31:0*/ pc);
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_pc_TOP(IData/*31:0*/ pc);
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__set_reg_value_TOP(IData/*31:0*/ idx, IData/*31:0*/ val);
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__vaddr_write_TOP(IData/*31:0*/ addr, IData/*31:0*/ len, IData/*31:0*/ data);
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__vaddr_read_TOP(IData/*31:0*/ addr, IData/*31:0*/ len, IData/*31:0*/ &vaddr_read__Vfuncrtn);

void Vcomputer___024root___nba_sequent__TOP__0(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___nba_sequent__TOP__0\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __Vfunc_computer__DOT__sdram__DOT__vaddr_read__40__Vfuncout;
    __Vfunc_computer__DOT__sdram__DOT__vaddr_read__40__Vfuncout = 0;
    CData/*2:0*/ __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state;
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state = 0;
    IData/*31:0*/ __Vdly__computer__DOT__cpu__DOT__pc;
    __Vdly__computer__DOT__cpu__DOT__pc = 0;
    QData/*63:0*/ __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime;
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime = 0;
    IData/*31:0*/ __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle;
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle = 0;
    IData/*31:0*/ __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh;
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh = 0;
    CData/*0:0*/ __VdlySet__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v0;
    __VdlySet__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v0 = 0;
    IData/*31:0*/ __VdlyVal__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16;
    __VdlyVal__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 = 0;
    CData/*4:0*/ __VdlyDim0__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16;
    __VdlyDim0__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 = 0;
    CData/*0:0*/ __VdlySet__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16;
    __VdlySet__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 = 0;
    // Body
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime 
        = vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime;
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle 
        = vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle;
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh 
        = vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh;
    if (vlSelfRef.computer__DOT__cpu__DOT__jal_en) {
        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__set_callfunc_TOP();
    }
    if (vlSelfRef.computer__DOT__cpu__DOT__jalr_en) {
        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__set_retfunc_TOP();
    }
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state 
        = vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state;
    __VdlySet__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v0 = 0U;
    __VdlySet__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 = 0U;
    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_snpc_TOP(
                                                                                ((IData)(4U) 
                                                                                + vlSelfRef.computer__DOT__cpu__DOT__pc));
    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_dnpc_TOP(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg);
    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_pc_TOP(vlSelfRef.computer__DOT__cpu__DOT__pc);
    __Vdly__computer__DOT__cpu__DOT__pc = vlSelfRef.computer__DOT__cpu__DOT__pc;
    if (vlSelfRef.reset) {
        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime = 0ULL;
        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle = 0U;
        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh = 0U;
        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state = 1U;
    } else {
        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime 
            = (1ULL + vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime);
        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh 
            = (IData)(((1ULL + (((QData)((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh)) 
                                 << 0x00000020U) | (QData)((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle)))) 
                       >> 0x00000020U));
        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle 
            = ((IData)(1U) + vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle);
        if ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
            if ((1U & (~ ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state) 
                          >> 1U)))) {
                if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state)))) {
                    if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake) {
                        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state = 2U;
                    } else if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake) {
                        if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake) {
                            __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state = 2U;
                        }
                    } else {
                        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state = 4U;
                    }
                }
            }
        } else {
            __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state 
                = ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))
                    ? ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))
                        ? ((IData)(vlSelfRef.computer__DOT__cpu__DOT__mem_read)
                            ? 4U : ((IData)(vlSelfRef.computer__DOT__cpu__DOT__mem_write)
                                     ? 4U : 0U)) : 
                       ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake)
                         ? 3U : ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake)
                                  ? 0U : ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake)
                                           ? 0U : 2U))))
                    : ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))
                        ? ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake)
                            ? 2U : 1U) : 1U));
        }
    }
    if (vlSelfRef.reset) {
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__i = 0x00000010U;
        __VdlySet__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v0 = 1U;
    } else if ((((IData)(vlSelfRef.computer__DOT__cpu__DOT__reg_write) 
                 | (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__mem_to_reg)) 
                & (0U != (IData)(vlSelfRef.computer__DOT__cpu__DOT__rd_addr)))) {
        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__set_reg_value_TOP(vlSelfRef.computer__DOT__cpu__DOT__rd_addr, vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__rd_data);
        __VdlyVal__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 
            = vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__rd_data;
        __VdlyDim0__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 
            = vlSelfRef.computer__DOT__cpu__DOT__rd_addr;
        __VdlySet__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 = 1U;
    }
    if ((1U & (~ (IData)(vlSelfRef.reset)))) {
        if ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
            if ((1U & (~ ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state) 
                          >> 1U)))) {
                if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state)))) {
                    if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake)))) {
                        if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake) {
                            if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake) {
                                vlSelfRef.computer__DOT__cpu__DOT__io_lsu_bready = 1U;
                                vlSelfRef.computer__DOT__cpu__DOT__io_lsu_wvalid = 0U;
                            }
                            vlSelfRef.computer__DOT__cpu__DOT__io_lsu_awvalid = 0U;
                        }
                    }
                    if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake) {
                        vlSelfRef.computer__DOT__cpu__DOT__io_lsu_rready = 1U;
                        vlSelfRef.computer__DOT__cpu__DOT__io_lsu_arvalid = 0U;
                    }
                }
            }
        } else if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
            if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state)))) {
                if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake)))) {
                    if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake)))) {
                        if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake) {
                            vlSelfRef.computer__DOT__cpu__DOT__io_lsu_bready = 0U;
                        }
                    }
                    if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake) {
                        vlSelfRef.computer__DOT__cpu__DOT__io_lsu_rready = 0U;
                    }
                }
            }
            if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
                if (vlSelfRef.computer__DOT__cpu__DOT__mem_read) {
                    vlSelfRef.computer__DOT__cpu__DOT__io_lsu_arvalid = 1U;
                }
                if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__mem_read)))) {
                    if (vlSelfRef.computer__DOT__cpu__DOT__mem_write) {
                        vlSelfRef.computer__DOT__cpu__DOT__io_lsu_awvalid = 1U;
                        vlSelfRef.computer__DOT__cpu__DOT__io_lsu_wvalid = 1U;
                    }
                }
            }
        }
    }
    if (vlSelfRef.computer__DOT__cpu__DOT__mem_read) {
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag = 1U;
    } else if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__mem_write)))) {
        if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid) {
            vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag = 0U;
        }
    }
    if (vlSelfRef.reset) {
        __Vdly__computer__DOT__cpu__DOT__pc = 0x80000000U;
        vlSelfRef.computer__DOT__cpu__DOT__io_clint_rresp = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__io_clint_arready = 1U;
        vlSelfRef.computer__DOT__cpu__DOT__io_clint_rdata = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__marchid = 0x017d9f53U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mvendorid = 0x79737978U;
        vlSelfRef.computer__DOT__cpu__DOT__io_ifu_arvalid = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__io_ifu_rready = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__io_clint_rvalid = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__inst_valid = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg = 1U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus = 0x00001800U;
    } else {
        if ((1U & (~ ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state) 
                      >> 2U)))) {
            if ((1U & (~ ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state) 
                          >> 1U)))) {
                if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state)))) {
                    __Vdly__computer__DOT__cpu__DOT__pc 
                        = vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg;
                }
                if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
                    vlSelfRef.computer__DOT__cpu__DOT__io_ifu_arvalid = 1U;
                    if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake) {
                        vlSelfRef.computer__DOT__cpu__DOT__io_ifu_arvalid = 0U;
                    }
                }
            }
            if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
                if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state)))) {
                    if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake) {
                        vlSelfRef.computer__DOT__cpu__DOT__io_ifu_rready = 0U;
                    }
                }
                if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
                    vlSelfRef.computer__DOT__cpu__DOT__inst_valid = 1U;
                    vlSelfRef.computer__DOT__cpu__DOT__inst_valid = 0U;
                } else {
                    vlSelfRef.computer__DOT__cpu__DOT__inst_valid = 0U;
                    if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake) {
                        vlSelfRef.computer__DOT__cpu__DOT__inst_valid = 1U;
                    }
                }
            } else {
                if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
                    if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake) {
                        vlSelfRef.computer__DOT__cpu__DOT__io_ifu_rready = 1U;
                    }
                }
                vlSelfRef.computer__DOT__cpu__DOT__inst_valid = 0U;
            }
        }
        if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__ar_handshake) {
            vlSelfRef.computer__DOT__cpu__DOT__io_clint_arready = 0U;
            vlSelfRef.computer__DOT__cpu__DOT__io_clint_rdata 
                = ((0xa0000048U == vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_araddr)
                    ? (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime)
                    : ((0xa000004cU == vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_araddr)
                        ? (IData)((vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime 
                                   >> 0x20U)) : 0U));
            vlSelfRef.computer__DOT__cpu__DOT__io_clint_rvalid = 1U;
        } else if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__clint_r_handshake) {
            vlSelfRef.computer__DOT__cpu__DOT__io_clint_arready = 1U;
            vlSelfRef.computer__DOT__cpu__DOT__io_clint_rvalid = 0U;
        }
        if (((IData)(vlSelfRef.computer__DOT__cpu__DOT__mem_read) 
             | (IData)(vlSelfRef.computer__DOT__cpu__DOT__mem_write))) {
            vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg = 0U;
        } else if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid) {
            vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg = 1U;
        }
        if (vlSelfRef.computer__DOT__cpu__DOT__ecall_en) {
            vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause = 0x0000000bU;
        } else if (vlSelfRef.computer__DOT__cpu__DOT__is_csr_op) {
            if ((0x00000300U != vlSelfRef.computer__DOT__cpu__DOT__imm)) {
                if ((0x00000341U != vlSelfRef.computer__DOT__cpu__DOT__imm)) {
                    if ((0x00000342U == vlSelfRef.computer__DOT__cpu__DOT__imm)) {
                        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause 
                            = vlSelfRef.computer__DOT__cpu__DOT__rs1_data;
                    }
                }
            }
        }
        if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ecall_en)))) {
            if (vlSelfRef.computer__DOT__cpu__DOT__is_csr_op) {
                if ((0x00000300U == vlSelfRef.computer__DOT__cpu__DOT__imm)) {
                    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus 
                        = vlSelfRef.computer__DOT__cpu__DOT__rs1_data;
                }
            }
        }
    }
    if (vlSelfRef.reset) {
        vlSelfRef.computer__DOT__io_slave_awready = 1U;
        vlSelfRef.computer__DOT__io_slave_wready = 1U;
        vlSelfRef.computer__DOT__io_slave_bresp = 0U;
        vlSelfRef.computer__DOT__io_slave_bvalid = 0U;
    } else if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake) {
        vlSelfRef.computer__DOT__io_slave_awready = 0U;
        if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake) {
            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__vaddr_write_TOP(
                                                                                ((3U 
                                                                                == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                                                                 ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg
                                                                                 : 0U), 
                                                                                ((0U 
                                                                                == (IData)(vlSelfRef.computer__DOT__io_slave_size))
                                                                                 ? 1U
                                                                                 : 
                                                                                ((1U 
                                                                                == (IData)(vlSelfRef.computer__DOT__io_slave_size))
                                                                                 ? 2U
                                                                                 : 
                                                                                ((2U 
                                                                                == (IData)(vlSelfRef.computer__DOT__io_slave_size))
                                                                                 ? 4U
                                                                                 : 0U))), 
                                                                                ((3U 
                                                                                == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                                                                 ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg
                                                                                 : 0U));
            vlSelfRef.computer__DOT__io_slave_wready = 0U;
            vlSelfRef.computer__DOT__io_slave_bvalid = 1U;
        }
    } else if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake) {
        vlSelfRef.computer__DOT__io_slave_bvalid = 0U;
        vlSelfRef.computer__DOT__io_slave_wready = 1U;
        vlSelfRef.computer__DOT__io_slave_awready = 1U;
    }
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle 
        = __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle;
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh 
        = __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh;
    if (__VdlySet__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v0) {
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0U] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[1U] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[2U] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[3U] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[4U] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[5U] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[6U] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[7U] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[8U] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[9U] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0x0aU] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0x0bU] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0x0cU] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0x0dU] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0x0eU] = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0x0fU] = 0U;
    }
    if (__VdlySet__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16) {
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[__VdlyDim0__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16] 
            = __VdlyVal__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16;
    }
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime 
        = __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime;
    if (vlSelfRef.reset) {
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg = 0x80000004U;
    } else if ((1U & (~ ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state) 
                         >> 2U)))) {
        if ((2U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
            if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state)))) {
                if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake) {
                    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                        = vlSelfRef.computer__DOT__io_slave_rdata;
                }
            }
            if ((1U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
                vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg 
                    = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mret_taken)
                        ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc
                        : ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__ecall_taken)
                            ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec
                            : (((~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)) 
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
                                   | (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_0)))
                                ? ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)
                                    ? 0U : ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_0)
                                             ? (((0U 
                                                  == (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op)) 
                                                 & ((IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_src) 
                                                    & (IData)(vlSelfRef.computer__DOT__cpu__DOT__jal_en)))
                                                 ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_1
                                                 : 
                                                (0xfffffffeU 
                                                 & (vlSelfRef.computer__DOT__cpu__DOT__imm 
                                                    + vlSelfRef.computer__DOT__cpu__DOT__rs1_data)))
                                             : vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_1))
                                : ((IData)(4U) + vlSelfRef.computer__DOT__cpu__DOT__pc))));
            }
        }
    }
    if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__mem_read)))) {
        if (vlSelfRef.computer__DOT__cpu__DOT__mem_write) {
            vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg 
                = vlSelfRef.computer__DOT__cpu__DOT__rs2_data;
        }
    }
    if (vlSelfRef.reset) {
        vlSelfRef.computer__DOT__io_slave_arready = 1U;
        vlSelfRef.computer__DOT__io_slave_rdata = 0U;
        vlSelfRef.computer__DOT__io_slave_rresp = 0U;
        vlSelfRef.computer__DOT__io_slave_rvalid = 0U;
    } else if (vlSelfRef.computer__DOT__sdram__DOT__ar_handshake) {
        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__vaddr_read_TOP(
                                                                                (0xfffffffcU 
                                                                                & ((1U 
                                                                                == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                                                                 ? vlSelfRef.computer__DOT__cpu__DOT__pc
                                                                                 : vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)), 4U, __Vfunc_computer__DOT__sdram__DOT__vaddr_read__40__Vfuncout);
        vlSelfRef.computer__DOT__io_slave_rvalid = 1U;
        vlSelfRef.computer__DOT__io_slave_arready = 0U;
        vlSelfRef.computer__DOT__io_slave_rdata = __Vfunc_computer__DOT__sdram__DOT__vaddr_read__40__Vfuncout;
    } else if (vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake) {
        vlSelfRef.computer__DOT__io_slave_rvalid = 0U;
        vlSelfRef.computer__DOT__io_slave_arready = 1U;
    }
    if ((1U & (~ (IData)(vlSelfRef.reset)))) {
        if (((IData)(vlSelfRef.computer__DOT__cpu__DOT__mem_read) 
             | (IData)(vlSelfRef.computer__DOT__cpu__DOT__mem_write))) {
            vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg 
                = vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__alu_result;
        }
    }
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state 
        = __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state;
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state 
        = vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__next_state;
    if (vlSelfRef.reset) {
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec = 0x80000004U;
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc = 0U;
    } else {
        if ((1U & (~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ecall_en)))) {
            if (vlSelfRef.computer__DOT__cpu__DOT__is_csr_op) {
                if ((0x00000300U != vlSelfRef.computer__DOT__cpu__DOT__imm)) {
                    if ((0x00000341U != vlSelfRef.computer__DOT__cpu__DOT__imm)) {
                        if ((0x00000342U != vlSelfRef.computer__DOT__cpu__DOT__imm)) {
                            if ((0x00000305U == vlSelfRef.computer__DOT__cpu__DOT__imm)) {
                                vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec 
                                    = vlSelfRef.computer__DOT__cpu__DOT__rs1_data;
                            }
                        }
                    }
                }
            }
        }
        if (vlSelfRef.computer__DOT__cpu__DOT__ecall_en) {
            vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc 
                = vlSelfRef.computer__DOT__cpu__DOT__pc;
        } else if (vlSelfRef.computer__DOT__cpu__DOT__is_csr_op) {
            if ((0x00000300U != vlSelfRef.computer__DOT__cpu__DOT__imm)) {
                if ((0x00000341U == vlSelfRef.computer__DOT__cpu__DOT__imm)) {
                    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc 
                        = vlSelfRef.computer__DOT__cpu__DOT__rs1_data;
                }
            }
        }
    }
    vlSelfRef.computer__DOT__cpu__DOT__pc = __Vdly__computer__DOT__cpu__DOT__pc;
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
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_araddr 
        = ((4U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
            ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg
            : 0U);
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__is_clint_access 
        = ((0xa0000048U <= vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg) 
           & (0xa000004cU >= vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg));
    if (vlSelfRef.computer__DOT__cpu__DOT__ebreak_en) {
        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__ebreak_TOP();
    }
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
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__ecall_taken 
        = ((~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ecall_en));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mret_taken 
        = ((~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__mret_en));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_0 
        = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__jal_en) 
           | (IData)(vlSelfRef.computer__DOT__cpu__DOT__jalr_en));
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_1 
        = (vlSelfRef.computer__DOT__cpu__DOT__imm + vlSelfRef.computer__DOT__cpu__DOT__pc);
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
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake 
        = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_rready) 
           & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid));
    if (((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid) 
         & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag))) {
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__mem_to_reg = 1U;
        vlSelfRef.computer__DOT__cpu__DOT__load_data = 0U;
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
    } else {
        vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__mem_to_reg = 0U;
        vlSelfRef.computer__DOT__cpu__DOT__load_data = 0U;
    }
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
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
        = (((IData)(vlSelfRef.computer__DOT__cpu__DOT__auipc_flag) 
            | (IData)(vlSelfRef.computer__DOT__cpu__DOT__jal_en))
            ? vlSelfRef.computer__DOT__cpu__DOT__pc
            : vlSelfRef.computer__DOT__cpu__DOT__rs1_data);
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b 
        = ((IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_src)
            ? vlSelfRef.computer__DOT__cpu__DOT__imm
            : vlSelfRef.computer__DOT__cpu__DOT__rs2_data);
    vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake 
        = ((IData)(vlSelfRef.computer__DOT__sdram__DOT__ar_handshake) 
           | (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__ar_handshake));
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

void Vcomputer___024root___eval_triggers__act(Vcomputer___024root* vlSelf);

bool Vcomputer___024root___eval_phase__act(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_phase__act\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<1> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vcomputer___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vcomputer___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vcomputer___024root___eval_phase__nba(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_phase__nba\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vcomputer___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__ico(Vcomputer___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__nba(Vcomputer___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__act(Vcomputer___024root* vlSelf);
#endif  // VL_DEBUG

void Vcomputer___024root___eval(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VicoIterCount;
    CData/*0:0*/ __VicoContinue;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VicoIterCount = 0U;
    vlSelfRef.__VicoFirstIteration = 1U;
    __VicoContinue = 1U;
    while (__VicoContinue) {
        if (VL_UNLIKELY(((0x00000064U < __VicoIterCount)))) {
#ifdef VL_DEBUG
            Vcomputer___024root___dump_triggers__ico(vlSelf);
#endif
            VL_FATAL_MT("vsrc/computer.v", 1, "", "Input combinational region did not converge.");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        __VicoContinue = 0U;
        if (Vcomputer___024root___eval_phase__ico(vlSelf)) {
            __VicoContinue = 1U;
        }
        vlSelfRef.__VicoFirstIteration = 0U;
    }
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY(((0x00000064U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vcomputer___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("vsrc/computer.v", 1, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY(((0x00000064U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vcomputer___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("vsrc/computer.v", 1, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vcomputer___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vcomputer___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vcomputer___024root___eval_debug_assertions(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_debug_assertions\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY(((vlSelfRef.clock & 0xfeU)))) {
        Verilated::overWidthError("clock");
    }
    if (VL_UNLIKELY(((vlSelfRef.reset & 0xfeU)))) {
        Verilated::overWidthError("reset");
    }
}
#endif  // VL_DEBUG
