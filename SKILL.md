---
name: plan-with-obsidian
description: Use when user mentions Obsidian planning, wants structured planning in their Obsidian vault, or requests planning files with Obsidian features (wikilinks, properties, Canvas). Creates task_plan.md, findings.md, progress.md, and optional Canvas visualization for complex multi-step tasks requiring >5 tool calls.
---

# Plan with Obsidian

在 Obsidian vault 中创建持久化规划文档，像 Manus 一样工作：将规划存储到磁盘上的 markdown 文件。

## 核心理念

```
Context Window = RAM (易失的, 有限的)
Obsidian Vault = Disk (持久的, 无限的)

→ 任何重要的信息都写入 Obsidian
```

**Obsidian 优势：**
- **Wikilinks**: 文档间自动链接和反向链接
- **Properties**: YAML frontmatter 用于查询和过滤
- **Graph View**: 可视化知识图谱
- **Callouts**: 强调关键信息
- **Tags**: 灵活的分类和检索

## 何时使用

**使用此 skill：**
- 复杂多步骤任务（3+ 步骤）
- 研究项目
- 需要 >5 次工具调用的任务
- 用户想使用 Obsidian 特性
- 需要在多个会话间持久化的规划

**不使用此 skill：**
- 简单问题
- 单文件编辑
- 快速查询
- 用户不使用 Obsidian

## 快速开始

在开始任何复杂任务前：

1. **检测语言和路径**
2. **创建三个核心文件** (用 Write 工具直接写入)
3. **在工作时定期更新文件**
4. **在决策前重读计划**

## 文件用途

| 文件 | 用途 | 何时更新 |
|------|------|---------|
| `Task Plan.md` | 阶段规划、进度、决策 | 每个阶段后 |
| `Findings.md` | 调研发现、技术决策 | 任何发现后 |
| `Progress.md` | 会话日志、测试结果 | 整个会话期间 |

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

```markdown
## 错误记录
| 错误 | 尝试 | 解决方案 | 影响 |
|------|------|----------|------|
| FileNotFoundError | 1 | 创建默认配置 | 无 |
| API 超时 | 2 | 添加重试逻辑 | 轻微 |
```

### 规则 6: 永不重复失败
```python
if action_failed:
    next_action != same_action
```
跟踪尝试过的方法，改变方法。

### 规则 7: 语言一致
文档语言必须匹配用户对话语言。

### 规则 8: 零空白
不生成空的列表项、空表格行、空占位符。根据对话上下文生成有意义的内容。

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

## 实施步骤

### 1. 检测语言和 Vault 路径

```typescript
// 从对话消息中识别语言
const userLanguage = detectLanguageFromMessages() // 'zh' | 'en'

// 读取用户的 CLAUDE.md 获取 Obsidian vault 路径
// 如果未配置，使用默认值
const vaultPath = userClaudeMd.obsidianVault || "~/obsidian-vault"
const taskTitle = extractTaskTitleFromConversation()
```

### 2. 直接创建文件（不使用脚本）

使用 **Write 工具**创建三个核心文件：

```markdown
{vaultPath}/Planning/
  ├── {任务标题} - Task Plan.md
  ├── {任务标题} - Findings.md
  └── {任务标题} - Progress.md
```

**关键原则：**
- ✅ 保留原始任务标题（包括中文、特殊字符）
- ✅ 文档语言 = 用户对话语言
- ✅ 根据对话上下文填充初始内容
- ✅ 零空白 - 不生成空占位符

### 3. Task Plan 文件结构

**中文示例：**
```markdown
---
type: task-plan
created: 2026-01-09
status: in-progress
project: "{任务标题}"
tags: [planning, active]
related:
  - "[[{任务标题} - Findings]]"
  - "[[{任务标题} - Progress]]"
---

# {任务标题} - 任务规划

## 目标

{从对话中提取的 1-2 句话目标描述}

## 当前阶段

Phase 1: {阶段名称}

## 阶段

### Phase 1: 需求调研
- [ ] {从对话推断的具体任务}
- [ ] 记录发现到 [[{任务标题} - Findings]]
- **Status:** in_progress
- **Started:** {时间}

### Phase 2: 方案设计
- [ ] {具体步骤}
- **Status:** pending

### Phase 3: 实施
- [ ] {具体步骤}
- **Status:** pending

### Phase 4: 测试验证
- [ ] {具体步骤}
- **Status:** pending

### Phase 5: 交付
- [ ] {具体步骤}
- **Status:** pending

## 关键问题

> [!question] 待解决的问题
> 1. {从对话推断的关键问题}

## 关键决策

| 决策 | 理由 | 时间 |
|------|------|------|
| {如果对话中已有决策，记录} | {理由} | {时间} |

## 错误记录

> [!bug] 错误日志
> 记录所有错误以避免重复

| 错误 | 尝试 | 解决方案 | 影响 |
|------|------|----------|------|
| -    | -    | -        | -    |

## 相关笔记

- [[{任务标题} - Findings]] - 调研发现和设计方案
- [[{任务标题} - Progress]] - 实施进度和测试结果
```

**英文示例：**
```markdown
---
type: task-plan
created: 2026-01-09
status: in-progress
project: "{Task Title}"
tags: [planning, active]
---

# {Task Title} - Task Plan

## Goal

{1-2 sentence goal from conversation}

## Current Phase

Phase 1: {Phase Name}

## Phases

### Phase 1: Requirements & Discovery
- [ ] {Specific task from conversation}
- [ ] Record findings to [[{Task Title} - Findings]]
- **Status:** in_progress
- **Started:** {timestamp}

{... other phases}

## Key Questions

> [!question] Questions to Resolve
> 1. {Key questions from conversation}

## Key Decisions

| Decision | Rationale | When |
|----------|-----------|------|
| {If any decisions in conversation} | {Why} | {timestamp} |

## Error Log

> [!bug] Error Tracking
> Record all errors to avoid repetition

| Error | Attempt | Solution | Impact |
|-------|---------|----------|--------|
| -     | -       | -        | -      |
```

### 4. Findings 文件结构

**动态生成，不要空白：**

```markdown
---
type: findings
created: 2026-01-09
project: "{任务标题}"
tags: [research, findings]
related:
  - "[[{任务标题} - Task Plan]]"
---

# {任务标题} - 调研发现

> [!info] 关于本文档
> 记录调研发现、技术决策和重要发现。每执行 2 次 view/browser/search 操作后更新。

## 发现 1: {具体发现标题} (时间)

### {子标题}
{具体内容 - 从实际调研中提取，不留空}

### 下一步行动
- {基于发现推断的下一步}

---

*记得：每 2 次操作后更新此文档*
```

**关键：**
- 初始只创建框架和第一个发现（如果已经有调研）
- 后续通过 **追加内容** 而非替换整个文件
- 每个发现都有时间戳

### 5. Progress 文件结构

```markdown
---
type: progress-log
created: 2026-01-09
project: "{任务标题}"
tags: [progress, session-log]
related:
  - "[[{任务标题} - Task Plan]]"
---

# {任务标题} - 进度记录

> [!info] 会话追踪
> 记录每次工作会话的行动、文件修改和测试结果

## 会话 1: {简短描述} (时间)

### 完成的工作
- {已完成的具体事项}

### 当前状态
- **阶段**: Phase X
- **状态**: {状态}

### 下一步
- {待办事项}

---

*记录每个会话的进展*
```

### 6. Canvas 可视化（可选但推荐）

**Canvas 文件用途：**
- 可视化项目结构和 5 阶段流程
- 链接到所有规划文档（Task Plan、Findings、Progress）
- 显示当前阶段状态和进度
- 提供项目概览的视觉导航

**创建 Canvas 文件：**

```typescript
Write({
  file_path: `${vaultPath}/Planning/${taskTitle} - Overview.canvas`,
  content: JSON.stringify({
    "nodes": [
      // 顶层标题
      {
        "id": generateId(),
        "type": "text",
        "x": 200,
        "y": -100,
        "width": 600,
        "height": 100,
        "text": `# ${taskTitle}\n\n项目规划概览`,
        "color": "5"
      },
      // Phase 1 到 Phase 5（横向排列）
      {
        "id": "phase1",
        "type": "text",
        "x": 0,
        "y": 50,
        "width": 180,
        "height": 150,
        "text": "## Phase 1\n需求调研\n\n**状态**: in_progress",
        "color": "3" // 黄色 = 进行中
      },
      {
        "id": "phase2",
        "type": "text",
        "x": 200,
        "y": 50,
        "width": 180,
        "height": 150,
        "text": "## Phase 2\n方案设计\n\n**状态**: pending",
        "color": "1" // 灰色 = 待开始
      },
      // ... Phase 3, 4, 5 类似

      // 底部：链接到规划文档
      {
        "id": "taskplan",
        "type": "file",
        "x": 0,
        "y": 250,
        "width": 250,
        "height": 100,
        "file": `Planning/${taskTitle} - Task Plan.md`
      },
      {
        "id": "findings",
        "type": "file",
        "x": 270,
        "y": 250,
        "width": 250,
        "height": 100,
        "file": `Planning/${taskTitle} - Findings.md`
      },
      {
        "id": "progress",
        "type": "file",
        "x": 540,
        "y": 250,
        "width": 250,
        "height": 100,
        "file": `Planning/${taskTitle} - Progress.md`
      }
    ],
    "edges": [
      // Phase 之间的连接（流程箭头）
      {
        "id": generateId(),
        "fromNode": "phase1",
        "fromSide": "right",
        "toNode": "phase2",
        "toSide": "left"
      }
      // ... 其他连接
    ]
  }, null, 2)
})
```

**Canvas 更新策略：**
- 初始创建时设置基本结构
- 每个阶段完成后，更新对应节点的颜色和状态：
  - `"1"` (红色) = 未开始
  - `"3"` (黄色) = 进行中
  - `"4"` (绿色) = 已完成
- 不需要每次都重新生成整个文件，可以读取后更新特定节点

**Canvas 颜色编码：**
```markdown
| 颜色 | 状态 | Preset |
|------|------|--------|
| 红色 | 未开始/阻塞 | "1" |
| 橙色 | 需要注意 | "2" |
| 黄色 | 进行中 | "3" |
| 绿色 | 已完成 | "4" |
| 青色 | 参考文档 | "5" |
| 紫色 | 重要链接 | "6" |
```

**简化创建（可选）：**
- 如果任务较简单，可以不创建 Canvas
- Canvas 主要用于复杂项目和多会话跟踪
- 优先创建三个核心 markdown 文件

## Obsidian 特性使用

### Wikilinks（内部链接）
```markdown
参见 [[{任务标题} - Findings]] 了解详细调研
链接到 [[其他笔记]]
```
- 自动创建反向链接
- Cmd/Ctrl + 点击跳转
- 知识图谱可视化连接

### Properties（YAML Frontmatter）
```yaml
---
type: task-plan | findings | progress-log
status: in-progress | pending | complete
project: "项目名"
tags: [planning, active]
related: ["[[Other Note]]"]
---
```
用于 Dataview 查询和过滤。

### Callouts（标注块）
```markdown
> [!tip] 最佳实践
> 重读计划后再做重大决策

> [!bug] 错误记录
> 遇到的问题

> [!question] 待解决的问题
> 需要回答的问题

> [!warning] 注意
> 关键风险点
```

常用类型：`tip`, `warning`, `bug`, `question`, `info`, `success`, `failure`

### Tags（标签）
```markdown
#planning #active #frontend #api
```
用于 Dataview 查询和跨笔记过滤。

## 文件操作技巧

### 追加内容（推荐）
```typescript
// 使用 Edit 工具或读取后写入
Read("Findings.md")
// 在内容末尾追加
Write("Findings.md", existingContent + newContent)
```

### Obsidian vault 路径处理
```bash
# 如果路径包含空格，Write 工具自动处理
Write({
  file_path: `${HOME}/My Vault/Planning/file.md`,
  content: "..."
})
```

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

## 常见错误

| 错误 | 原因 | 解决 |
|------|------|------|
| 文件名变成 `-----` | sh脚本替换非ASCII字符 | 直接用Write工具，保留原标题 |
| 文档全是空白 | 使用通用模板 | 根据对话上下文生成内容 |
| 语言不匹配 | 未检测用户语言 | 从对话消息中识别语言 |
| Wikilinks 不工作 | 文件不在 vault 中 | 确认文件在正确的 vault 路径 |
| Properties 不显示 | YAML 格式错误 | 检查 `---` 前后，只用空格 |

## 完整示例流程

**用户消息：** "使用 plan-with-obsidian skill，我想优化首页加载性能"

**你的操作：**

1. **检测语言和路径**
```typescript
language = 'zh'  // 从消息识别
vaultPath = '~/ember\'s doc'  // 从 CLAUDE.md 读取
taskTitle = '优化首页加载性能'
```

2. **创建 Task Plan**
```typescript
Write({
  file_path: `${vaultPath}/Planning/${taskTitle} - Task Plan.md`,
  content: generateTaskPlanContent(taskTitle, language, conversation)
})
```

3. **创建 Findings（有初始内容）**
4. **创建 Progress**
5. **开始工作，定期更新**
   - 每 2 次调研操作后更新 Findings
   - 每个阶段后更新 Task Plan
   - 每个会话结束时更新 Progress

---

*基于 Manus 规划模式，适配 Obsidian 功能*
