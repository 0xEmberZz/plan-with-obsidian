# plan-with-obsidian

[English](README.md) | [简体中文](README.zh.md)

> 基于 Obsidian vault 的结构化规划 skill，适用于 Claude Code

在 Obsidian vault 中直接创建规划文档，支持 wikilinks、properties、callouts 和 Canvas 可视化。

## 特性

✨ **智能文件创建** - Claude Code 直接生成规划文档，无需脚本
📝 **Obsidian 集成** - 完整支持 wikilinks、properties、callouts、tags
🌍 **多语言支持** - 自动检测用户语言（中文/英文）
📊 **上下文驱动** - 根据对话内容生成有意义的内容
🎯 **零空白原则** - 不生成空占位符，所有内容都有意义
🏗️ **5 阶段工作流** - 从需求调研到交付的结构化流程
🎨 **Canvas 可视化** - 可选的可视化项目概览

## 安装

### 选项 1: 克隆仓库（推荐）

```bash
# 克隆并创建软链接
git clone https://github.com/0xEmberZz/plan-with-obsidian.git
ln -s "$(pwd)/plan-with-obsidian" ~/.claude/skills/
```

### 选项 2: 下载 .skill 文件

从 [Releases](../../releases) 下载 `plan-with-obsidian.skill` 并安装：

```bash
# 复制到 Claude Code skills 目录
cp plan-with-obsidian.skill ~/.claude/skills/

# 或解压到 skills 目录
unzip plan-with-obsidian.skill -d ~/.claude/skills/
```

## 快速开始

1. **配置 Obsidian Vault 路径**（可选）在你的 `CLAUDE.md` 中添加：
   ```markdown
   我的 obsidian 目录是 ~/obsidian-vault
   ```

2. **触发 Skill** 在 Claude Code 对话中：
   - "使用 plan-with-obsidian skill"
   - "用 Obsidian 规划这个任务"
   - "创建 Obsidian 规划文件"

3. **Claude 自动创建**：
   - 检测你的对话语言（中文/英文）
   - 读取 Obsidian vault 路径
   - 创建有意义的规划文件

4. **在 Obsidian 中使用**：
   - 编辑任务计划和阶段
   - 记录调研发现
   - 跟踪每个会话的进度
   - 查看 Canvas 可视化概览（可选）

## 创建的文件

```
~/obsidian-vault/Planning/
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

## 要求

- Claude Code（支持 skills）
- Obsidian（可选，但推荐使用以获得完整特性）

## 最佳实践

✅ **编码前先规划** - 复杂任务先创建规划文件
✅ **定期更新发现** - 每 2 次操作后记录发现
✅ **多用 wikilinks** - 连接相关笔记
✅ **记录所有错误** - 记录问题和解决方案
✅ **决策前先读取** - 重大决策前重读计划

## 常见问题

**文件名显示为破折号（`---`）？**
- 确保使用 v2.0+。旧版本有文件名 bug。

**文档是空白的？**
- 确保使用 v2.0+。新版本根据上下文生成内容。

**语言不对？**
- 检查你的对话语言。文档会匹配你的消息语言。

**Wikilinks 不工作？**
- 确保文件在正确的 Obsidian vault 路径中

## v2.0 新特性

- ✅ **无需脚本** - Claude 使用 Write 工具直接创建文件
- ✅ **多语言支持** - 自动检测对话中的中文/英文
- ✅ **保留文件名** - 保持原始字符（包括中文）
- ✅ **上下文驱动** - 生成有意义的内容，而非通用模板
- ✅ **零空白占位符** - 每个字段都有实际内容
- ✅ **丰富的模式** - 添加 Manus 规划方法的最佳实践
- ✅ **Canvas 支持** - 可选的可视化项目概览

## 贡献

欢迎提交 Issues 和 Pull Requests！请随时：
- 报告 bug
- 建议新特性
- 改进文档
- 分享使用案例

## 许可证

MIT License - 自由使用、修改和分发。

## 作者

Created by [0xEmberZz](https://github.com/0xEmberZz)

## 致谢

为 Claude Code skills 系统构建。灵感来自 Manus 规划模式和 Obsidian 强大的链接特性。

特别感谢 [kepano/obsidian-skills](https://github.com/kepano/obsidian-skills) 提供的 Obsidian skill 模式和灵感。

---

**为 Claude Code 和 Obsidian 用户精心打造 ❤️**
