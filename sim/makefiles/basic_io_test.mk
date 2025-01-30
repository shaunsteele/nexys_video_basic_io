
REPO_DIR ?= /home/shaun/repos/nexys_video_basic_io

REG_DIR	?= $(REPO_DIR)/regmodel
RTL_DIR ?= $(REPO_DIR)/rtl
SIM_DIR ?= $(REPO_DIR)/sim
TCL_DIR ?= $(REPO_DIR)/tcl

TB_DIR	?= $(SIM_DIR)/generated_tb/tb

TESTNAME = top_test

SRCS += $(RTL_DIR)/nexys_video_basic_io_core.sv

SRCS += $(REG_DIR)/regmodel_pkg.sv

SRCS += $(TB_DIR)/axi_lite/sv/axi_lite_pkg.sv
SRCS += $(TB_DIR)/basic_io/sv/basic_io_pkg.sv
SRCS += $(TB_DIR)/top/sv/top_pkg.sv
SRCS += $(TB_DIR)/top_test/sv/top_test_pkg.sv
SRCS += $(TB_DIR)/top_tb/sv/top_th.sv
SRCS += $(TB_DIR)/top_tb/sv/top_tb.sv

COMP_ARGS += --incr --relax
COMP_ARGS += -L uvm

ELAB_ARGS == -L uvm

SIM_ARGS += -testplusarg UVM_TESTNAME=$(TESTNAME)
SIM_ARGS += -testplusarg UVM_VERBOSITY=UVM_LOW

DEFINES :=

.PHONY: simulate
simulate: $(TOP)_snapshot.wdb

.PHONY: elaborate
elaborate: .elab.timestamp

.PHONY: compile
compile: .comp.timestamp

.PHONY: waves
waves:
	gtkwave dump.vcd

$(TOP)_snapshot.wdb: .elab.timestamp
	@echo
	@echo "### SIMULATING ###"
	xsim $(TOP)_snapshot -tclbatch $(TCL_DIR)/xsim_cfg.tcl $(SIM_ARGS)

.elab.timestamp: .comp.timestamp
	@echo
	@echo "### ELABORATING ###"
	xelab -debug all $(ELAB_ARGS) -top top.sv -snapshot $(TOP)_snapshot
	touch .elab.timestamp

.comp.timestamp: $(SRCS)
	@echo
	@echo "### COMPILING ###"
	xvlog $(COMP_ARGS) $(INCLUDES) $(DEFINES) --sv $(SRCS)
	touch .comp.timestamp

.PHONY: clean
clean:
	rm -rf *.jou *.log *.pb *.wdb xsim.dir
	rm -rf .*.timestamp
