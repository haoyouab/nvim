# Gitsigns 详细使用指南

Gitsigns 在文件左侧显示 Git 状态（增/改/删），并提供按 hunk（变更块）级别的操作。

---

## 概念：什么是 hunk？

一段连续的修改区域。例如：

```diff
  line 1                    ← 未改
- line 2 old                ← hunk 1
+ line 2 new                ← hunk 1
  line 3                    ← 未改
- line 4                    ← hunk 2
- line 5                    ← hunk 2
+ line 4 new                ← hunk 2
```

这是 2 个 hunk。

---

## 1. 在 hunks 之间跳转

| 键 | 作用 |
|----|------|
| `]h` | 下一个 hunk |
| `[h` | 上一个 hunk |
| `]H` | 跳到最后一个 hunk |
| `[H` | 跳到第一个 hunk |

**例子：** 修改了一个文件的 10 处地方，想逐一 review：

- 文件开头按 `]h` → 跳到第 1 处修改
- 看完按 `]h` → 跳到第 2 处
- 不需要手动滚屏找 `+`/`-` 标记

---

## 2. Stage / Unstage hunk（部分提交）

| 键 | 作用 |
|----|------|
| `<leader>ghs` | Stage 当前 hunk |
| `<leader>ghu` | 撤销 stage |
| `<leader>ghS` | Stage 整个文件 |

**例子：** 一个文件改了两处，只想提交第一处：

```python
def foo():
    return 1 + 1    # 修改 1：bug 修复

def bar():
    print("debug")  # 修改 2：调试代码，不想提交
```

- 光标在 `return 1 + 1`，按 `<leader>ghs` → 这块进入暂存
- `git commit -m "fix foo"` 只会提交第一处
- 第二处仍在工作区

比 `git add -p` 在交互式界面里 y/n 直观得多。

---

## 3. Reset hunk（撤销修改）

| 键 | 作用 |
|----|------|
| `<leader>ghr` | 把当前 hunk 恢复成 HEAD 版本 |
| `<leader>ghR` | 撤销整个文件的所有修改 |

**例子：** 修改了 5 处，发现第 3 处改错了：

- `]h]h]h` 跳到第 3 个 hunk
- `<leader>ghr` → 第 3 处变回原样，其他修改保留

比 `git checkout HEAD -- file` 全部撤销好用。

---

## 4. Preview hunk（不跳转查看变化）

| 键 | 作用 |
|----|------|
| `<leader>ghp` | 在原地弹浮窗显示 diff |

**例子：** 想看某行修改前是什么样子：

- 光标放在修改的行上
- 按 `<leader>ghp`
- 浮窗显示 `- old line` / `+ new line`
- 按任意键关闭，无需打开 diff 视图

---

## 5. Blame（查看作者）

| 键 | 作用 |
|----|------|
| `<leader>ghb` | 显示当前行的提交信息浮窗 |
| `<leader>ghB` | 整个文件每行右侧显示 blame |

**例子：** 看到一段奇怪的代码，想知道是谁、为什么写的：

- 光标停在该行
- 按 `<leader>ghb`
- 弹出 `Zhibin Li, 3 months ago - fix: handle null case (#234)`
- 包含 commit hash，可以进一步查 PR

---

## 6. Diff this（对比版本）

| 键 | 作用 |
|----|------|
| `<leader>ghd` | 对比当前文件 vs HEAD（最近提交）|
| `<leader>ghD` | 对比 vs HEAD~1（再上一个提交）|

**例子：** 想看从上次提交后这个文件改了什么：

- 按 `<leader>ghd`
- 打开左右分屏 diff
- 左边是 HEAD 版本，右边是当前

---

## 7. `ih` — Hunk 文本对象

**用法：** 把 hunk 当成文本对象，配合 `d`/`y`/`v` 使用。

**例子：**

- `vih` → 选中整个 hunk
- `dih` → 删除整个 hunk 的修改
- `yih` → 复制整个 hunk

比手动 `V5j` 数行精确得多。

---

## 典型工作流示例

**场景：** 修改了 `auth.py`，包含 bug 修复 + 一些重构 + 调试代码，需要分别提交。

1. `]h` 走遍每个 hunk 看一遍
2. 在 bug 修复的 hunk 上按 `<leader>ghs`
3. `<leader>gg` 打开 lazygit，提交 "fix: auth bug"
4. 在重构的 hunk 上按 `<leader>ghs`
5. lazygit 中提交 "refactor: extract helper"
6. 调试代码 hunk 上按 `<leader>ghr` 撤销
7. 文件干净了

整个过程不离开 Neovim，不用 `git add -p` 数空格行。

---

## 快捷键速查

| 键 | 模式 | 描述 |
|----|------|------|
| `]h` / `[h` | n | 下一个/上一个 hunk |
| `]H` / `[H` | n | 最后/第一个 hunk |
| `<leader>ghs` | n/x | Stage hunk |
| `<leader>ghr` | n/x | Reset hunk |
| `<leader>ghS` | n | Stage 整个文件 |
| `<leader>ghu` | n | 撤销 stage hunk |
| `<leader>ghR` | n | Reset 整个文件 |
| `<leader>ghp` | n | 预览 hunk |
| `<leader>ghb` | n | Blame 当前行 |
| `<leader>ghB` | n | Blame 整个文件 |
| `<leader>ghd` | n | Diff vs HEAD |
| `<leader>ghD` | n | Diff vs HEAD~1 |
| `ih` | o/x | Hunk 文本对象 |
