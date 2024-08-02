# A-simple-example-of-VCS-verdi-simulation

这是一个VCS-Verdi的Verilog联合仿真脚本。创建这个库的初衷是方便自己随时开启仿真环境，而不需要重复编写脚本文件和修改相关路径。

因此，本脚本的目标是需要一个即时启动的仿真脚本，你不需要对脚本内容和文件路径做任何修改，就可以启动简单的VCS-Verdi仿真。

现在我来介绍一下在这个环境中支持的功能：
## 支持RTL文件路径导入
在终端中输入`make sch`即可将rtl文件夹内的所有以`.v`结尾的文件路径追加到`filelist.f`文件中。
使用`make csch`可以删除`fillist.f`文件。

## vcs仿真并生成fsdb文件
在终端中输入`make com`即可开始仿真，仿真配置如下：
``` makefile
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
```
## 打开verdi并自动添加fsdb文件和.v文件到程序中
在终端中输入`make verdi`即可调出verdi GUI界面。

## 清空工作环境
在终端中输入`make clean`即可清空工作环境中的除`filelist.f` `rtl` `Makefile`以外的文件和文件夹。

---

# A Simple Example of VCS-Verdi Simulation

This is a VCS-Verdi Verilog co-simulation script. The primary purpose of creating this library is to enable quick simulation setup without the need to repeatedly write script files and modify relevant paths.

Therefore, the goal of this script is to provide an instantly usable simulation script. You can start a simple VCS-Verdi simulation without making any modifications to the script content or file paths.

Here are the features supported in this environment:

**Support for RTL File Path Import**
- By entering `make sch` in the terminal, all files ending with .v in the rtl folder are appended to the filelist.f file. Use `make csch` to delete the filelist.f file.

**VCS Simulation and FSDB File Generation**
- By entering `make com` in the terminal, the simulation will start with the following configuration:

**Open Verdi and Automatically Add FSDB and .v Files to the Program**
- By entering `make verdi` in the terminal, the Verdi GUI interface will launch.

**Clean the Working Environment**
- By entering `make clean` in the terminal, all files and folders in the working environment except filelist.f, rtl, and Makefile will be cleared.
