# plan-with-obsidian

[English](README.md) | [简体中文](README.zh.md)

> 基于 Obsidian vault 的结构化规划 skill，适用于 Claude Code

为 Claude Code 提供智能的、基于 Obsidian 的规划能力。自动创建结构化的规划文档，并与你的 Obsidian vault 无缝集成，支持 wikilinks、properties、callouts 等特性。

## 特性

✨ **智能文件创建** - Claude Code 直接生成规划文档，无需脚本
📝 **Obsidian 集成** - 完整支持 wikilinks、properties、callouts、tags
🌍 **多语言支持** - 自动检测用户语言，生成对应语言的文档
📊 **上下文驱动** - 根据对话内容动态填充有意义的初始内容
🎯 **零空白原则** - 不生成空占位符，所有内容都有意义
🏗️ **5 阶段工作流** - 从需求调研到交付的结构化流程
🔍 **调研管理** - Findings 日志遵循 2-Action 规则
📈 **进度追踪** - 会话日志配合 5-Question 重启测试
⚡ **错误处理** - 3-Strike 协议系统化解决问题
🎨 **最佳实践** - 基于 Manus 规划模式构建

## 安装

### 选项 1: 下载 .skill 文件（推荐）

从 [Releases](../../releases) 下载 `plan-with-obsidian.skill` 并安装：

```bash
# 复制到 Claude Code skills 目录
cp plan-with-obsidian.skill ~/.claude/skills/

# 或解压到 skills 目录
unzip plan-with-obsidian.skill -d ~/.claude/skills/
```

### 选项 2: 克隆仓库

```bash
# 克隆并创建软链接
git clone https://github.com/0xEmberZz/plan-with-obsidian.git
ln -s "$(pwd)/plan-with-obsidian" ~/.claude/skills/
```

## 快速开始

### 1. 配置 Obsidian Vault 路径（可选）

在项目或全局的 `CLAUDE.md` 中添加：

```markdown
我的 obsidian 目录是 ~/ember's doc 写文档都放到这里
```

如果不配置，默认使用 `~/obsidian-vault`。

### 2. 触发 Skill

在 Claude Code 对话中：
- "使用 plan-with-obsidian skill"
- "用 Obsidian 规划这个任务"
- "创建 Obsidian 规划文件"

### 3. Claude 自动创建

Claude 会：
- 检测你的对话语言（中文/英文）
- 读取 Obsidian vault 路径
- 创建三个规划文件，内容有意义且完整

### 4. 在 Obsidian 中使用

打开 Obsidian，进入 `Planning/` 文件夹：
- 查看和编辑规划文档
- 使用 wikilinks 连接相关笔记
- 通过 properties 进行查询和过滤

## 创建的文件

```
~/ember's doc/Planning/
├── 任务标题 - Task Plan.md      # 主规划文档
├── 任务标题 - Findings.md       # 调研发现和技术决策
├── 任务标题 - Progress.md       # 会话记录和进度跟踪
└── 任务标题 - Overview.canvas   # 可视化概览（可选）
```

所有文件都包含：
- ✅ 有意义的初始内容（从对话上下文提取）
- ✅ 正确的语言（自动检测）
- ✅ 原始文件名（保留中文字符）
- ✅ 零空白占位符

## 核心理念

```
Context Window = RAM (易失的, 有限的)
Obsidian Vault = Disk (持久的, 无限的)

→ 任何重要的信息都写入 Obsidian
```

**为什么选择 Obsidian：**
- **Wikilinks**: 文档间自动链接和反向链接
- **Properties**: YAML frontmatter 用于查询和过滤
- **Graph View**: 可视化知识图谱
- **Callouts**: 强调关键信息
- **Tags**: 灵活的分类和检索

## 关键规则

### 规则 1: 规划优先
永远不要在没有创建规划文件的情况下开始复杂任务。不可协商。

### 规则 2: 2-Action 规则
> "每执行 2 次 view/browser/search 操作后，立即将关键发现保存到 Findings 文件"

这防止视觉/多模态信息丢失。

### 规则 3: 决策前先读取
在做重大决策前，读取计划文件。这让目标保持在注意力窗口中。

### 规则 4: 行动后更新
完成任何阶段后：
- 标记阶段状态：`in_progress` → `complete`
- 记录遇到的任何错误
- 注明创建/修改的文件

### 规则 5: 记录所有错误
每个错误都记录在计划文件中。这构建知识并防止重复。

### 规则 6: 永不重复失败
```python
if action_failed:
    next_action != same_action
```
跟踪尝试过的方法，改变方法。

### 规则 7: 语言一致
文档语言必须匹配用户对话语言。

### 规则 8: 零空白
根据对话上下文生成有意义的内容，不使用通用模板。

## 3-Strike 错误处理协议

```
尝试 1: 诊断并修复
  → 仔细阅读错误
  → 识别根本原因
  → 应用针对性修复

尝试 2: 替代方法
  → 同样的错误？尝试不同方法
  → 不同工具？不同库？
  → 永远不要重复完全相同的失败操作

尝试 3: 更广泛的重新思考
  → 质疑假设
  → 搜索解决方案
  → 考虑更新计划

3 次失败后：升级给用户
  → 解释尝试过的方法
  → 分享具体错误
  → 请求指导
```

## 读取 vs 写入决策矩阵

| 情况 | 操作 | 原因 |
|------|------|------|
| 刚写入文件 | 不读取 | 内容还在上下文中 |
| 查看了图像/PDF | 立即写入发现 | 多模态 → 文本（防丢失）|
| 浏览器返回数据 | 写入文件 | 截图不持久 |
| 开始新阶段 | 读取计划/发现 | 如果上下文陈旧需重新定向 |
| 发生错误 | 读取相关文件 | 需要当前状态来修复 |
| 间隔后恢复 | 读取所有规划文件 | 恢复状态 |

## 5-Question 重启测试

如果你能回答这些问题，你的上下文管理是可靠的：

| 问题 | 答案来源 |
|------|---------|
| 我在哪里？ | task_plan.md 中的当前阶段 |
| 我要去哪里？ | 剩余阶段 |
| 目标是什么？ | 计划中的目标声明 |
| 我学到了什么？ | findings.md |
| 我做了什么？ | progress.md |

## 核心流程

### 阶段 1: 需求调研
- 理解用户意图和目标
- 探索现有代码和功能
- 记录发现到 Findings

### 阶段 2: 方案设计
- 评估多个设计方案
- 做出技术决策
- 记录决策理由

### 阶段 3: 实施
- 按计划执行
- 增量测试
- 实时更新进度

### 阶段 4: 测试验证
- 验证需求满足
- 记录测试结果
- 修复问题

### 阶段 5: 交付
- 审查所有输出
- 确保完整性
- 交付给用户

## Obsidian 特性

### Wikilinks
```markdown
参见 [[任务标题 - Findings]] 了解详细调研
```
- 自动创建反向链接
- 点击跳转到相关笔记
- 知识图谱可视化连接

### Properties（属性）
```yaml
---
type: task-plan
status: in-progress
project: "项目名"
tags: [planning, active]
---
```
- 用于 Dataview 查询
- 过滤和聚合笔记
- 自定义视图

### Callouts（标注）
```markdown
> [!tip] 最佳实践
> 重读计划后再做重大决策

> [!bug] 错误记录
> 遇到的问题
```

### Tags（标签）
```markdown
#planning #active #frontend #api
```

### Canvas 可视化

Canvas 文件（`.canvas`）提供基于 JSON 的无限画布格式的项目可视化概览。

**优势：**
- 可视化工作流图，展示 5 阶段进展
- 点击文件节点直接打开规划文档
- 颜色编码的阶段状态，快速评估进度
- 无限画布，适合组织复杂项目

**结构：**
```
[项目标题节点]
    ↓
[阶段1] → [阶段2] → [阶段3] → [阶段4] → [阶段5]
    ↓        ↓        ↓
[Task Plan] [Findings] [Progress]
```

**颜色编码：**
- 🔴 红色（`"1"`）- 未开始 / 阻塞
- 🟠 橙色（`"2"`）- 需要注意
- 🟡 黄色（`"3"`）- 进行中
- 🟢 绿色（`"4"`）- 已完成
- 🔵 青色（`"5"`）- 参考文档
- 🟣 紫色（`"6"`）- 重要链接

**何时使用：**
- 复杂的多阶段项目
- 需要可视化概览的多会话工作
- 简单任务可选（优先创建 markdown 文件）

## 文件结构

```
plan-with-obsidian/
├── SKILL.md           # 核心 skill 定义
├── README.md          # 英文文档
├── README.zh.md       # 中文文档
└── LICENSE            # MIT 许可证
```

简洁明了 - 没有脚本，没有模板，只有 skill 定义。

## 示例

### 触发示例
- "我想用 Obsidian 规划一个新功能"
- "在我的 Obsidian vault 中创建规划文件"
- "用 Obsidian 规划：优化首页性能"

## 要求

- Claude Code（支持 skills）
- Obsidian（可选，但推荐使用以获得完整特性）

## 最佳实践

✅ **规划优先** - 复杂任务必须先创建规划文件
✅ **遵循 2-Action 规则** - 每 2 次操作后记录发现
✅ **更新属性** - 保持 frontmatter 最新
✅ **多用 wikilinks** - 连接所有相关笔记
✅ **记录所有错误** - 跟踪问题和解决方案
✅ **决策前先读取** - 重大决策前重读计划
✅ **永不重复失败** - 跟踪尝试，改变方法
✅ **语言一致** - 匹配用户对话语言
✅ **零空白占位符** - 根据上下文生成有意义内容

## 反模式

| 不要 | 应该这样 |
|------|---------|
| 使用 TodoWrite 持久化 | 创建 task_plan.md 文件 |
| 声明目标一次就忘记 | 决策前重读计划 |
| 隐藏错误并静默重试 | 记录错误到计划文件 |
| 将所有内容塞进上下文 | 存储大内容到文件 |
| 立即开始执行 | 先创建计划文件 |
| 重复失败的操作 | 跟踪尝试，改变方法 |
| 生成空白模板 | 根据上下文生成有意义内容 |
| 使用通用模板语言 | 匹配用户对话语言 |

## 对比

| 特性 | plan-with-obsidian | planning-with-files |
|------|-------------------|---------------------|
| 位置 | Obsidian vault | 项目目录 |
| 格式 | Obsidian Markdown | 基础 Markdown |
| Properties | ✅ 是 | ❌ 否 |
| Wikilinks | ✅ 是 | ❌ 否 |
| Callouts | ✅ 是 | ❌ 否 |
| Tags | ✅ 是 | ❌ 否 |
| 知识图谱 | ✅ 是 | ❌ 否 |
| 移动端 | ✅ Obsidian mobile | ❌ 否 |

## v2.0 新特性

此版本移除了 shell 脚本依赖，使用 Claude Code 的原生工具：

- ✅ **无需脚本** - Claude 直接创建文件
- ✅ **多语言支持** - 自动检测中文/英文
- ✅ **保留文件名** - 保持原始字符（包括中文）
- ✅ **上下文驱动** - 生成有意义的初始内容
- ✅ **零空白占位符** - 每个字段都有实际内容
- ✅ **简化结构** - 移除 scripts/、templates/、references/

## 常见问题

**文件名显示为破折号（`---`）？**
- 确保使用 v2.0。旧版本有文件名 bug。

**文档是空白的？**
- 确保使用 v2.0。新版本根据上下文生成内容。

**语言不对？**
- 检查你的对话语言。文档会匹配你的消息语言。

**Wikilinks 不工作？**
- 确保文件在正确的 Obsidian vault 路径中
- 使用格式：`[[文件名]]`（不要 .md 扩展名）

## 贡献

欢迎提交 Issues 和 Pull Requests！
- 报告 bug
- 建议新特性
- 改进文档
- 分享使用案例

## 许可证

MIT License - 自由使用、修改和分发。

## 作者

Created by [0xEmberZz](https://github.com/0xEmberZz)

## 相关 Skills

- `obsidian-markdown` - Obsidian Flavored Markdown 语法参考
- `json-canvas` - JSON Canvas 文件创建和编辑
- `obsidian-bases` - Obsidian Bases 数据库视图

## 致谢

为 Claude Code skills 系统构建。灵感来自 Manus 规划模式和 Obsidian 强大的链接特性。

---

**为 Claude Code 和 Obsidian 用户精心打造 ❤️**
