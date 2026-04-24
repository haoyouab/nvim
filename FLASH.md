# Flash.nvim 详细使用指南

Flash.nvim 是一个增强跳转插件，让你在屏幕内快速移动光标、选择文本、操作远程位置。

---

## 1. `s` — Flash Jump（字符跳转）

**用法：** 普通模式按 `s`，输入 1-2 个字符，Flash 会在所有匹配位置显示标签字母，按对应字母跳转。

**例子：** 当前文件中有多处 `function`：

```lua
local function foo()
  local function bar()
    return function() end
  end
end
```

- 光标在第一行，按 `s`
- 输入 `fu`
- 每个 `function` 旁会出现标签如 `a`、`s`、`d`
- 按 `d` 直接跳到第三个 `function`

相比 `/function` 然后 `n` 翻页，这是一步到位。

---

## 2. `S` — Flash Treesitter（语法节点选择）

**用法：** 普通模式按 `S`，Flash 会高亮所有 Treesitter 节点（函数、变量、表达式等），按标签选中整个节点。

**例子：** 选中一整个函数：

```lua
local result = calculate(x + y, foo(bar))
```

- 光标在 `bar` 上，按 `S`
- 屏幕上所有可能的语法节点都打上标签
- 按 `bar` 对应的标签 → 选中 `bar`
- 再按对应标签 → 扩展到 `foo(bar)`
- 再按 → 扩展到整行参数列表

适合代替反复 `vi(`、`va{`、`vif`。

---

## 3. `r` — Remote Flash（远程操作）

**用法：** 在 operator-pending 模式（按了 `y`/`d`/`c` 之后）按 `r`，跳到远处操作文本，**操作完自动跳回原位**。

**例子：** 在第 100 行编辑代码，想复制第 5 行的一个单词：

```lua
local config = "production"  -- 第 5 行
-- ...
local mode =                 -- 第 100 行（光标在这）
```

- 光标在第 100 行 `=` 后
- 按 `yr`
- 屏幕所有位置出现标签
- 按 `production` 旁边的标签
- 进入跳转后按 `iw` 选中单词
- 自动跳回第 100 行
- 按 `p` 粘贴 → `local mode = production`

不用 `m`a 标记 + 跳过去 + yank + 跳回来 + 粘贴。

---

## 4. `R` — Treesitter Search（远程语法节点）

**用法：** Visual 模式或 operator 模式按 `R`，远程选中 Treesitter 节点。

**例子：** 想删除文件另一处的整个函数：

- 普通模式按 `d`
- 按 `R`
- 选中远处一个函数节点
- 整个函数被删除，光标回到原位

---

## 5. `<C-s>` — 命令行搜索内的 Flash

**用法：** `/` 搜索时按 `<C-s>`，把搜索结果转成 Flash 标签模式。

**例子：**

- 按 `/error` 找到很多匹配
- 按 `<C-s>`，每个匹配点出现标签
- 按标签直接跳到目标，不用 `n` 翻

---

## 6. `f/F/t/T` — 增强行内跳转

**用法：** 默认 `f x` 只能跳到本行第一个 `x`，按 `;` 才能继续。Flash 让所有 `x` 都打标签。

**例子：**

```
foo.bar.baz.qux
```

- 光标在 `foo`，按 `f.`
- 三个 `.` 旁出现标签 `a`、`s`、`d`
- 按 `d` 直接跳到 `qux` 前的 `.`

---

## 快捷键速查

| 键 | 模式 | 描述 |
|----|------|------|
| `s` | n/x/o | Flash jump: 输入 2 字符，按标签跳转 |
| `S` | n/o/x | Flash Treesitter: 按标签选择语法节点 |
| `r` | o | Remote flash: 远程操作文本后自动跳回 |
| `R` | o/x | Treesitter search: 远程选中语法节点 |
| `<C-s>` | c | 命令行搜索中切换 Flash 标签模式 |
| `f/F/t/T` | n | 增强行内跳转，多匹配显示标签 |
