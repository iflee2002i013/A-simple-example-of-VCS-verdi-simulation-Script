
#-------------------------------------------------------------------------------------------------------
all  :clean csch sch vcs sim verdi
com  :vcs sim
clnall :clean csch
#-------------------------------------------------------------------------------------------------------
sch : 
	find ./rtl -name "*.v" >> ./filelist.f
	@echo "Verilog File paths have been appended to filelist.f"
csch :
	rm -f ./filelist.f
	@echo "filelist.f has been removed."
#-------------------------------------------------------------------------------------------------------
# To compile fsdbfile.
vcs   :
	vcs     \
		-full64 -sverilog\
		+v2k\
		-l compile.log\
		-timescale=1ns/1ns\
		-f filelist.f  \
		-debug_access+all -kdb +vcs+fsdbon\
		+define+MP_FSDB\

#-------------------------------------------------------------------------------------------------------
# This intruction can generate fsdbfile without adding dumpfsdb in your testbench.
sim   :
		./simv -l sim.log +fsdbfile+tb.fsdb &
#-------------------------------------------------------------------------------------------------------
# Open verdi gui.
verdi  :
	verdi -f filelist.f -ssf tb.fsdb &
#-------------------------------------------------------------------------------------------------------
# Clean your workplace
clean  :
	 rm  -rf  *~  core  csrc  simv*  vc_hdrs.h  ucli.key  urg* *.log  novas.* *.fsdb* verdiLog  64* DVEfiles *.vpd
#-------------------------------------------------------------------------------------------------------
# When editing Verilog in C++, use the following script.
# 	vcs -cpp g++-4.8 -cc gcc-4.8    \
# -full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed
