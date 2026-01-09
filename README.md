# plan-with-obsidian

> Persistent planning with Obsidian vault integration for Claude Code

A Claude Code skill that enables structured, file-based planning using Obsidian-flavored markdown. Automatically creates planning documents, tracks progress, and provides visual Canvas overviews—all integrated with your Obsidian vault.

## Features

✨ **Automatic Planning Setup** - One command creates complete planning structure
📝 **Obsidian Integration** - Uses wikilinks, properties, callouts, and tags
🎨 **Visual Canvas** - Automatic project overview with phase tracking
📊 **Progress Tracking** - Session logs with 5-question reboot checks
🔍 **Research Management** - Findings log with 2-action rule
🏗️ **5-Phase Workflow** - Structured approach from planning to completion

## Installation

### Option 1: Download .skill File (Recommended)

Download `plan-with-obsidian.skill` from [Releases](../../releases) and install:

```bash
# Copy to Claude Code skills directory
cp plan-with-obsidian.skill ~/.claude/skills/

# Or unzip to skills directory
unzip plan-with-obsidian.skill -d ~/.claude/skills/
```

### Option 2: Clone Repository

```bash
# Clone and symlink
git clone https://github.com/0xEmberZz/plan-with-obsidian.git
ln -s "$(pwd)/plan-with-obsidian" ~/.claude/skills/
```

## Quick Start

1. **Trigger the skill** in Claude Code:
   - "plan with Obsidian"
   - "create Obsidian planning files"
   - "use my Obsidian vault for planning"

2. **Initialize planning files**:
   ```bash
   scripts/init_obsidian_plan.sh "My Project"
   ```

3. **Open in Obsidian** and customize:
   - Edit `My Project - Task Plan.md`
   - Update phases and tasks
   - View `My Project - Overview.canvas` for visual overview

## What Gets Created

Running the initialization script creates:

```
./obsidian-plan/Planning/
├── My Project - Task Plan.md      # Main planning document
├── My Project - Findings.md       # Research and decisions log
├── My Project - Progress.md       # Session tracking
└── My Project - Overview.canvas   # Visual project overview
```

## Core Workflow

### 1. Plan Phase
- Define project goals and success metrics
- Break work into 5 phases
- Set up task checklists

### 2. Research Phase (The 2-Action Rule)
- After every 2 view/browser/search operations
- Immediately save findings to `Findings.md`
- Document key decisions and rationales

### 3. Execute Phase
- Follow task plan phase by phase
- Update progress after each session
- Log errors in error table

### 4. Review Phase
- Use Canvas for visual progress tracking
- Update phase status and colors
- Link related notes with wikilinks

## Obsidian Features

### Properties (Frontmatter)
```yaml
---
type: task-plan
status: in-progress
project: "My Project"
tags: [planning, active]
---
```

### Wikilinks
```markdown
See [[My Project - Findings]] for research
Track progress in [[My Project - Progress]]
```

### Callouts
```markdown
> [!tip] Best Practice
> Re-read plan before major decisions

> [!bug] Error Log
> Track all errors here
```

### Canvas Visualization
- Visual project structure with 4 layers
- Phase flow diagram (Phase 1 → Phase 2 → ... → Phase 5)
- Planning document links (click to open)
- Current status tracking

## File Structure

```
plan-with-obsidian/
├── SKILL.md                    # Core skill instructions
├── scripts/
│   └── init_obsidian_plan.sh   # Planning setup script
├── templates/
│   ├── task_plan.md            # Task planning template
│   ├── findings.md             # Research findings template
│   ├── progress.md             # Progress tracking template
│   └── overview_canvas.json    # Canvas visualization template
└── references/
    ├── obsidian-patterns.md    # Obsidian features guide
    └── canvas-guide.md         # Canvas customization guide
```

## Documentation

- **[Obsidian Patterns Guide](references/obsidian-patterns.md)** - Complete guide to using Obsidian features for planning
- **[Canvas Guide](references/canvas-guide.md)** - Comprehensive Canvas customization and usage

## Examples

### Trigger Examples
- "I want to plan a new feature using Obsidian"
- "Create planning files in my Obsidian vault"
- "Set up project planning with Obsidian"

### Customization Examples
See [Canvas Guide](references/canvas-guide.md) for:
- Adding custom nodes
- Adjusting layout
- Creating decision trees
- Embedding diagrams

## Requirements

- Claude Code with skills support
- Obsidian (optional, but recommended for full features)
- Bash (for initialization script)

## Best Practices

✅ **Create plan first** - Never start complex tasks without planning files
✅ **Follow the 2-Action Rule** - Log findings every 2 operations
✅ **Update properties** - Keep frontmatter current
✅ **Use wikilinks generously** - Connect all related notes
✅ **Log all errors** - Track problems and solutions
✅ **Review Canvas regularly** - Use visual overview for progress tracking

## Comparison

| Feature | plan-with-obsidian | planning-with-files |
|---------|-------------------|---------------------|
| Location | Obsidian vault | Project directory |
| Format | Obsidian Markdown | Basic Markdown |
| Properties | ✅ Yes | ❌ No |
| Wikilinks | ✅ Yes | ❌ No |
| Callouts | ✅ Yes | ❌ No |
| Tags | ✅ Yes | ❌ No |
| Canvas | ✅ Automatic | ❌ No |
| Graph View | ✅ Yes | ❌ No |
| Mobile | ✅ Obsidian mobile | ❌ No |

## Troubleshooting

**Script fails:**
- Check vault path (default: `./obsidian-plan`)
- Ensure Planning folder can be created
- Verify file permissions

**Wikilinks don't work:**
- Ensure files are in Obsidian vault
- Use format: `[[File Name]]` (no .md extension)

**Canvas files don't open:**
- Use relative paths: `Planning/My Project - Task Plan.md`
- Don't include leading `/` or `./`

## Contributing

Issues and pull requests are welcome! Please feel free to:
- Report bugs
- Suggest features
- Improve documentation
- Share usage examples

## License

MIT License - Feel free to use, modify, and distribute this skill.

## Author

Created by [0xEmberZz](https://github.com/0xEmberZz)

## Related Skills

- `obsidian-markdown` - Obsidian Flavored Markdown syntax reference
- `json-canvas` - JSON Canvas file creation and editing
- `obsidian-bases` - Obsidian Bases database views

## Acknowledgments

Built for Claude Code skills system. Inspired by Manus planning pattern and Obsidian's powerful linking features.

---

**Made with ❤️ for Claude Code and Obsidian users**
