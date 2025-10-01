// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_fst_c.h"
#include "Vcomputer__Syms.h"


VL_ATTR_COLD void Vcomputer___024root__trace_init_sub__TOP__0(Vcomputer___024root* vlSelf, VerilatedFst* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+138,"clock",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+139,"reset",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->pushNamePrefix("computer ");
    tracep->declBit(c+138,"clock",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+139,"reset",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+46,"io_slave_araddr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+47,"io_slave_arvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+48,"io_slave_rready",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+49,"io_slave_arready",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+50,"io_slave_rdata",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+51,"io_slave_rresp",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBit(c+52,"io_slave_rvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+1,"io_slave_size",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBus(c+53,"io_slave_awaddr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+54,"io_slave_awvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+55,"io_slave_wdata",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+2,"io_slave_wstrb",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+56,"io_slave_wvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+57,"io_slave_bready",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+58,"io_slave_awready",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+59,"io_slave_wready",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+60,"io_slave_bresp",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBit(c+61,"io_slave_bvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->pushNamePrefix("cpu ");
    tracep->declBit(c+138,"clock",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+139,"reset",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+49,"io_master_arready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+52,"io_master_rvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+50,"io_master_rdata",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+51,"io_master_rresp",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBit(c+47,"io_master_arvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+46,"io_master_araddr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+48,"io_master_rready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+1,"io_master_size",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBit(c+58,"io_master_awready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+59,"io_master_wready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+61,"io_master_bvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+60,"io_master_bresp",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBit(c+54,"io_master_awvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+53,"io_master_awaddr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+56,"io_master_wvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+55,"io_master_wdata",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+2,"io_master_wstrb",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+57,"io_master_bready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+62,"pc",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+63,"inst_out",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+64,"inst_valid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+3,"idu_ready",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+65,"lsu_ready",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+4,"wbu_ready",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+66,"snpc",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+5,"rs1_addr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+6,"rs2_addr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+7,"rd_addr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+8,"rs1_data",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+9,"rs2_data",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+10,"wb_data",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+11,"reg_write",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+12,"imm",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+13,"alu_op",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+14,"mem_read",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+15,"mem_write",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+16,"alu_src",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+67,"mem_to_reg",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+17,"branch",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+18,"jal_en",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+19,"jalr_en",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+20,"ebreak_en",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+21,"ecall_en",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+22,"mret_en",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+23,"auipc_flag",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+24,"is_csr_op",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+25,"lsu_wmask",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBus(c+26,"alu_result",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+27,"branch_taken",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+28,"branch_target",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+29,"ecall_taken",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+30,"ecall_target",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+31,"mret_taken",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+32,"mret_target",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+33,"load_data",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+34,"funct3",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 2,0);
    tracep->declBit(c+68,"io_ifu_arvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+62,"io_ifu_araddr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+69,"io_ifu_rready",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+50,"io_ifu_rdata",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+70,"io_ifu_rvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+51,"io_ifu_rresp",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBus(c+140,"io_ifu_awaddr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+141,"io_ifu_awvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+140,"io_ifu_wdata",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+142,"io_ifu_wstrb",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+141,"io_ifu_wvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+141,"io_ifu_bready",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+71,"io_lsu_arvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+72,"io_lsu_araddr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+73,"io_lsu_rready",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+50,"io_lsu_rdata",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+74,"io_lsu_rvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+51,"io_lsu_rresp",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBus(c+72,"io_lsu_awaddr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+75,"io_lsu_awvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+76,"io_lsu_wdata",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+35,"io_lsu_wstrb",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+77,"io_lsu_wvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+78,"io_lsu_bready",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+60,"io_lsu_bresp",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBit(c+79,"io_lsu_bvalid",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->pushNamePrefix("ysyx_25010003_Arbiter ");
    tracep->declBit(c+138,"clock",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+139,"reset",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+68,"io_ifu_arvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+62,"io_ifu_araddr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+69,"io_ifu_rready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+50,"io_ifu_rdata",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+70,"io_ifu_rvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+51,"io_ifu_rresp",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBus(c+140,"io_ifu_awaddr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+141,"io_ifu_awvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+140,"io_ifu_wdata",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+142,"io_ifu_wstrb",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+141,"io_ifu_wvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+141,"io_ifu_bready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+71,"io_lsu_arvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+72,"io_lsu_araddr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+73,"io_lsu_rready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+50,"io_lsu_rdata",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+74,"io_lsu_rvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+51,"io_lsu_rresp",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBit(c+75,"io_lsu_awvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+72,"io_lsu_awaddr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+77,"io_lsu_wvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+76,"io_lsu_wdata",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+35,"io_lsu_wstrb",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+78,"io_lsu_bready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+60,"io_lsu_bresp",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBit(c+79,"io_lsu_bvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+49,"io_master_arready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+52,"io_master_rvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+50,"io_master_rdata",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+51,"io_master_rresp",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBit(c+47,"io_master_arvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+46,"io_master_araddr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+48,"io_master_rready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+58,"io_master_awready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+59,"io_master_wready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+61,"io_master_bvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+60,"io_master_bresp",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBit(c+54,"io_master_awvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+53,"io_master_awaddr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+56,"io_master_wvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+55,"io_master_wdata",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+2,"io_master_wstrb",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+57,"io_master_bready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+143,"IDLE",-1, FST_VD_IMPLICIT,FST_VT_VCD_PARAMETER, false,-1, 1,0);
    tracep->declBus(c+144,"IFU_ACTIVE",-1, FST_VD_IMPLICIT,FST_VT_VCD_PARAMETER, false,-1, 1,0);
    tracep->declBus(c+145,"LSU_READ",-1, FST_VD_IMPLICIT,FST_VT_VCD_PARAMETER, false,-1, 1,0);
    tracep->declBus(c+146,"LSU_WRITE",-1, FST_VD_IMPLICIT,FST_VT_VCD_PARAMETER, false,-1, 1,0);
    tracep->declBus(c+80,"state",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 1,0);
    tracep->declBus(c+36,"next_state",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 1,0);
    tracep->declBit(c+81,"ar_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+82,"r_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+83,"aw_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+84,"w_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+85,"b_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+86,"lsu_write_req",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("ysyx_25010003_EXU ");
    tracep->declBit(c+138,"clock",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+139,"reset",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+13,"alu_op",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+20,"ebreak_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+21,"ecall_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+22,"mret_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+3,"idu_ready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+8,"rs1_data",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+9,"rs2_data",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+12,"imm",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+16,"alu_src",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+24,"is_csr_op",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+62,"pc",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+17,"branch",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+18,"jal_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+19,"jalr_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+23,"auipc_flag",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+26,"alu_result",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+29,"ecall_taken",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+30,"ecall_target",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+31,"mret_taken",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+32,"mret_target",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+27,"branch_taken",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+28,"branch_target",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+37,"operand_a",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+38,"operand_b",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+39,"csr_read_data",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+87,"mstatus",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+88,"mepc",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+89,"mcause",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+90,"mtvec",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+91,"mcycle",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+92,"mcycleh",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+93,"mvendorid",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+94,"marchid",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBit(c+40,"branch_cond",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("ysyx_25010003_IDU ");
    tracep->declBus(c+63,"inst",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+64,"inst_valid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+62,"pc",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+139,"reset",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+5,"rs1_addr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+6,"rs2_addr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+7,"rd_addr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+12,"imm",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+25,"lsu_wmask",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBus(c+13,"alu_op",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+14,"mem_read",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+15,"mem_write",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+11,"reg_write",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+16,"alu_src",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+17,"branch",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+18,"jal_en",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+19,"jalr_en",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+20,"ebreak_en",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+21,"ecall_en",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+22,"mret_en",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+34,"funct3",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 2,0);
    tracep->declBit(c+23,"auipc_flag",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+24,"is_csr_op",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+3,"idu_ready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+41,"opcode",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 6,0);
    tracep->declBus(c+42,"funct7",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 6,0);
    tracep->declBit(c+3,"idu_ready_reg",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("ysyx_25010003_IFU ");
    tracep->declBit(c+138,"clock",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+139,"reset",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+14,"mem_read",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+15,"mem_write",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+47,"io_master_arvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+49,"io_master_arready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+54,"io_master_awvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+58,"io_master_awready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+56,"io_master_wvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+59,"io_master_wready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+31,"mret_taken",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+32,"mret_target",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+29,"ecall_taken",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+30,"ecall_target",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+27,"branch_taken",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+28,"branch_target",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+62,"pc",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+66,"snpc",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+63,"inst",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+64,"inst_valid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+62,"io_ifu_araddr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+68,"io_ifu_arvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+69,"io_ifu_rready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+50,"io_ifu_rdata",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+70,"io_ifu_rvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+51,"io_ifu_rresp",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBus(c+140,"io_ifu_awaddr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+141,"io_ifu_awvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+140,"io_ifu_wdata",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+142,"io_ifu_wstrb",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+141,"io_ifu_wvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+141,"io_ifu_bready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+71,"io_lsu_arvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+74,"io_lsu_rvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+73,"io_lsu_rready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+75,"io_lsu_awvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+77,"io_lsu_wvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+78,"io_lsu_bready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+79,"io_lsu_bvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+147,"IDLE",-1, FST_VD_IMPLICIT,FST_VT_VCD_PARAMETER, false,-1, 2,0);
    tracep->declBus(c+148,"FETCH",-1, FST_VD_IMPLICIT,FST_VT_VCD_PARAMETER, false,-1, 2,0);
    tracep->declBus(c+149,"WAIT",-1, FST_VD_IMPLICIT,FST_VT_VCD_PARAMETER, false,-1, 2,0);
    tracep->declBus(c+150,"EXECUTE",-1, FST_VD_IMPLICIT,FST_VT_VCD_PARAMETER, false,-1, 2,0);
    tracep->declBus(c+151,"ACCESS",-1, FST_VD_IMPLICIT,FST_VT_VCD_PARAMETER, false,-1, 2,0);
    tracep->declBus(c+43,"dnpc",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+95,"dnpc_reg",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+63,"inst_reg",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+96,"next_state",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 2,0);
    tracep->declBus(c+96,"state",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 2,0);
    tracep->declBit(c+97,"ar_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+98,"ifu_r_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+99,"lsu_r_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+100,"aw_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+101,"w_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+102,"lsu_b_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("ysyx_25010003_LSU ");
    tracep->declBit(c+138,"clock",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+139,"reset",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+50,"io_lsu_rdata",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+74,"io_lsu_rvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+14,"mem_read",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+15,"mem_write",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+34,"funct3",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 2,0);
    tracep->declBus(c+26,"addr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+25,"lsu_wmask",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBus(c+9,"store_data",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+33,"load_data",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+67,"mem_to_reg",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+72,"io_lsu_araddr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+72,"io_lsu_awaddr",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+76,"io_lsu_wdata",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+1,"io_lsu_size",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBus(c+35,"io_lsu_wstrb",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+65,"lsu_ready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+72,"addr_reg",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBus(c+76,"store_data_reg",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->declBit(c+65,"lsu_ready_reg",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1);
    tracep->declBit(c+103,"load_flag",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1);
    tracep->declBus(c+35,"io_lsu_wstrb_reg",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 3,0);
    tracep->declBus(c+44,"io_lsu_wdata_reg",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("ysyx_25010003_REG ");
    tracep->declBit(c+138,"clock",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+139,"reset",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+67,"mem_to_reg",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+5,"rs1_addr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+6,"rs2_addr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+7,"rd_addr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 4,0);
    tracep->declBus(c+10,"rd_data",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+11,"rd_wen",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+8,"rs1_data",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+9,"rs2_data",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    for (int i = 0; i < 32; ++i) {
        tracep->declBus(c+104+i*1,"registers",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, true,(i+0), 31,0);
    }
    tracep->declBus(c+136,"i",-1, FST_VD_IMPLICIT,FST_VT_VCD_INTEGER, false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("ysyx_25010003_WBU ");
    tracep->declBit(c+65,"lsu_ready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+3,"idu_ready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+26,"alu_result",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+33,"load_data",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+66,"snpc",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+67,"mem_to_reg",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+18,"jal_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+19,"jalr_en",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+4,"wbu_ready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+10,"wb_data",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->popNamePrefix(2);
    tracep->pushNamePrefix("sdram ");
    tracep->declBit(c+138,"clock",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+139,"reset",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+46,"io_slave_araddr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+47,"io_slave_arvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+48,"io_slave_rready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+49,"io_slave_arready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+50,"io_slave_rdata",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+51,"io_slave_rresp",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBit(c+52,"io_slave_rvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+1,"io_slave_size",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBus(c+53,"io_slave_awaddr",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+54,"io_slave_awvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+55,"io_slave_wdata",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+2,"io_slave_wstrb",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1, 3,0);
    tracep->declBit(c+56,"io_slave_wvalid",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+57,"io_slave_bready",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+58,"io_slave_awready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+59,"io_slave_wready",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+60,"io_slave_bresp",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 1,0);
    tracep->declBit(c+61,"io_slave_bvalid",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+45,"len",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBus(c+137,"aligned_addr",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1, 31,0);
    tracep->declBit(c+97,"ar_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+82,"r_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+100,"aw_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+101,"w_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+85,"b_handshake",-1, FST_VD_IMPLICIT,FST_VT_VCD_WIRE, false,-1);
    tracep->popNamePrefix(2);
}

VL_ATTR_COLD void Vcomputer___024root__trace_init_top(Vcomputer___024root* vlSelf, VerilatedFst* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_init_top\n"); );
    // Body
    Vcomputer___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void Vcomputer___024root__trace_full_top_0(void* voidSelf, VerilatedFst::Buffer* bufp);
void Vcomputer___024root__trace_chg_top_0(void* voidSelf, VerilatedFst::Buffer* bufp);
void Vcomputer___024root__trace_cleanup(void* voidSelf, VerilatedFst* /*unused*/);

VL_ATTR_COLD void Vcomputer___024root__trace_register(Vcomputer___024root* vlSelf, VerilatedFst* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_register\n"); );
    // Body
    tracep->addFullCb(&Vcomputer___024root__trace_full_top_0, vlSelf);
    tracep->addChgCb(&Vcomputer___024root__trace_chg_top_0, vlSelf);
    tracep->addCleanupCb(&Vcomputer___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void Vcomputer___024root__trace_full_sub_0(Vcomputer___024root* vlSelf, VerilatedFst::Buffer* bufp);

VL_ATTR_COLD void Vcomputer___024root__trace_full_top_0(void* voidSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_full_top_0\n"); );
    // Init
    Vcomputer___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vcomputer___024root*>(voidSelf);
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    Vcomputer___024root__trace_full_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vcomputer___024root__trace_full_sub_0(Vcomputer___024root* vlSelf, VerilatedFst::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root__trace_full_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullCData(oldp+1,(vlSelf->computer__DOT__io_slave_size),2);
    bufp->fullCData(oldp+2,(((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                              ? (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg)
                              : 0U)),4);
    bufp->fullBit(oldp+3,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg));
    bufp->fullBit(oldp+4,(((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg) 
                           & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg))));
    bufp->fullCData(oldp+5,(vlSelf->computer__DOT__cpu__DOT__rs1_addr),5);
    bufp->fullCData(oldp+6,(vlSelf->computer__DOT__cpu__DOT__rs2_addr),5);
    bufp->fullCData(oldp+7,(vlSelf->computer__DOT__cpu__DOT__rd_addr),5);
    bufp->fullIData(oldp+8,(vlSelf->computer__DOT__cpu__DOT__rs1_data),32);
    bufp->fullIData(oldp+9,(vlSelf->computer__DOT__cpu__DOT__rs2_data),32);
    bufp->fullIData(oldp+10,(vlSelf->computer__DOT__cpu__DOT__wb_data),32);
    bufp->fullBit(oldp+11,(vlSelf->computer__DOT__cpu__DOT__reg_write));
    bufp->fullIData(oldp+12,(vlSelf->computer__DOT__cpu__DOT__imm),32);
    bufp->fullCData(oldp+13,(vlSelf->computer__DOT__cpu__DOT__alu_op),4);
    bufp->fullBit(oldp+14,(vlSelf->computer__DOT__cpu__DOT__mem_read));
    bufp->fullBit(oldp+15,(vlSelf->computer__DOT__cpu__DOT__mem_write));
    bufp->fullBit(oldp+16,(vlSelf->computer__DOT__cpu__DOT__alu_src));
    bufp->fullBit(oldp+17,(vlSelf->computer__DOT__cpu__DOT__branch));
    bufp->fullBit(oldp+18,(vlSelf->computer__DOT__cpu__DOT__jal_en));
    bufp->fullBit(oldp+19,(vlSelf->computer__DOT__cpu__DOT__jalr_en));
    bufp->fullBit(oldp+20,(vlSelf->computer__DOT__cpu__DOT__ebreak_en));
    bufp->fullBit(oldp+21,(vlSelf->computer__DOT__cpu__DOT__ecall_en));
    bufp->fullBit(oldp+22,(vlSelf->computer__DOT__cpu__DOT__mret_en));
    bufp->fullBit(oldp+23,(vlSelf->computer__DOT__cpu__DOT__auipc_flag));
    bufp->fullBit(oldp+24,(vlSelf->computer__DOT__cpu__DOT__is_csr_op));
    bufp->fullCData(oldp+25,(vlSelf->computer__DOT__cpu__DOT__lsu_wmask),4);
    bufp->fullIData(oldp+26,(vlSelf->computer__DOT__cpu__DOT__alu_result),32);
    bufp->fullBit(oldp+27,(((~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)) 
                            & (((IData)(vlSelf->computer__DOT__cpu__DOT__branch) 
                                & (((IData)(vlSelf->computer__DOT__cpu__DOT__alu_op) 
                                    >> 3U) & ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                               ? ((2U 
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
                                               : (((IData)(vlSelf->computer__DOT__cpu__DOT__alu_op) 
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
    bufp->fullIData(oldp+28,(((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)
                               ? 0U : ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h826bb330__0)
                                        ? (((0U == (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op)) 
                                            & ((IData)(vlSelf->computer__DOT__cpu__DOT__alu_src) 
                                               & (IData)(vlSelf->computer__DOT__cpu__DOT__jal_en)))
                                            ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h8a6dd3c2__0
                                            : (0xfffffffeU 
                                               & (vlSelf->computer__DOT__cpu__DOT__imm 
                                                  + vlSelf->computer__DOT__cpu__DOT__rs1_data)))
                                        : vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h8a6dd3c2__0))),32);
    bufp->fullBit(oldp+29,(vlSelf->computer__DOT__cpu__DOT__ecall_taken));
    bufp->fullIData(oldp+30,(vlSelf->computer__DOT__cpu__DOT__ecall_target),32);
    bufp->fullBit(oldp+31,(vlSelf->computer__DOT__cpu__DOT__mret_taken));
    bufp->fullIData(oldp+32,(vlSelf->computer__DOT__cpu__DOT__mret_target),32);
    bufp->fullIData(oldp+33,(vlSelf->computer__DOT__cpu__DOT__load_data),32);
    bufp->fullCData(oldp+34,(vlSelf->computer__DOT__cpu__DOT__funct3),3);
    bufp->fullCData(oldp+35,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg),4);
    bufp->fullCData(oldp+36,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__next_state),2);
    bufp->fullIData(oldp+37,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a),32);
    bufp->fullIData(oldp+38,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b),32);
    bufp->fullIData(oldp+39,(((0x300U == vlSelf->computer__DOT__cpu__DOT__imm)
                               ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus
                               : ((0x341U == vlSelf->computer__DOT__cpu__DOT__imm)
                                   ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc
                                   : ((0x342U == vlSelf->computer__DOT__cpu__DOT__imm)
                                       ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause
                                       : ((0x305U == vlSelf->computer__DOT__cpu__DOT__imm)
                                           ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec
                                           : ((0xb00U 
                                               == vlSelf->computer__DOT__cpu__DOT__imm)
                                               ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle
                                               : ((0xb80U 
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
    bufp->fullBit(oldp+40,((((IData)(vlSelf->computer__DOT__cpu__DOT__alu_op) 
                             >> 3U) & ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                        ? ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                            ? ((1U 
                                                & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                ? (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                   >= vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                : (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                   < vlSelf->computer__DOT__cpu__DOT__rs2_data))
                                            : ((1U 
                                                & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                ? VL_GTES_III(32, vlSelf->computer__DOT__cpu__DOT__rs1_data, vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                : VL_LTS_III(32, vlSelf->computer__DOT__cpu__DOT__rs1_data, vlSelf->computer__DOT__cpu__DOT__rs2_data)))
                                        : (((IData)(vlSelf->computer__DOT__cpu__DOT__alu_op) 
                                            >> 1U) 
                                           & ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                               ? (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                  != vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                               : (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                  == vlSelf->computer__DOT__cpu__DOT__rs2_data)))))));
    bufp->fullCData(oldp+41,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode),7);
    bufp->fullCData(oldp+42,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7),7);
    bufp->fullIData(oldp+43,(((IData)(vlSelf->computer__DOT__cpu__DOT__mret_taken)
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
                                           ? 0U : ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h826bb330__0)
                                                    ? 
                                                   (((0U 
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
    bufp->fullIData(oldp+44,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg),32);
    bufp->fullIData(oldp+45,(((0U == (IData)(vlSelf->computer__DOT__io_slave_size))
                               ? 1U : ((1U == (IData)(vlSelf->computer__DOT__io_slave_size))
                                        ? 2U : ((2U 
                                                 == (IData)(vlSelf->computer__DOT__io_slave_size))
                                                 ? 4U
                                                 : 0U)))),32);
    bufp->fullIData(oldp+46,(((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                               ? vlSelf->computer__DOT__cpu__DOT__pc
                               : vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)),32);
    bufp->fullBit(oldp+47,(vlSelf->computer__DOT__io_slave_arvalid));
    bufp->fullBit(oldp+48,(((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                             ? (IData)(vlSelf->computer__DOT__cpu__DOT__io_ifu_rready)
                             : ((2U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                                & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_rready)))));
    bufp->fullBit(oldp+49,(vlSelf->computer__DOT__io_slave_arready));
    bufp->fullIData(oldp+50,(vlSelf->computer__DOT__io_slave_rdata),32);
    bufp->fullCData(oldp+51,(vlSelf->computer__DOT__io_slave_rresp),2);
    bufp->fullBit(oldp+52,(vlSelf->computer__DOT__io_slave_rvalid));
    bufp->fullIData(oldp+53,(((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                               ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg
                               : 0U)),32);
    bufp->fullBit(oldp+54,(vlSelf->computer__DOT__io_slave_awvalid));
    bufp->fullIData(oldp+55,(((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                               ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg
                               : 0U)),32);
    bufp->fullBit(oldp+56,(vlSelf->computer__DOT__io_slave_wvalid));
    bufp->fullBit(oldp+57,(((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                            & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_bready))));
    bufp->fullBit(oldp+58,(vlSelf->computer__DOT__io_slave_awready));
    bufp->fullBit(oldp+59,(vlSelf->computer__DOT__io_slave_wready));
    bufp->fullCData(oldp+60,(vlSelf->computer__DOT__io_slave_bresp),2);
    bufp->fullBit(oldp+61,(vlSelf->computer__DOT__io_slave_bvalid));
    bufp->fullIData(oldp+62,(vlSelf->computer__DOT__cpu__DOT__pc),32);
    bufp->fullIData(oldp+63,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg),32);
    bufp->fullBit(oldp+64,(vlSelf->computer__DOT__cpu__DOT__inst_valid));
    bufp->fullBit(oldp+65,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg));
    bufp->fullIData(oldp+66,(((IData)(4U) + vlSelf->computer__DOT__cpu__DOT__pc)),32);
    bufp->fullBit(oldp+67,(vlSelf->computer__DOT__cpu__DOT__mem_to_reg));
    bufp->fullBit(oldp+68,(vlSelf->computer__DOT__cpu__DOT__io_ifu_arvalid));
    bufp->fullBit(oldp+69,(vlSelf->computer__DOT__cpu__DOT__io_ifu_rready));
    bufp->fullBit(oldp+70,(((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                            & (IData)(vlSelf->computer__DOT__io_slave_rvalid))));
    bufp->fullBit(oldp+71,(vlSelf->computer__DOT__cpu__DOT__io_lsu_arvalid));
    bufp->fullIData(oldp+72,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg),32);
    bufp->fullBit(oldp+73,(vlSelf->computer__DOT__cpu__DOT__io_lsu_rready));
    bufp->fullBit(oldp+74,(vlSelf->computer__DOT__cpu__DOT__io_lsu_rvalid));
    bufp->fullBit(oldp+75,(vlSelf->computer__DOT__cpu__DOT__io_lsu_awvalid));
    bufp->fullIData(oldp+76,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg),32);
    bufp->fullBit(oldp+77,(vlSelf->computer__DOT__cpu__DOT__io_lsu_wvalid));
    bufp->fullBit(oldp+78,(vlSelf->computer__DOT__cpu__DOT__io_lsu_bready));
    bufp->fullBit(oldp+79,(((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                            & (IData)(vlSelf->computer__DOT__io_slave_bvalid))));
    bufp->fullCData(oldp+80,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state),2);
    bufp->fullBit(oldp+81,(((IData)(vlSelf->computer__DOT__io_slave_arvalid) 
                            & (IData)(vlSelf->computer__DOT__io_slave_arready))));
    bufp->fullBit(oldp+82,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake));
    bufp->fullBit(oldp+83,(((IData)(vlSelf->computer__DOT__io_slave_awvalid) 
                            & (IData)(vlSelf->computer__DOT__io_slave_awready))));
    bufp->fullBit(oldp+84,(((IData)(vlSelf->computer__DOT__io_slave_wvalid) 
                            & (IData)(vlSelf->computer__DOT__io_slave_wready))));
    bufp->fullBit(oldp+85,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake));
    bufp->fullBit(oldp+86,(((IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_awvalid) 
                            & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_wvalid))));
    bufp->fullIData(oldp+87,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus),32);
    bufp->fullIData(oldp+88,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc),32);
    bufp->fullIData(oldp+89,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause),32);
    bufp->fullIData(oldp+90,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec),32);
    bufp->fullIData(oldp+91,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle),32);
    bufp->fullIData(oldp+92,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh),32);
    bufp->fullIData(oldp+93,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mvendorid),32);
    bufp->fullIData(oldp+94,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__marchid),32);
    bufp->fullIData(oldp+95,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg),32);
    bufp->fullCData(oldp+96,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state),3);
    bufp->fullBit(oldp+97,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake));
    bufp->fullBit(oldp+98,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake));
    bufp->fullBit(oldp+99,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake));
    bufp->fullBit(oldp+100,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake));
    bufp->fullBit(oldp+101,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake));
    bufp->fullBit(oldp+102,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake));
    bufp->fullBit(oldp+103,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag));
    bufp->fullIData(oldp+104,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0]),32);
    bufp->fullIData(oldp+105,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[1]),32);
    bufp->fullIData(oldp+106,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[2]),32);
    bufp->fullIData(oldp+107,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[3]),32);
    bufp->fullIData(oldp+108,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[4]),32);
    bufp->fullIData(oldp+109,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[5]),32);
    bufp->fullIData(oldp+110,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[6]),32);
    bufp->fullIData(oldp+111,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[7]),32);
    bufp->fullIData(oldp+112,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[8]),32);
    bufp->fullIData(oldp+113,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[9]),32);
    bufp->fullIData(oldp+114,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[10]),32);
    bufp->fullIData(oldp+115,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[11]),32);
    bufp->fullIData(oldp+116,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[12]),32);
    bufp->fullIData(oldp+117,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[13]),32);
    bufp->fullIData(oldp+118,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[14]),32);
    bufp->fullIData(oldp+119,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[15]),32);
    bufp->fullIData(oldp+120,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[16]),32);
    bufp->fullIData(oldp+121,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[17]),32);
    bufp->fullIData(oldp+122,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[18]),32);
    bufp->fullIData(oldp+123,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[19]),32);
    bufp->fullIData(oldp+124,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[20]),32);
    bufp->fullIData(oldp+125,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[21]),32);
    bufp->fullIData(oldp+126,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[22]),32);
    bufp->fullIData(oldp+127,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[23]),32);
    bufp->fullIData(oldp+128,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[24]),32);
    bufp->fullIData(oldp+129,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[25]),32);
    bufp->fullIData(oldp+130,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[26]),32);
    bufp->fullIData(oldp+131,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[27]),32);
    bufp->fullIData(oldp+132,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[28]),32);
    bufp->fullIData(oldp+133,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[29]),32);
    bufp->fullIData(oldp+134,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[30]),32);
    bufp->fullIData(oldp+135,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[31]),32);
    bufp->fullIData(oldp+136,(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__i),32);
    bufp->fullIData(oldp+137,((0xfffffffcU & ((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                               ? vlSelf->computer__DOT__cpu__DOT__pc
                                               : vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg))),32);
    bufp->fullBit(oldp+138,(vlSelf->clock));
    bufp->fullBit(oldp+139,(vlSelf->reset));
    bufp->fullIData(oldp+140,(0U),32);
    bufp->fullBit(oldp+141,(0U));
    bufp->fullCData(oldp+142,(0U),4);
    bufp->fullCData(oldp+143,(0U),2);
    bufp->fullCData(oldp+144,(1U),2);
    bufp->fullCData(oldp+145,(2U),2);
    bufp->fullCData(oldp+146,(3U),2);
    bufp->fullCData(oldp+147,(0U),3);
    bufp->fullCData(oldp+148,(1U),3);
    bufp->fullCData(oldp+149,(2U),3);
    bufp->fullCData(oldp+150,(3U),3);
    bufp->fullCData(oldp+151,(4U),3);
}
