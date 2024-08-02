# A-simple-example-of-VCS-verdi-simulation

这是一个VCS-Verdi的Verilog联合仿真脚本。创建这个库的初衷是方便自己随时开启仿真环境，而不需要重复编写脚本文件和修改相关路径。

因此，本脚本的目标是需要一个即时启动的仿真脚本，你不需要对脚本内容和文件路径做任何修改，就可以启动简单的VCS-Verdi仿真。

现在我来介绍一下在这个环境中支持的功能：
## 支持RTL文件路径导入
在终端中输入`make sch`即可将rtl文件夹内的所有以`.v`结尾的文件路径追加到`filelist.f`文件中。
使用`make csch`可以删除`fillist.f`文件。

## vcs仿真并生成fsdb文件
在终端中输入`make com`即可开始仿真，仿真配置如下：

## 打开verdi并自动添加fsdb文件和.v文件到程序中
在终端中输入`make verdi`即可调出verdi GUI界面。

## 清空工作环境
在终端中输入`make clean`即可清空工作环境中的除`filelist.f` `rtl` `Makefile`以外的文件和文件夹。
