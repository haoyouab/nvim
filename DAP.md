# DAP (Debug Adapter Protocol) 调试指南

> 本配置支持 2 种 C/C++ 调试适配器：codelldb (LLDB) 和 cppdbg (GDB via cpptools)

---

## 前置条件

1. **编译时必须带调试信息**：

```bash
# C
gcc -g -O0 main.c -o main

# C++
g++ -g -O0 main.cpp -o main

# CMake
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
```

`-g` 生成调试符号，`-O0` 关闭优化（防止变量被优化掉）。

2. **首次使用**：打开 Neovim 执行 `:Lazy sync` 同步插件。

---

## 快捷键速查

### F 键（常用）

| 快捷键 | 作用 |
|--------|------|
| `F5` | 启动 / 继续调试 |
| `F6` | 终止调试 |
| `F9` | 设置 / 取消断点 |
| `F10` | 单步跳过（Step Over） |
| `F11` | 单步进入（Step Into） |
| `Shift+F11` | 单步跳出（Step Out） |

### Leader 键

| 快捷键 | 作用 |
|--------|------|
| `<leader>db` | 设置 / 取消断点 |
| `<leader>dB` | 条件断点（输入条件表达式） |
| `<leader>dL` | 日志断点（不暂停，打印消息） |
| `<leader>dc` | 启动 / 继续调试 |
| `<leader>da` | 带参数运行 |
| `<leader>dC` | 运行到光标行 |
| `<leader>dg` | 跳转到行（不执行） |
| `<leader>di` | 单步进入 |
| `<leader>do` | 单步跳出 |
| `<leader>dO` | 单步跳过 |
| `<leader>dP` | 暂停执行 |
| `<leader>dl` | 重新运行上一次调试 |
| `<leader>dj` | 调用栈向下移动 |
| `<leader>dk` | 调用栈向上移动 |
| `<leader>dr` | 打开 / 关闭 REPL |
| `<leader>ds` | 查看调试会话 |
| `<leader>dt` | 终止调试 |
| `<leader>dw` | 悬浮显示变量值 |
| `<leader>du` | 打开 / 关闭 DAP UI |
| `<leader>de` | 求值表达式（支持可视模式选中） |

---

## 调试流程

### 1. 设置断点

打开源文件，将光标移到目标行，按 `F9` 设置断点（行号旁出现 `●`）。

断点类型：

| 图标 | 含义 |
|------|------|
| `●` | 普通断点 |
| `◆` | 条件断点 |
| `◇` | 日志断点 |
| `▶` | 当前停止位置 |
| `○` | 被拒绝的断点（无效位置） |

### 2. 启动调试

按 `F5`，弹出适配器选择菜单：

```
1. Launch file                 ← codelldb (LLDB)
2. Attach to process           ← codelldb (LLDB)
3. GDB: Launch file            ← GDB 原生
4. GDB: Launch with args       ← GDB + 命令行参数
5. GDB: Attach to process      ← GDB 附加到进程
6. GDB: Attach to gdbserver    ← GDB 远程调试
```

选择后输入可执行文件路径（支持 Tab 补全）。

### 3. 单步调试

程序在断点处暂停后：

- `F10` 执行当前行，不进入函数（**最常用**）
- `F11` 进入函数内部查看执行细节
- `Shift+F11` 从当前函数返回到调用处
- `F5` 继续运行到下一个断点

### 4. 查看变量

- 光标悬停在变量上，按 `<leader>dw` 查看值
- 选中表达式后按 `<leader>de` 求值
- DAP UI 的 Scopes 面板自动显示所有局部/全局变量

### 5. 退出调试

- `F6` 或 `<leader>dt` 终止调试（UI 自动关闭）
- 如果 UI 未自动关闭，按 `<leader>du` 手动关闭

---

## DAP UI 面板布局

调试启动后 UI 自动打开：

```
┌──────────────┬──────────────────────────────────┐
│ Scopes  40%  │                                  │
│  x = 5       │   源代码                          │
│  ptr = 0x... │   ▶ 当前停止行（绿色高亮）         │
│──────────────│                                  │
│ Breakpts 15% │                                  │
│  main.c:15   │                                  │
│──────────────│                                  │
│ Stacks  25%  │                                  │
│  main()      │                                  │
│  func_a()    │                                  │
│──────────────│                                  │
│ Watches 20%  │                                  │
│  arr[i]      │                                  │
├──────────────┴──────────────────────────────────┤
│ REPL                  │ Console                  │
│ > print arr[0]        │ Hello, World!            │
└───────────────────────┴──────────────────────────┘
```

各面板说明：

| 面板 | 说明 |
|------|------|
| **Scopes** | 当前作用域的局部变量和全局变量，自动更新 |
| **Breakpoints** | 所有已设置断点的列表 |
| **Stacks** | 函数调用栈，可用 `<leader>dj/dk` 上下切换 |
| **Watches** | 自定义监视表达式，按 `i` 添加（如 `*ptr`, `arr[i]`） |
| **REPL** | 交互式求值，可输入表达式查看结果 |
| **Console** | 程序的标准输出 / 标准错误 |

---

## 调试适配器说明

| 适配器 | 后端 | 说明 |
|--------|------|------|
| `codelldb` | LLDB | Mason 自动安装，LazyVim clangd extra 默认配置 |
| `cppdbg` | GDB (cpptools) | Mason 自动安装，微软 cpptools 封装的 GDB |

> 注：GDB 原生 DAP 模式（`--interpreter=dap`）需要 GDB 14+。当前系统为 GDB 12.1，因此使用 `cppdbg` 适配器间接调用 GDB。

---

## 常见调试场景

### 带命令行参数调试

按 `F5` → 选择 **"GDB: Launch with args"** → 输入可执行文件路径 → 输入参数（空格分隔）。

### 附加到正在运行的进程

```bash
# 先启动程序
./my_server &
```

按 `F5` → 选择 **"GDB: Attach to process"** → 从进程列表中选择目标进程。

### 远程调试（gdbserver）

在目标机器上：

```bash
gdbserver :1234 ./my_program
```

在 Neovim 中按 `F5` → 选择 **"GDB: Attach to gdbserver :1234"** → 输入本地可执行文件路径。

### 条件断点

将光标移到目标行，按 `<leader>dB`，输入条件表达式：

```
i == 100
ptr != NULL
strcmp(name, "test") == 0
```

程序仅在条件为真时暂停。

### 日志断点

按 `<leader>dL`，输入日志消息：

```
Value of x: {x}, array[{i}] = {arr[i]}
```

程序不会暂停，但会在 Console 中打印消息。`{}` 内的表达式会被求值。

---

## REPL 详细用法

REPL（Read-Eval-Print Loop）是 DAP UI 底部的交互式调试控制台，按 `<leader>dr` 打开。

REPL 顶部有一排可点击的调试控制按钮：`▶ ⏸ ⏭ ⏎ ⏮ ▶▶ ⏹ ⏏`

### 两种输入模式

**1. 直接输入表达式**（DAP 求值）

直接输入变量名或表达式，DAP 会返回结果：

```
> my_var
42
> ptr
0x7fffffffe010
> arr[3]
100
> a + b * 2
57
```

**2. `-exec` 前缀**（执行 GDB 原生命令）

加 `-exec` 前缀可以执行任意 GDB 命令，功能远比直接求值强大。

### `-exec` 命令大全

#### 变量与内存

```
-exec p my_var                       打印变量（十进制）
-exec p/x my_var                     十六进制
-exec p/t my_var                     二进制
-exec p/o my_var                     八进制
-exec p/c my_var                     字符
-exec p/a my_var                     地址
-exec p/f my_var                     浮点数
-exec p *array@10                    打印数组前 10 个元素
-exec p *array@len                   打印数组前 len 个元素
-exec p ((struct foo *)ptr)->field   类型转换后访问成员
-exec p sizeof(struct my_struct)     查看结构体大小
-exec p/x *(uint64_t *)0x7fff1234   读取指定内存地址的值
-exec ptype my_var                   显示变量类型定义
-exec ptype struct foo               显示结构体完整定义
-exec whatis my_var                  显示变量类型名
```

#### 内存检查（examine）

```
-exec x/16xb ptr                     从 ptr 开始显示 16 字节（hex, byte）
-exec x/8xw ptr                      显示 8 个 word（4 字节，hex）
-exec x/4xg ptr                      显示 4 个 giant word（8 字节，hex）
-exec x/10i $pc                      反汇编当前位置后 10 条指令
-exec x/s str_ptr                    显示字符串
-exec x/20xb 0x7fffffffe000          查看指定地址的内存内容
```

格式说明：`x/NFU addr`
- N = 数量，F = 格式（x 十六进制, d 十进制, s 字符串, i 指令），U = 单位（b 字节, h 半字, w 字, g 8 字节）

#### 显示设置

```
-exec set output-radix 16            所有变量默认十六进制显示
-exec set output-radix 10            切回十进制
-exec set print pretty on            结构体美化打印（每个字段一行）
-exec set print array on             数组美化打印
-exec set print elements 0           打印数组时不限制元素数量（默认 200）
-exec set print repeats 0            不折叠重复元素
```

#### 断点管理

```
-exec info breakpoints               列出所有断点
-exec delete 3                       删除 3 号断点
-exec delete                         删除所有断点
-exec disable 2                      临时禁用 2 号断点
-exec enable 2                       重新启用
-exec break main.c:42                在指定文件行设断点
-exec break function_name            在函数入口设断点
-exec watch my_var                   数据监视点（变量被修改时暂停）
-exec rwatch my_var                  读监视点（变量被读取时暂停）
-exec awatch my_var                  读写监视点
```

#### 线程与调用栈

```
-exec info threads                   列出所有线程
-exec thread 3                       切换到 3 号线程
-exec thread apply all bt            所有线程的调用栈
-exec bt                             当前线程调用栈
-exec bt full                        调用栈 + 每帧的局部变量
-exec frame 2                        切换到 2 号栈帧
-exec info locals                    当前栈帧的所有局部变量
-exec info args                      当前函数的参数
```

#### 执行控制

```
-exec finish                         运行到当前函数返回
-exec until 100                      运行到第 100 行
-exec jump 50                        跳转到第 50 行执行（危险！跳过中间代码）
-exec signal SIGCONT                 向程序发送信号
-exec call my_func(1, 2)             在调试中调用函数
-exec return 42                      强制当前函数返回指定值
```

#### 信号处理

```
-exec info signals                   查看所有信号的处理方式
-exec handle SIGUSR1 noprint nostop  忽略 SIGUSR1（不打印、不暂停）
-exec handle SIGSEGV stop print      收到 SIGSEGV 时暂停并打印
```

#### 进程信息

```
-exec info proc mappings             查看进程内存映射
-exec info registers                 查看所有寄存器
-exec info reg rax rbx               查看指定寄存器
-exec info sharedlibrary             查看已加载的共享库
-exec info files                     查看加载的文件和段地址
-exec maintenance info sections      查看 ELF section 详细信息
```

#### 源码导航

```
-exec list                           显示当前位置附近源码
-exec list main.c:100                显示指定位置源码
-exec info source                    当前源文件信息
-exec info functions pattern         搜索函数名（支持正则）
-exec info variables pattern         搜索全局变量名
```

### 实用组合示例

**查看结构体指针链表**：
```
-exec p *head
-exec p *head->next
-exec p *head->next->next
```

**查看 QEMU 设备状态**（以 QEMU 调试为例）：
```
-exec p *cpu->env_ptr
-exec p/x cpu->env_ptr->regs[0]@16
-exec p machine->ram_size
```

**批量查看内存页表**：
```
-exec x/8xg page_table_base
-exec p/x *(uint64_t (*)[512])page_table_base
```

**调试时临时修改变量**：
```
-exec set var my_flag = 1
-exec set var *ptr = 0x1234
-exec set {int}0x7fff5000 = 42
```

---

## 故障排查

| 问题 | 解决方法 |
|------|---------|
| 断点显示 `○`（被拒绝） | 编译时未加 `-g`，或断点位置无可执行代码 |
| 变量显示 `<optimized out>` | 编译时未加 `-O0`，变量被优化 |
| GDB adapter 报错 | 系统 GDB 12.1 不支持原生 DAP，选 `cppdbg` 或 `codelldb` 配置项 |
| DAP UI 未自动打开 | 按 `<leader>du` 手动打开 |
| Mason 安装失败 | 执行 `:Mason` 查看状态，手动安装 `:MasonInstall codelldb` |
| 找不到可执行文件 | 确保输入的是编译产物的绝对或相对路径 |
