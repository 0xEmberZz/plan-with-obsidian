# plan-with-obsidian

[English](README.md) | [简体中文](README.zh.md)

> Structured planning with Obsidian vault integration for Claude Code

Create planning documents directly in your Obsidian vault with wikilinks, properties, callouts, and Canvas visualization.

## Features

✨ **Smart File Creation** - Claude Code generates planning docs directly, no scripts needed
📝 **Obsidian Integration** - Full support for wikilinks, properties, callouts, tags
🌍 **Multi-language** - Auto-detects user language (Chinese/English)
📊 **Context-Driven** - Generates meaningful content from your conversation
🎯 **Zero Placeholders** - No empty templates, all content is meaningful
🏗️ **5-Phase Workflow** - Structured approach from research to delivery
🎨 **Canvas Visualization** - Optional visual project overview

## Installation

### Option 1: Clone Repository (Recommended)

```bash
# Clone and symlink
git clone https://github.com/0xEmberZz/plan-with-obsidian.git
ln -s "$(pwd)/plan-with-obsidian" ~/.claude/skills/
```

### Option 2: Download .skill File

Download `plan-with-obsidian.skill` from [Releases](../../releases) and install:

```bash
# Copy to Claude Code skills directory
cp plan-with-obsidian.skill ~/.claude/skills/

# Or unzip to skills directory
unzip plan-with-obsidian.skill -d ~/.claude/skills/
```

## Quick Start

1. **Configure Obsidian vault path** (optional) in your `CLAUDE.md`:
   ```markdown
   My Obsidian directory is ~/my-vault
   ```

2. **Trigger the skill** in Claude Code:
   - "plan with Obsidian"
   - "create Obsidian planning files"
   - "use my Obsidian vault for planning"

3. **Claude will automatically**:
   - Detect your conversation language
   - Read your vault path from CLAUDE.md
   - Create planning files with meaningful initial content

4. **Open in Obsidian** and start working:
   - Edit task plan and phases
   - Log findings as you research
   - Track progress in each session
   - View Canvas for visual overview (optional)

## What Gets Created

```
~/my-vault/Planning/
├── My Project - Task Plan.md      # Main planning document
├── My Project - Findings.md       # Research and decisions log
├── My Project - Progress.md       # Session tracking
└── My Project - Overview.canvas   # Visual overview (optional)
```

All files include:
- ✅ Meaningful initial content from your conversation
- ✅ Proper language (auto-detected)
- ✅ Original filename (preserves non-ASCII characters)
- ✅ No empty placeholders

## Requirements

- Claude Code with skills support
- Obsidian (optional, but recommended for full features)

## Best Practices

✅ **Plan before coding** - Create planning files for complex tasks
✅ **Update findings regularly** - Log discoveries every 2 operations
✅ **Use wikilinks** - Connect related notes
✅ **Track all errors** - Document problems and solutions
✅ **Read before deciding** - Re-read plan before major decisions

## Troubleshooting

**Filenames appear as dashes (`---`)?**
- Ensure you're using v2.0+. Old version had a filename bug.

**Documents are empty?**
- Ensure you're using v2.0+. New version generates content from context.

**Wrong language?**
- Check your conversation language. Documents match your messages.

**Wikilinks don't work?**
- Ensure files are in correct Obsidian vault path

## What's New in v2.0

- ✅ **No more scripts** - Claude creates files directly with Write tool
- ✅ **Multi-language** - Auto-detects Chinese/English from conversation
- ✅ **Preserved filenames** - Keeps original characters (including Chinese)
- ✅ **Context-driven** - Generates meaningful content, not generic templates
- ✅ **Zero placeholders** - Every field has actual content
- ✅ **Enriched patterns** - Added Manus planning methodology best practices
- ✅ **Canvas support** - Optional visual project overview

## Contributing

Issues and pull requests are welcome! Feel free to:
- Report bugs
- Suggest features
- Improve documentation
- Share usage examples

## License

MIT License - Feel free to use, modify, and distribute.

## Author

Created by [0xEmberZz](https://github.com/0xEmberZz)

## Acknowledgments

Built for Claude Code skills system. Inspired by Manus planning pattern and Obsidian's powerful linking features.

Special thanks to [kepano/obsidian-skills](https://github.com/kepano/obsidian-skills) for Obsidian skill patterns and inspiration.

---

**Made with ❤️ for Claude Code and Obsidian users**
