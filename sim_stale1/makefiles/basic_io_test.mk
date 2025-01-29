
REPO_DIR ?= /home/shaun/repos/nexys_video_basic_io

RTL_DIR ?= $(REPO_DIR)/rtl
SIM_DIR ?= $(REPO_DIR)/sim
TCL_DIR ?= 

REG_DIR 	?= $(SIM_DIR)/register_model
AGENTS_DIR 	?= $(SIM_DIR)/agents
ENV_DIR		?= $(SIM_DIR)/env
TB_DIR		?= $(SIM_DIR)/tb
TESTS_DIR 	?= $(SIM_DIR)/tests

TESTNAME	= basic_io_test

# SRCS += $(RTL_DIR)/*.sv
# SRCS += $(AGENTS_DIR)/basic_io_agent/basic_io_agent_pkg.sv
# SRCS += $(ENV_DIR)/*.sv
SRCS += $(TESTS_DIR)/basic_io_test_lib_pkg.sv
SRCS += $(TB_DIR)/hdl_top.sv
SRCS += $(TB_DIR)/hvl_top.sv
SRCS += $(TB_DIR)/top.sv

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
