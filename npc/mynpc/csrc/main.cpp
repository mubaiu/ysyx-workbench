#include "Vtop.h"
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include "verilated.h"
#include "verilated_fst_c.h"

#include <cpu/cpu.h>
#include <reg.h>  // 添加这一行引入 CPU_state 和 cpu 声明
#include <utils.h> // 引入nemu_state定义
#include <isa.h>
#include <memory/vaddr.h>
#include <cpu/decode.h>  

void init_monitor(int, char *[]);
void am_init_monitor();
void engine_start();
int is_exit_status_bad();

void exec_once(Decode *d, vaddr_t pc);

extern Decode d; 


extern "C" {
  VerilatedContext* contextp = nullptr;
  Vtop* top = nullptr;
  VerilatedFstC* tfp = nullptr;
}

uint64_t sim_time = 0;
int main(int argc, char** argv) {
    // 初始化CPU状态 - 修改初始化顺序
    contextp = new VerilatedContext;
    contextp->commandArgs(argc, argv);
    contextp->traceEverOn(true);
    
    top = new Vtop{contextp};
    tfp = new VerilatedFstC;
    top->trace(tfp, 99);
    tfp->open("wave.fst");
    
    // 首先让顶层模块评估一次，确保内部信号初始化
    // top->eval();
    // top->clk = !top->clk;
    // tfp->dump(sim_time++);
    
   
    
    
    

    /* Initialize the monitor. */
    #ifdef CONFIG_TARGET_AM
    am_init_monitor();
    #else
    init_monitor(argc, argv);
    #endif
     // 然后设置复位信号
    // top->rst = 1;
    // top->clk = !top->clk;
    top->eval();
    // tfp->dump(sim_time++);
    

    for (int i = 0; i < 2; i++) {
        top->rst = 0;
        top->clk = !top->clk;
        top->eval();
        tfp->dump(sim_time++);
    }
    exec_once(&d, npc.pc);
    // 释放复位信号后，给予额外的时钟周期稳定系统
    top->rst = 1;
    for (int i = 0; i < 2; i++) {
        top->clk = !top->clk;
        top->eval();
        tfp->dump(sim_time++);
    }
    
    /* Start engine. */
    engine_start();
    
    
    tfp->flush();

    // 清理资源
    tfp->close();
    delete top;
    delete contextp;
    return is_exit_status_bad();
}

extern "C" void ebreak() {
    // 从CPU状态中获取a0寄存器的值
    uint32_t a0 = npc.gpr[10]; // a0是第10个寄存器
    uint32_t pc = d.dnpc;
    
    // 设置nemu_state
    nemu_state.state = NEMU_END;
    nemu_state.halt_ret = a0;
    nemu_state.halt_pc = pc;
    
    // printf("EBREAK: Simulation stopped with exit code 0x%08x at pc = 0x%08x.\n", a0, pc);
    
    // 打印寄存器状态(可选)
    // isa_reg_display();
    
    // 不要在这里直接调用exit，让主循环处理终止
    // 修改为设置标志，让cpu_exec函数退出循环
    // exit(0); 
}