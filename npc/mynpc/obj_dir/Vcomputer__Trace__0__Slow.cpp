// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_fst_c.h"
#include "Vcomputer__Syms.h"


VL_ATTR_COLD void Vcomputer___024root__trace_init_sub__TOP__0(Vcomputer___024root* vlSelf, VerilatedFst* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_init_sub__TOP__0\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->pushPrefix("$rootio", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+156,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+157,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->pushPrefix("computer", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+156,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+157,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+46,0,"io_slave_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+47,0,"io_slave_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+48,0,"io_slave_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+49,0,"io_slave_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+50,0,"io_slave_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+51,0,"io_slave_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+52,0,"io_slave_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1,0,"io_slave_size",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+53,0,"io_slave_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+54,0,"io_slave_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+55,0,"io_slave_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+2,0,"io_slave_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+56,0,"io_slave_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+57,0,"io_slave_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+58,0,"io_slave_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+59,0,"io_slave_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+60,0,"io_slave_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+61,0,"io_slave_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("cpu", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+156,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+157,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+49,0,"io_master_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+52,0,"io_master_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+50,0,"io_master_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+51,0,"io_master_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+47,0,"io_master_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+46,0,"io_master_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+48,0,"io_master_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1,0,"io_master_size",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+58,0,"io_master_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+59,0,"io_master_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+61,0,"io_master_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+60,0,"io_master_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+54,0,"io_master_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+53,0,"io_master_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+56,0,"io_master_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+55,0,"io_master_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+2,0,"io_master_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+57,0,"io_master_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+62,0,"pc",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+63,0,"inst_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+64,0,"inst_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+3,0,"idu_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+65,0,"lsu_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+4,0,"wbu_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+66,0,"snpc",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+5,0,"rs1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+6,0,"rs2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+7,0,"rd_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+8,0,"rs1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+9,0,"rs2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+10,0,"wb_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+11,0,"reg_write",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+12,0,"imm",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+13,0,"alu_op",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+14,0,"mem_read",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+15,0,"mem_write",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+16,0,"alu_src",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+67,0,"mem_to_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+17,0,"branch",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+18,0,"jal_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+19,0,"jalr_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+20,0,"ebreak_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+21,0,"ecall_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+22,0,"mret_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+23,0,"auipc_flag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+24,0,"is_csr_op",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+25,0,"lsu_wmask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+26,0,"alu_result",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+27,0,"branch_taken",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+28,0,"branch_target",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+29,0,"ecall_taken",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+30,0,"ecall_target",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+31,0,"mret_taken",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+32,0,"mret_target",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+33,0,"load_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+34,0,"funct3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+68,0,"io_ifu_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+62,0,"io_ifu_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+69,0,"io_ifu_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+50,0,"io_ifu_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+70,0,"io_ifu_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+51,0,"io_ifu_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+158,0,"io_ifu_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+159,0,"io_ifu_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+158,0,"io_ifu_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+160,0,"io_ifu_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+159,0,"io_ifu_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+159,0,"io_ifu_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+71,0,"io_lsu_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+72,0,"io_lsu_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+73,0,"io_lsu_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+74,0,"io_lsu_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+75,0,"io_lsu_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+76,0,"io_lsu_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+72,0,"io_lsu_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+77,0,"io_lsu_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+78,0,"io_lsu_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+35,0,"io_lsu_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+79,0,"io_lsu_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+80,0,"io_lsu_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+60,0,"io_lsu_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+81,0,"io_lsu_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+82,0,"io_clint_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+83,0,"io_clint_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+84,0,"io_clint_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+85,0,"io_clint_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+86,0,"io_clint_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+87,0,"io_clint_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+88,0,"io_clint_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+161,0,"io_clint_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+161,0,"io_clint_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+159,0,"io_clint_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+162,0,"io_clint_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+159,0,"io_clint_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+158,0,"io_clint_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+159,0,"io_clint_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+158,0,"io_clint_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+160,0,"io_clint_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+159,0,"io_clint_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("ysyx_25010003_Arbiter", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+156,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+157,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+68,0,"io_ifu_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+62,0,"io_ifu_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+69,0,"io_ifu_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+50,0,"io_ifu_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+70,0,"io_ifu_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+51,0,"io_ifu_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+158,0,"io_ifu_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+159,0,"io_ifu_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+158,0,"io_ifu_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+160,0,"io_ifu_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+159,0,"io_ifu_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+159,0,"io_ifu_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+71,0,"io_lsu_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+72,0,"io_lsu_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+73,0,"io_lsu_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+74,0,"io_lsu_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+75,0,"io_lsu_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+76,0,"io_lsu_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+77,0,"io_lsu_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+72,0,"io_lsu_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+79,0,"io_lsu_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+78,0,"io_lsu_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+35,0,"io_lsu_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+80,0,"io_lsu_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+60,0,"io_lsu_bresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+81,0,"io_lsu_bvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+82,0,"io_clint_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+83,0,"io_clint_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+84,0,"io_clint_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+85,0,"io_clint_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+86,0,"io_clint_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+87,0,"io_clint_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+88,0,"io_clint_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+161,0,"io_clint_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+161,0,"io_clint_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+159,0,"io_clint_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+162,0,"io_clint_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+159,0,"io_clint_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+158,0,"io_clint_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+159,0,"io_clint_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+158,0,"io_clint_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+160,0,"io_clint_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+159,0,"io_clint_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+49,0,"io_master_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+52,0,"io_master_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+50,0,"io_master_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+51,0,"io_master_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+47,0,"io_master_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+46,0,"io_master_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+48,0,"io_master_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+58,0,"io_master_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+59,0,"io_master_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+61,0,"io_master_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+60,0,"io_master_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+54,0,"io_master_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+53,0,"io_master_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+56,0,"io_master_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+55,0,"io_master_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+2,0,"io_master_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+57,0,"io_master_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+163,0,"IDLE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+164,0,"IFU_ACTIVE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+165,0,"LSU_READ",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+166,0,"LSU_WRITE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+167,0,"CLINT_READ",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+168,0,"CLINT_BASE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+169,0,"CLINT_END",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+89,0,"is_clint_access",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+90,0,"state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+36,0,"next_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+91,0,"ar_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+92,0,"r_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+93,0,"aw_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+94,0,"w_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+95,0,"b_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+96,0,"clint_ar_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+97,0,"clint_r_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+98,0,"lsu_write_req",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+99,0,"lsu_read_req",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+100,0,"clint_read_req",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->pushPrefix("ysyx_25010003_CLINT", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+156,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+157,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+87,0,"io_slave_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+86,0,"io_slave_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+88,0,"io_slave_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+82,0,"io_slave_arready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+84,0,"io_slave_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+85,0,"io_slave_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+83,0,"io_slave_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+158,0,"io_slave_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+159,0,"io_slave_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+158,0,"io_slave_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+160,0,"io_slave_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+159,0,"io_slave_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+159,0,"io_slave_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+161,0,"io_slave_awready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+161,0,"io_slave_wready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+162,0,"io_slave_bresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+159,0,"io_slave_bvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+101,0,"mtime",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+168,0,"CLINT_BASE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+169,0,"CLINT_END",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+103,0,"ar_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+97,0,"r_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+170,0,"ar_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+171,0,"read_req",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+172,0,"read_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->popPrefix();
    tracep->pushPrefix("ysyx_25010003_EXU", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+156,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+157,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+13,0,"alu_op",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+20,0,"ebreak_en",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+21,0,"ecall_en",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+22,0,"mret_en",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+3,0,"idu_ready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+8,0,"rs1_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+9,0,"rs2_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+12,0,"imm",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+16,0,"alu_src",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+24,0,"is_csr_op",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+62,0,"pc",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+17,0,"branch",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+18,0,"jal_en",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+19,0,"jalr_en",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+23,0,"auipc_flag",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+26,0,"alu_result",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+29,0,"ecall_taken",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+30,0,"ecall_target",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+31,0,"mret_taken",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+32,0,"mret_target",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+27,0,"branch_taken",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+28,0,"branch_target",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+37,0,"operand_a",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+38,0,"operand_b",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+39,0,"csr_read_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+104,0,"mstatus",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+105,0,"mepc",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+106,0,"mcause",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+107,0,"mtvec",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+108,0,"mcycle",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+109,0,"mcycleh",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+110,0,"mvendorid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+111,0,"marchid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+40,0,"branch_cond",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->pushPrefix("ysyx_25010003_IDU", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+63,0,"inst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+64,0,"inst_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+62,0,"pc",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+157,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+5,0,"rs1_addr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+6,0,"rs2_addr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+7,0,"rd_addr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+12,0,"imm",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+25,0,"lsu_wmask",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+13,0,"alu_op",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+14,0,"mem_read",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+15,0,"mem_write",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+11,0,"reg_write",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+16,0,"alu_src",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+17,0,"branch",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+18,0,"jal_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+19,0,"jalr_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+20,0,"ebreak_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+21,0,"ecall_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+22,0,"mret_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+34,0,"funct3",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+23,0,"auipc_flag",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+24,0,"is_csr_op",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+3,0,"idu_ready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+41,0,"opcode",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 6,0);
    tracep->declBus(c+42,0,"funct7",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 6,0);
    tracep->declBit(c+3,0,"idu_ready_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->pushPrefix("ysyx_25010003_IFU", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+156,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+157,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+14,0,"mem_read",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+15,0,"mem_write",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+86,0,"io_clint_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+82,0,"io_clint_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+47,0,"io_master_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+49,0,"io_master_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+54,0,"io_master_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+58,0,"io_master_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+56,0,"io_master_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+59,0,"io_master_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+31,0,"mret_taken",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+32,0,"mret_target",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+29,0,"ecall_taken",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+30,0,"ecall_target",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+27,0,"branch_taken",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+28,0,"branch_target",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+62,0,"pc",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+66,0,"snpc",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+63,0,"inst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+64,0,"inst_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+62,0,"io_ifu_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+68,0,"io_ifu_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+69,0,"io_ifu_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+50,0,"io_ifu_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+70,0,"io_ifu_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+51,0,"io_ifu_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+158,0,"io_ifu_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+159,0,"io_ifu_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+158,0,"io_ifu_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+160,0,"io_ifu_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+159,0,"io_ifu_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+159,0,"io_ifu_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+71,0,"io_lsu_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+75,0,"io_lsu_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+73,0,"io_lsu_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+77,0,"io_lsu_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+79,0,"io_lsu_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+80,0,"io_lsu_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+81,0,"io_lsu_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+163,0,"IDLE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+164,0,"FETCH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+165,0,"WAIT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+166,0,"EXECUTE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+167,0,"ACCESS",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+43,0,"dnpc",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+112,0,"dnpc_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+63,0,"inst_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+113,0,"next_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+113,0,"state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+114,0,"ar_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+115,0,"ifu_r_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+116,0,"lsu_r_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+117,0,"aw_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+118,0,"w_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+119,0,"lsu_b_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->pushPrefix("ysyx_25010003_LSU", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+156,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+157,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+74,0,"io_lsu_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+75,0,"io_lsu_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+14,0,"mem_read",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+15,0,"mem_write",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+34,0,"funct3",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+26,0,"addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+25,0,"lsu_wmask",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+9,0,"store_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+33,0,"load_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+67,0,"mem_to_reg",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+72,0,"io_lsu_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+72,0,"io_lsu_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+78,0,"io_lsu_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1,0,"io_lsu_size",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+35,0,"io_lsu_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+65,0,"lsu_ready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+72,0,"addr_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+78,0,"store_data_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+65,0,"lsu_ready_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+120,0,"load_flag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+35,0,"io_lsu_wstrb_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+44,0,"io_lsu_wdata_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->popPrefix();
    tracep->pushPrefix("ysyx_25010003_REG", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+156,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+157,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+67,0,"mem_to_reg",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+5,0,"rs1_addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+6,0,"rs2_addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+7,0,"rd_addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+10,0,"rd_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+11,0,"rd_wen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+8,0,"rs1_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+9,0,"rs2_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->pushPrefix("registers", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 32; ++i) {
        tracep->declBus(c+121+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 31,0);
    }
    tracep->popPrefix();
    tracep->declBus(c+153,0,"i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->popPrefix();
    tracep->pushPrefix("ysyx_25010003_WBU", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+65,0,"lsu_ready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+3,0,"idu_ready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+26,0,"alu_result",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+33,0,"load_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+66,0,"snpc",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+67,0,"mem_to_reg",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+18,0,"jal_en",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+19,0,"jalr_en",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+4,0,"wbu_ready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+10,0,"wb_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("sdram", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+156,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+157,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+46,0,"io_slave_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+47,0,"io_slave_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+48,0,"io_slave_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+49,0,"io_slave_arready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+50,0,"io_slave_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+51,0,"io_slave_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+52,0,"io_slave_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1,0,"io_slave_size",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+53,0,"io_slave_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+54,0,"io_slave_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+55,0,"io_slave_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+2,0,"io_slave_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+56,0,"io_slave_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+57,0,"io_slave_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+58,0,"io_slave_awready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+59,0,"io_slave_wready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+60,0,"io_slave_bresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+61,0,"io_slave_bvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+45,0,"len",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+154,0,"aligned_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+155,0,"ar_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+92,0,"r_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+117,0,"aw_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+118,0,"w_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+95,0,"b_handshake",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->popPrefix();
}

VL_ATTR_COLD void Vcomputer___024root__trace_init_top(Vcomputer___024root* vlSelf, VerilatedFst* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_init_top\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vcomputer___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void Vcomputer___024root__trace_const_0(void* voidSelf, VerilatedFst::Buffer* bufp);
VL_ATTR_COLD void Vcomputer___024root__trace_full_0(void* voidSelf, VerilatedFst::Buffer* bufp);
void Vcomputer___024root__trace_chg_0(void* voidSelf, VerilatedFst::Buffer* bufp);
void Vcomputer___024root__trace_cleanup(void* voidSelf, VerilatedFst* /*unused*/);

VL_ATTR_COLD void Vcomputer___024root__trace_register(Vcomputer___024root* vlSelf, VerilatedFst* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_register\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    tracep->addConstCb(&Vcomputer___024root__trace_const_0, 0U, vlSelf);
    tracep->addFullCb(&Vcomputer___024root__trace_full_0, 0U, vlSelf);
    tracep->addChgCb(&Vcomputer___024root__trace_chg_0, 0U, vlSelf);
    tracep->addCleanupCb(&Vcomputer___024root__trace_cleanup, vlSelf);
    }

    VL_ATTR_COLD void Vcomputer___024root__trace_const_0_sub_0(Vcomputer___024root* vlSelf, VerilatedFst::Buffer* bufp);

    VL_ATTR_COLD void Vcomputer___024root__trace_const_0(void* voidSelf, VerilatedFst::Buffer* bufp) {
        VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_const_0\n"); );
        // Init
        Vcomputer___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vcomputer___024root*>(voidSelf);

        Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;

        // Body
        Vcomputer___024root__trace_const_0_sub_0((&vlSymsp->TOP), bufp);
    }

    VL_ATTR_COLD void Vcomputer___024root__trace_const_0_sub_0(Vcomputer___024root* vlSelf, VerilatedFst::Buffer* bufp) {
        VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_const_0_sub_0\n"); );
        Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
        auto& vlSelfRef = std::ref(*vlSelf).get();
        // Init
        uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);

        // Body
        bufp->fullIData(oldp+158,(0U),32);
        bufp->fullBit(oldp+159,(0U));
        bufp->fullCData(oldp+160,(0U),4);
        bufp->fullBit(oldp+161,(1U));
        bufp->fullCData(oldp+162,(0U),2);
        bufp->fullCData(oldp+163,(0U),3);
        bufp->fullCData(oldp+164,(1U),3);
        bufp->fullCData(oldp+165,(2U),3);
        bufp->fullCData(oldp+166,(3U),3);
        bufp->fullCData(oldp+167,(4U),3);
        bufp->fullIData(oldp+168,(0xa0000048U),32);
        bufp->fullIData(oldp+169,(0xa000004cU),32);
        bufp->fullBit(oldp+170,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__ar_ready));
        bufp->fullBit(oldp+171,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__read_req));
        bufp->fullIData(oldp+172,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__read_addr),32);
    }

    VL_ATTR_COLD void Vcomputer___024root__trace_full_0_sub_0(Vcomputer___024root* vlSelf, VerilatedFst::Buffer* bufp);

    VL_ATTR_COLD void Vcomputer___024root__trace_full_0(void* voidSelf, VerilatedFst::Buffer* bufp) {
        VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_full_0\n"); );
        // Init
        Vcomputer___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vcomputer___024root*>(voidSelf);

        Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;

        // Body
        Vcomputer___024root__trace_full_0_sub_0((&vlSymsp->TOP), bufp);
    }

    VL_ATTR_COLD void Vcomputer___024root__trace_full_0_sub_0(Vcomputer___024root* vlSelf, VerilatedFst::Buffer* bufp) {
        VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_full_0_sub_0\n"); );
        Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
        auto& vlSelfRef = std::ref(*vlSelf).get();
        // Init
        uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);

        // Body
        bufp->fullCData(oldp+1,(vlSelfRef.computer__DOT__io_slave_size),2);
        bufp->fullCData(oldp+2,(((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                  ? (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg)
                                  : 0U)),4);
        bufp->fullBit(oldp+3,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg));
        bufp->fullBit(oldp+4,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg) 
                               & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg))));
        bufp->fullCData(oldp+5,(vlSelfRef.computer__DOT__cpu__DOT__rs1_addr),5);
        bufp->fullCData(oldp+6,(vlSelfRef.computer__DOT__cpu__DOT__rs2_addr),5);
        bufp->fullCData(oldp+7,(vlSelfRef.computer__DOT__cpu__DOT__rd_addr),5);
        bufp->fullIData(oldp+8,(vlSelfRef.computer__DOT__cpu__DOT__rs1_data),32);
        bufp->fullIData(oldp+9,(vlSelfRef.computer__DOT__cpu__DOT__rs2_data),32);
        bufp->fullIData(oldp+10,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__rd_data),32);
        bufp->fullBit(oldp+11,(vlSelfRef.computer__DOT__cpu__DOT__reg_write));
        bufp->fullIData(oldp+12,(vlSelfRef.computer__DOT__cpu__DOT__imm),32);
        bufp->fullCData(oldp+13,(vlSelfRef.computer__DOT__cpu__DOT__alu_op),4);
        bufp->fullBit(oldp+14,(vlSelfRef.computer__DOT__cpu__DOT__mem_read));
        bufp->fullBit(oldp+15,(vlSelfRef.computer__DOT__cpu__DOT__mem_write));
        bufp->fullBit(oldp+16,(vlSelfRef.computer__DOT__cpu__DOT__alu_src));
        bufp->fullBit(oldp+17,(vlSelfRef.computer__DOT__cpu__DOT__branch));
        bufp->fullBit(oldp+18,(vlSelfRef.computer__DOT__cpu__DOT__jal_en));
        bufp->fullBit(oldp+19,(vlSelfRef.computer__DOT__cpu__DOT__jalr_en));
        bufp->fullBit(oldp+20,(vlSelfRef.computer__DOT__cpu__DOT__ebreak_en));
        bufp->fullBit(oldp+21,(vlSelfRef.computer__DOT__cpu__DOT__ecall_en));
        bufp->fullBit(oldp+22,(vlSelfRef.computer__DOT__cpu__DOT__mret_en));
        bufp->fullBit(oldp+23,(vlSelfRef.computer__DOT__cpu__DOT__auipc_flag));
        bufp->fullBit(oldp+24,(vlSelfRef.computer__DOT__cpu__DOT__is_csr_op));
        bufp->fullCData(oldp+25,(vlSelfRef.computer__DOT__cpu__DOT__lsu_wmask),4);
        bufp->fullIData(oldp+26,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__alu_result),32);
        bufp->fullBit(oldp+27,(((~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)) 
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
        bufp->fullIData(oldp+28,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)
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
        bufp->fullBit(oldp+29,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__ecall_taken));
        bufp->fullIData(oldp+30,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__ecall_taken)
                                   ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec
                                   : 0U)),32);
        bufp->fullBit(oldp+31,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mret_taken));
        bufp->fullIData(oldp+32,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mret_taken)
                                   ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc
                                   : 0U)),32);
        bufp->fullIData(oldp+33,(vlSelfRef.computer__DOT__cpu__DOT__load_data),32);
        bufp->fullCData(oldp+34,(vlSelfRef.computer__DOT__cpu__DOT__funct3),3);
        bufp->fullCData(oldp+35,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg),4);
        bufp->fullCData(oldp+36,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__next_state),3);
        bufp->fullIData(oldp+37,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a),32);
        bufp->fullIData(oldp+38,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b),32);
        bufp->fullIData(oldp+39,(((0x00000300U == vlSelfRef.computer__DOT__cpu__DOT__imm)
                                   ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus
                                   : ((0x00000341U 
                                       == vlSelfRef.computer__DOT__cpu__DOT__imm)
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
        bufp->fullBit(oldp+40,((((IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op) 
                                 >> 3U) & ((4U & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                            ? ((2U 
                                                & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                ? (
                                                   (1U 
                                                    & (IData)(vlSelfRef.computer__DOT__cpu__DOT__alu_op))
                                                    ? 
                                                   (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                    >= vlSelfRef.computer__DOT__cpu__DOT__rs2_data)
                                                    : 
                                                   (vlSelfRef.computer__DOT__cpu__DOT__rs1_data 
                                                    < vlSelfRef.computer__DOT__cpu__DOT__rs2_data))
                                                : (
                                                   (1U 
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
        bufp->fullCData(oldp+41,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode),7);
        bufp->fullCData(oldp+42,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7),7);
        bufp->fullIData(oldp+43,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mret_taken)
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
                                               ? 0U
                                               : ((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_0)
                                                   ? 
                                                  (((0U 
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
        bufp->fullIData(oldp+44,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg),32);
        bufp->fullIData(oldp+45,(((0U == (IData)(vlSelfRef.computer__DOT__io_slave_size))
                                   ? 1U : ((1U == (IData)(vlSelfRef.computer__DOT__io_slave_size))
                                            ? 2U : 
                                           ((2U == (IData)(vlSelfRef.computer__DOT__io_slave_size))
                                             ? 4U : 0U)))),32);
        bufp->fullIData(oldp+46,(((1U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                   ? vlSelfRef.computer__DOT__cpu__DOT__pc
                                   : vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)),32);
        bufp->fullBit(oldp+47,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_arvalid));
        bufp->fullBit(oldp+48,(((1U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                 ? (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_ifu_rready)
                                 : ((2U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                                    & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_rready)))));
        bufp->fullBit(oldp+49,(vlSelfRef.computer__DOT__io_slave_arready));
        bufp->fullIData(oldp+50,(vlSelfRef.computer__DOT__io_slave_rdata),32);
        bufp->fullCData(oldp+51,(vlSelfRef.computer__DOT__io_slave_rresp),2);
        bufp->fullBit(oldp+52,(vlSelfRef.computer__DOT__io_slave_rvalid));
        bufp->fullIData(oldp+53,(((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                   ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg
                                   : 0U)),32);
        bufp->fullBit(oldp+54,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_awvalid));
        bufp->fullIData(oldp+55,(((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                   ? vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg
                                   : 0U)),32);
        bufp->fullBit(oldp+56,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_wvalid));
        bufp->fullBit(oldp+57,(((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                                && (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_bready))));
        bufp->fullBit(oldp+58,(vlSelfRef.computer__DOT__io_slave_awready));
        bufp->fullBit(oldp+59,(vlSelfRef.computer__DOT__io_slave_wready));
        bufp->fullCData(oldp+60,(vlSelfRef.computer__DOT__io_slave_bresp),2);
        bufp->fullBit(oldp+61,(vlSelfRef.computer__DOT__io_slave_bvalid));
        bufp->fullIData(oldp+62,(vlSelfRef.computer__DOT__cpu__DOT__pc),32);
        bufp->fullIData(oldp+63,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg),32);
        bufp->fullBit(oldp+64,(vlSelfRef.computer__DOT__cpu__DOT__inst_valid));
        bufp->fullBit(oldp+65,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg));
        bufp->fullIData(oldp+66,(((IData)(4U) + vlSelfRef.computer__DOT__cpu__DOT__pc)),32);
        bufp->fullBit(oldp+67,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__mem_to_reg));
        bufp->fullBit(oldp+68,(vlSelfRef.computer__DOT__cpu__DOT__io_ifu_arvalid));
        bufp->fullBit(oldp+69,(vlSelfRef.computer__DOT__cpu__DOT__io_ifu_rready));
        bufp->fullBit(oldp+70,(((1U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                                & (IData)(vlSelfRef.computer__DOT__io_slave_rvalid))));
        bufp->fullBit(oldp+71,(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_arvalid));
        bufp->fullIData(oldp+72,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg),32);
        bufp->fullBit(oldp+73,(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_rready));
        bufp->fullIData(oldp+74,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata),32);
        bufp->fullBit(oldp+75,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid));
        bufp->fullCData(oldp+76,(((2U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                   ? (IData)(vlSelfRef.computer__DOT__io_slave_rresp)
                                   : ((4U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                       ? (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_clint_rresp)
                                       : 0U))),2);
        bufp->fullBit(oldp+77,(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_awvalid));
        bufp->fullIData(oldp+78,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg),32);
        bufp->fullBit(oldp+79,(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_wvalid));
        bufp->fullBit(oldp+80,(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_bready));
        bufp->fullBit(oldp+81,(((3U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                                & (IData)(vlSelfRef.computer__DOT__io_slave_bvalid))));
        bufp->fullBit(oldp+82,(vlSelfRef.computer__DOT__cpu__DOT__io_clint_arready));
        bufp->fullBit(oldp+83,(vlSelfRef.computer__DOT__cpu__DOT__io_clint_rvalid));
        bufp->fullIData(oldp+84,(vlSelfRef.computer__DOT__cpu__DOT__io_clint_rdata),32);
        bufp->fullCData(oldp+85,(vlSelfRef.computer__DOT__cpu__DOT__io_clint_rresp),2);
        bufp->fullBit(oldp+86,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_arvalid));
        bufp->fullIData(oldp+87,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_araddr),32);
        bufp->fullBit(oldp+88,(((4U == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                                & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_rready))));
        bufp->fullBit(oldp+89,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__is_clint_access));
        bufp->fullCData(oldp+90,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state),3);
        bufp->fullBit(oldp+91,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_arvalid) 
                                & (IData)(vlSelfRef.computer__DOT__io_slave_arready))));
        bufp->fullBit(oldp+92,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake));
        bufp->fullBit(oldp+93,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_awvalid) 
                                & (IData)(vlSelfRef.computer__DOT__io_slave_awready))));
        bufp->fullBit(oldp+94,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_wvalid) 
                                & (IData)(vlSelfRef.computer__DOT__io_slave_wready))));
        bufp->fullBit(oldp+95,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake));
        bufp->fullBit(oldp+96,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_arvalid) 
                                & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_clint_arready))));
        bufp->fullBit(oldp+97,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__clint_r_handshake));
        bufp->fullBit(oldp+98,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_awvalid) 
                                & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_wvalid))));
        bufp->fullBit(oldp+99,(((~ (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__is_clint_access)) 
                                & (IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_arvalid))));
        bufp->fullBit(oldp+100,(((IData)(vlSelfRef.computer__DOT__cpu__DOT__io_lsu_arvalid) 
                                 & (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__is_clint_access))));
        bufp->fullQData(oldp+101,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime),64);
        bufp->fullBit(oldp+103,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__ar_handshake));
        bufp->fullIData(oldp+104,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus),32);
        bufp->fullIData(oldp+105,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc),32);
        bufp->fullIData(oldp+106,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause),32);
        bufp->fullIData(oldp+107,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec),32);
        bufp->fullIData(oldp+108,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle),32);
        bufp->fullIData(oldp+109,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh),32);
        bufp->fullIData(oldp+110,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mvendorid),32);
        bufp->fullIData(oldp+111,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__marchid),32);
        bufp->fullIData(oldp+112,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg),32);
        bufp->fullCData(oldp+113,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state),3);
        bufp->fullBit(oldp+114,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake));
        bufp->fullBit(oldp+115,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake));
        bufp->fullBit(oldp+116,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake));
        bufp->fullBit(oldp+117,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake));
        bufp->fullBit(oldp+118,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake));
        bufp->fullBit(oldp+119,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake));
        bufp->fullBit(oldp+120,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag));
        bufp->fullIData(oldp+121,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0]),32);
        bufp->fullIData(oldp+122,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[1]),32);
        bufp->fullIData(oldp+123,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[2]),32);
        bufp->fullIData(oldp+124,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[3]),32);
        bufp->fullIData(oldp+125,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[4]),32);
        bufp->fullIData(oldp+126,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[5]),32);
        bufp->fullIData(oldp+127,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[6]),32);
        bufp->fullIData(oldp+128,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[7]),32);
        bufp->fullIData(oldp+129,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[8]),32);
        bufp->fullIData(oldp+130,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[9]),32);
        bufp->fullIData(oldp+131,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[10]),32);
        bufp->fullIData(oldp+132,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[11]),32);
        bufp->fullIData(oldp+133,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[12]),32);
        bufp->fullIData(oldp+134,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[13]),32);
        bufp->fullIData(oldp+135,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[14]),32);
        bufp->fullIData(oldp+136,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[15]),32);
        bufp->fullIData(oldp+137,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[16]),32);
        bufp->fullIData(oldp+138,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[17]),32);
        bufp->fullIData(oldp+139,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[18]),32);
        bufp->fullIData(oldp+140,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[19]),32);
        bufp->fullIData(oldp+141,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[20]),32);
        bufp->fullIData(oldp+142,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[21]),32);
        bufp->fullIData(oldp+143,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[22]),32);
        bufp->fullIData(oldp+144,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[23]),32);
        bufp->fullIData(oldp+145,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[24]),32);
        bufp->fullIData(oldp+146,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[25]),32);
        bufp->fullIData(oldp+147,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[26]),32);
        bufp->fullIData(oldp+148,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[27]),32);
        bufp->fullIData(oldp+149,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[28]),32);
        bufp->fullIData(oldp+150,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[29]),32);
        bufp->fullIData(oldp+151,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[30]),32);
        bufp->fullIData(oldp+152,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[31]),32);
        bufp->fullIData(oldp+153,(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__i),32);
        bufp->fullIData(oldp+154,((0xfffffffcU & ((1U 
                                                   == (IData)(vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                                   ? vlSelfRef.computer__DOT__cpu__DOT__pc
                                                   : vlSelfRef.computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg))),32);
        bufp->fullBit(oldp+155,(vlSelfRef.computer__DOT__sdram__DOT__ar_handshake));
        bufp->fullBit(oldp+156,(vlSelfRef.clock));
        bufp->fullBit(oldp+157,(vlSelfRef.reset));
    }
