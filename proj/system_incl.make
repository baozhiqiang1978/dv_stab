#################################################################
# Makefile generated by Xilinx Platform Studio 
# Project:/home/kevin/ece532/dv_stab/proj/system.xmp
#
# WARNING : This file will be re-generated every time a command
# to run a make target is invoked. So, any changes made to this  
# file manually, will be lost when make is invoked next. 
#################################################################

XILINX_EDK_DIR = /home/kevin/CAD/Xilinx/10.1/EDK
NON_CYG_XILINX_EDK_DIR = /home/kevin/CAD/Xilinx/10.1/EDK

SYSTEM = system

MHSFILE = system.mhs

MSSFILE = system.mss

FPGA_ARCH = virtex2p

DEVICE = xc2vp30ff896-7

LANGUAGE = verilog

SEARCHPATHOPT =  -lp lib/ -lp /home/kevin/ece532/dv_stab/pcores_src/

SUBMODULE_OPT = 

PLATGEN_OPTIONS = -p $(DEVICE) -lang $(LANGUAGE) $(SEARCHPATHOPT) $(SUBMODULE_OPT)

LIBGEN_OPTIONS = -mhs $(MHSFILE) -p $(DEVICE) $(SEARCHPATHOPT) \
                   $(UB_LIBG_OPT)

VPGEN_OPTIONS = -p $(DEVICE) $(SEARCHPATHOPT)

MANAGE_FASTRT_OPTIONS = -reduce_fanout no

OBSERVE_PAR_OPTIONS = -error yes

DV_STAB_OUTPUT_DIR = dv_stab
DV_STAB_OUTPUT = $(DV_STAB_OUTPUT_DIR)/executable.elf

SPLIT_CROP_TEST_OUTPUT_DIR = split_crop_test
SPLIT_CROP_TEST_OUTPUT = $(SPLIT_CROP_TEST_OUTPUT_DIR)/executable.elf

MICROBLAZE_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/microblaze/mb_bootloop.elf
PPC405_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc405/ppc_bootloop.elf
PPC440_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc440/ppc440_bootloop.elf
BOOTLOOP_DIR = bootloops

UB_BOOTLOOP = $(BOOTLOOP_DIR)/ub.elf
UB_XMDSTUB = ub/code/xmdstub.elf

BRAMINIT_ELF_FILES =  $(SPLIT_CROP_TEST_OUTPUT) 
BRAMINIT_ELF_FILE_ARGS =   -pe uB $(SPLIT_CROP_TEST_OUTPUT) 

ALL_USER_ELF_FILES = $(DV_STAB_OUTPUT) $(SPLIT_CROP_TEST_OUTPUT) 

SIM_CMD = vsim

BEHAVIORAL_SIM_SCRIPT = simulation/behavioral/$(SYSTEM)_setup.do

STRUCTURAL_SIM_SCRIPT = simulation/structural/$(SYSTEM)_setup.do

TIMING_SIM_SCRIPT = simulation/timing/$(SYSTEM)_setup.do

DEFAULT_SIM_SCRIPT = $(BEHAVIORAL_SIM_SCRIPT)

MIX_LANG_SIM_OPT = -mixed yes

SIMGEN_OPTIONS = -p $(DEVICE) -lang $(LANGUAGE) $(SEARCHPATHOPT) $(BRAMINIT_ELF_FILE_ARGS) $(MIX_LANG_SIM_OPT)  -s mti -tb -X /home/kevin/CAD/Xilinx/10.1/simlibs/ISE_Lib/ -E /home/kevin/CAD/Xilinx/10.1/simlibs/EDK_Lib/

UB_XMDSTUB = ub/code/xmdstub.elf

LIBRARIES =  \
       ub/lib/libxil.a 
VPEXEC = virtualplatform/vpexec

LIBSCLEAN_TARGETS = ub_libsclean 

PROGRAMCLEAN_TARGETS = dv_stab_programclean split_crop_test_programclean 

CORE_STATE_DEVELOPMENT_FILES = /home/kevin/ece532/dv_stab/proj/pcores/bram_array_v1_00_a/netlist/bram.ngc \
/home/kevin/ece532/dv_stab/proj/pcores/gcbp_v1_00_a/hdl/verilog/gcbp_line_detect.v \
/home/kevin/ece532/dv_stab/proj/pcores/gcbp_v1_00_a/hdl/verilog/gcbp_frame_detect.v \
/home/kevin/ece532/dv_stab/proj/pcores/gcbp_v1_00_a/hdl/verilog/gcbp_bram_addr_dec.v \
/home/kevin/ece532/dv_stab/proj/pcores/gcbp_v1_00_a/hdl/verilog/gcbp_bram_write_enable_dec.v \
/home/kevin/ece532/dv_stab/proj/pcores/gcbp_v1_00_a/hdl/verilog/gcbp_line_gen.v \
/home/kevin/ece532/dv_stab/proj/pcores/gcbp_v1_00_a/hdl/verilog/gcbp.v \
/home/kevin/ece532/dv_stab/proj/pcores/bram_array_v1_00_a/hdl/verilog/bram_array.v \
/home/kevin/ece532/dv_stab/proj/pcores/bram_array_v1_00_a/hdl/verilog/bram.v \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/proc_common_pkg.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/ipif_pkg.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/or_muxcy.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/or_gate128.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/family_support.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/pselect_f.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/counter_f.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/soft_reset.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/family.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/cntr_incr_decr_addn_f.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/muxf_struct_f.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/dynshreg_f.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/srl_fifo_rbu_f.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/srl_fifo_f.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/plbv46_slave_single_v1_00_a/hdl/vhdl/plb_address_decoder.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/plbv46_slave_single_v1_00_a/hdl/vhdl/plb_slave_attachment.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/plbv46_slave_single_v1_00_a/hdl/vhdl/plbv46_slave_single.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/interrupt_control_v2_00_a/hdl/vhdl/interrupt_control.vhd \
/home/kevin/ece532/dv_stab/proj/pcores/correlator_xor_v1_00_a/hdl/verilog/user_logic.v \
/home/kevin/ece532/dv_stab/proj/pcores/correlator_xor_v1_00_a/hdl/vhdl/correlator_xor.vhd \
/home/kevin/ece532/dv_stab/proj/pcores/correlator_xor_v1_00_a/hdl/verilog/bitsum_comp.v \
/home/kevin/ece532/dv_stab/proj/pcores/correlator_xor_v1_00_a/hdl/verilog/correlator_core.v \
/home/kevin/ece532/dv_stab/proj/pcores/correlator_xor_v1_00_a/hdl/verilog/params.v \
/home/kevin/ece532/dv_stab/proj/pcores/correlator_xor_v1_00_a/hdl/verilog/six_three_comp.v \
/home/kevin/ece532/dv_stab/proj/pcores/correlator_xor_v1_00_a/hdl/verilog/sum_of_3bit_pair.v \
/home/kevin/ece532/dv_stab/proj/pcores/correlator_xor_v1_00_a/hdl/verilog/sum_of_64.v \
/home/kevin/ece532/dv_stab/proj/pcores/correlator_xor_v1_00_a/hdl/verilog/ternary_add.v \
/home/kevin/ece532/dv_stab/proj/pcores/correlator_xor_v1_00_a/hdl/verilog/twelve_four_comp.v \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/plbv46_master_burst_v1_00_a/hdl/vhdl/plb_mstr_addr_gen.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/plbv46_master_burst_v1_00_a/hdl/vhdl/rd_wr_calc_burst.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/plbv46_master_burst_v1_00_a/hdl/vhdl/rd_wr_controller.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/plbv46_master_burst_v1_00_a/hdl/vhdl/llink_rd_backend_no_fifo.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/plbv46_master_burst_v1_00_a/hdl/vhdl/llink_wr_backend_no_fifo.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/plbv46_master_burst_v1_00_a/hdl/vhdl/data_width_adapter.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/plbv46_master_burst_v1_00_a/hdl/vhdl/data_mirror_128.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/plbv46_master_burst_v1_00_a/hdl/vhdl/cc_brst_exp_adptr.vhd \
/home/kevin/CAD/Xilinx/10.1/EDK/hw/XilinxProcessorIPLib/pcores/plbv46_master_burst_v1_00_a/hdl/vhdl/plbv46_master_burst.vhd \
/home/kevin/ece532/dv_stab/proj/pcores/split_compensate_v1_01_a/hdl/verilog/user_logic.v \
/home/kevin/ece532/dv_stab/proj/pcores/split_compensate_v1_01_a/hdl/vhdl/split_compensate.vhd \
/home/kevin/ece532/dv_stab/proj/pcores/split_compensate_v1_01_a/hdl/verilog/line_buffer_mod.v \
/home/kevin/ece532/dv_stab/proj/pcores/split_compensate_v1_01_a/hdl/verilog/line_buffer_video.v \
/home/kevin/ece532/dv_stab/proj/pcores/split_compensate_v1_01_a/hdl/verilog/h_addr_gen.v \
/home/kevin/ece532/dv_stab/proj/pcores/split_compensate_v1_01_a/hdl/verilog/v_addr_gen.v \
/home/kevin/ece532/dv_stab/proj/pcores/split_compensate_v1_01_a/hdl/verilog/v_sync.v \
/home/kevin/ece532/dv_stab/proj/pcores/split_compensate_v1_01_a/hdl/verilog/h_sync.v

WRAPPER_NGC_FILES = implementation/ub_wrapper.ngc \
implementation/ilmb_wrapper.ngc \
implementation/dlmb_wrapper.ngc \
implementation/dlmb_cntlr_wrapper.ngc \
implementation/ilmb_cntlr_wrapper.ngc \
implementation/lmb_bram_wrapper.ngc \
implementation/plb_ub_wrapper.ngc \
implementation/uart_ub_wrapper.ngc \
implementation/iic_wrapper.ngc \
implementation/plb_video_to_ram_wrapper.ngc \
implementation/video_out_wrapper.ngc \
implementation/plb_video_out_wrapper.ngc \
implementation/proc_sys_reset_0_wrapper.ngc \
implementation/ddr_sdram_wrapper.ngc \
implementation/clock_generator_0_wrapper.ngc \
implementation/debug_module_wrapper.ngc \
implementation/gcbp_0_wrapper.ngc \
implementation/bram_array_0_wrapper.ngc \
implementation/correlator_xor_0_wrapper.ngc \
implementation/split_compensate_1_wrapper.ngc \
implementation/plb_split_comp_wrapper.ngc

POSTSYN_NETLIST = implementation/$(SYSTEM).ngc

SYSTEM_BIT = implementation/$(SYSTEM).bit

DOWNLOAD_BIT = implementation/download.bit

SYSTEM_ACE = implementation/$(SYSTEM).ace

UCF_FILE = data/system.ucf

BMM_FILE = implementation/$(SYSTEM).bmm

BITGEN_UT_FILE = etc/bitgen.ut

XFLOW_OPT_FILE = etc/fast_runtime.opt
XFLOW_DEPENDENCY = __xps/xpsxflow.opt $(XFLOW_OPT_FILE)

XPLORER_DEPENDENCY = __xps/xplorer.opt
XPLORER_OPTIONS = -p $(DEVICE) -uc $(SYSTEM).ucf -bm $(SYSTEM).bmm -max_runs 7

FPGA_IMP_DEPENDENCY = $(BMM_FILE) $(POSTSYN_NETLIST) $(UCF_FILE) $(XFLOW_DEPENDENCY)

#################################################################
# SOFTWARE APPLICATION DV_STAB
#################################################################

DV_STAB_SOURCES = /home/kevin/ece532/dv_stab/sw_src/init_hw.c /home/kevin/ece532/dv_stab/sw_src/main.c /home/kevin/ece532/dv_stab/sw_src/video_decoder_driver/video_dec_driver.c /home/kevin/ece532/dv_stab/sw_src/correlator_driver_xor/correlator_driver.c /home/kevin/ece532/dv_stab/sw_src/calcMotionVector.c /home/kevin/ece532/dv_stab/sw_src/video_out_driver/video_out.c /home/kevin/ece532/dv_stab/sw_src/calcCompensationVector.c /home/kevin/ece532/dv_stab/sw_src/split_comp_driver/split_comp_driver.c 

DV_STAB_HEADERS = /home/kevin/ece532/dv_stab/sw_src/video_decoder_driver/video_dec_driver.h /home/kevin/ece532/dv_stab/sw_src/init_hw.h /home/kevin/ece532/dv_stab/sw_src/main.h /home/kevin/ece532/dv_stab/sw_src/data_structs.h /home/kevin/ece532/dv_stab/sw_src/correlator_driver_xor/correlator_driver.h /home/kevin/ece532/dv_stab/sw_src/calcMotionVector.h /home/kevin/ece532/dv_stab/sw_src/video_out_driver/video_out.h /home/kevin/ece532/dv_stab/sw_src/calcCompensationVector.h /home/kevin/ece532/dv_stab/sw_src/split_comp_driver/split_comp_driver.h 

DV_STAB_CC = mb-gcc
DV_STAB_CC_SIZE = mb-size
DV_STAB_CC_OPT = -O2
DV_STAB_CFLAGS = -std=c99 -pedantic -Wall -Wshadow -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes
DV_STAB_CC_SEARCH = # -B
DV_STAB_LIBPATH = -L./ub/lib/ # -L
DV_STAB_INCLUDES = -I./ub/include/  -I/home/kevin/ece532/dv_stab/sw_src/video_decoder_driver/ -I/home/kevin/ece532/dv_stab/sw_src/ -I/home/kevin/ece532/dv_stab/sw_src/correlator_driver_xor/ -I/home/kevin/ece532/dv_stab/sw_src/video_out_driver/ -I/home/kevin/ece532/dv_stab/sw_src/split_comp_driver/ # -I
DV_STAB_LFLAGS = # -l
DV_STAB_LINKER_SCRIPT = 
DV_STAB_LINKER_SCRIPT_FLAG = #-Wl,-T -Wl,$(DV_STAB_LINKER_SCRIPT) 
DV_STAB_CC_DEBUG_FLAG =  -g 
DV_STAB_CC_PROFILE_FLAG = # -pg
DV_STAB_CC_GLOBPTR_FLAG= # -mxl-gp-opt
DV_STAB_MODE = xmdstub
DV_STAB_LIBG_OPT = -$(DV_STAB_MODE) ub
DV_STAB_CC_INFERRED_FLAGS= -mxl-soft-mul -mxl-pattern-compare -mcpu=v7.10.d 
DV_STAB_CC_START_ADDR_FLAG=  # -Wl,-defsym -Wl,_TEXT_START_ADDR=
DV_STAB_CC_STACK_SIZE_FLAG=  # -Wl,-defsym -Wl,_STACK_SIZE=
DV_STAB_CC_HEAP_SIZE_FLAG=  # -Wl,-defsym -Wl,_HEAP_SIZE=
DV_STAB_OTHER_CC_FLAGS= $(DV_STAB_CC_GLOBPTR_FLAG)  \
                  $(DV_STAB_CC_START_ADDR_FLAG) $(DV_STAB_CC_STACK_SIZE_FLAG) $(DV_STAB_CC_HEAP_SIZE_FLAG)  \
                  $(DV_STAB_CC_INFERRED_FLAGS)  \
                  $(DV_STAB_LINKER_SCRIPT_FLAG) $(DV_STAB_CC_DEBUG_FLAG) $(DV_STAB_CC_PROFILE_FLAG) 

#################################################################
# SOFTWARE APPLICATION SPLIT_CROP_TEST
#################################################################

SPLIT_CROP_TEST_SOURCES = /home/kevin/ece532/dv_stab/sw_src/split_crop_test.c 

SPLIT_CROP_TEST_HEADERS = 

SPLIT_CROP_TEST_CC = mb-gcc
SPLIT_CROP_TEST_CC_SIZE = mb-size
SPLIT_CROP_TEST_CC_OPT = -O0
SPLIT_CROP_TEST_CFLAGS = 
SPLIT_CROP_TEST_CC_SEARCH = # -B
SPLIT_CROP_TEST_LIBPATH = -L./ub/lib/ # -L
SPLIT_CROP_TEST_INCLUDES = -I./ub/include/ # -I
SPLIT_CROP_TEST_LFLAGS = # -l
SPLIT_CROP_TEST_LINKER_SCRIPT = 
SPLIT_CROP_TEST_LINKER_SCRIPT_FLAG = #-Wl,-T -Wl,$(SPLIT_CROP_TEST_LINKER_SCRIPT) 
SPLIT_CROP_TEST_CC_DEBUG_FLAG =  -g 
SPLIT_CROP_TEST_CC_PROFILE_FLAG = # -pg
SPLIT_CROP_TEST_CC_GLOBPTR_FLAG= # -mxl-gp-opt
SPLIT_CROP_TEST_MODE = executable
SPLIT_CROP_TEST_LIBG_OPT = -$(SPLIT_CROP_TEST_MODE) ub
SPLIT_CROP_TEST_CC_INFERRED_FLAGS= -mxl-soft-mul -mxl-pattern-compare -mcpu=v7.10.d 
SPLIT_CROP_TEST_CC_START_ADDR_FLAG=  # -Wl,-defsym -Wl,_TEXT_START_ADDR=
SPLIT_CROP_TEST_CC_STACK_SIZE_FLAG=  # -Wl,-defsym -Wl,_STACK_SIZE=
SPLIT_CROP_TEST_CC_HEAP_SIZE_FLAG=  # -Wl,-defsym -Wl,_HEAP_SIZE=
SPLIT_CROP_TEST_OTHER_CC_FLAGS= $(SPLIT_CROP_TEST_CC_GLOBPTR_FLAG)  \
                  $(SPLIT_CROP_TEST_CC_START_ADDR_FLAG) $(SPLIT_CROP_TEST_CC_STACK_SIZE_FLAG) $(SPLIT_CROP_TEST_CC_HEAP_SIZE_FLAG)  \
                  $(SPLIT_CROP_TEST_CC_INFERRED_FLAGS)  \
                  $(SPLIT_CROP_TEST_LINKER_SCRIPT_FLAG) $(SPLIT_CROP_TEST_CC_DEBUG_FLAG) $(SPLIT_CROP_TEST_CC_PROFILE_FLAG) 
