# plan-with-obsidian

[English](README.md) | [简体中文](README.zh.md)

> Persistent planning with Obsidian vault integration for Claude Code

A Claude Code skill that enables structured, file-based planning using Obsidian-flavored markdown. Automatically creates planning documents, tracks progress, and provides visual Canvas overviews—all integrated with your Obsidian vault.

## Features

✨ **Smart File Creation** - Claude Code directly generates planning docs, no scripts needed
📝 **Obsidian Integration** - Full support for wikilinks, properties, callouts, tags
🌍 **Multi-language** - Auto-detects user language, generates matching docs
📊 **Context-Driven** - Generates meaningful initial content from conversation
🎯 **Zero Placeholders** - No empty templates, all content is meaningful
🏗️ **5-Phase Workflow** - Structured approach from research to delivery
🔍 **Research Management** - Findings log with 2-action rule
📈 **Progress Tracking** - Session logs with 5-question reboot test
⚡ **Error Handling** - 3-strike protocol for systematic problem solving
🎨 **Best Practices** - Built on Manus planning pattern principles

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

4. **Open in Obsidian** and customize:
   - Edit `My Project - Task Plan.md`
   - Update phases and tasks
   - Use wikilinks to connect related notes

## What Gets Created

Claude creates planning files in your Obsidian vault:

```
~/my-vault/Planning/
├── My Project - Task Plan.md      # Main planning document
├── My Project - Findings.md       # Research and decisions log
├── My Project - Progress.md       # Session tracking
└── My Project - Overview.canvas   # Visual overview (optional)
```

All files are created with:
- ✅ Meaningful initial content (from conversation context)
- ✅ Proper language (auto-detected from your messages)
- ✅ Original filename (preserves non-ASCII characters)
- ✅ Zero empty placeholders

## Core Principles

```
Context Window = RAM (volatile, limited)
Obsidian Vault = Disk (persistent, unlimited)

→ Anything important gets written to Obsidian
```

**Why Obsidian:**
- **Wikilinks**: Auto-linking and backlinks between documents
- **Properties**: YAML frontmatter for queries and filtering
- **Graph View**: Visualize knowledge connections
- **Callouts**: Highlight critical information
- **Tags**: Flexible categorization and search

## Critical Rules

### Rule 1: Plan First
Never start a complex task without planning files. Non-negotiable.

### Rule 2: The 2-Action Rule
> "After every 2 view/browser/search operations, IMMEDIATELY save findings to Findings.md"

This prevents visual/multimodal information loss.

### Rule 3: Read Before Decide
Before major decisions, read the plan file. Keeps goals in attention window.

### Rule 4: Update After Act
After completing any phase:
- Mark phase status: `in_progress` → `complete`
- Log any errors encountered
- Note files created/modified

### Rule 5: Log ALL Errors
Every error goes in the plan file. Builds knowledge, prevents repetition.

### Rule 6: Never Repeat Failures
```python
if action_failed:
    next_action != same_action
```
Track what you tried. Mutate the approach.

### Rule 7: Language Consistency
Document language must match user's conversation language.

### Rule 8: Zero Placeholders
Generate meaningful content from conversation context, not generic templates.

## The 3-Strike Error Protocol

```
ATTEMPT 1: Diagnose & Fix
  → Read error carefully
  → Identify root cause
  → Apply targeted fix

ATTEMPT 2: Alternative Approach
  → Same error? Try different method
  → Different tool? Different library?
  → NEVER repeat exact same failing action

ATTEMPT 3: Broader Rethink
  → Question assumptions
  → Search for solutions
  → Consider updating the plan

AFTER 3 FAILURES: Escalate to User
  → Explain what you tried
  → Share the specific error
  → Ask for guidance
```

## Read vs Write Decision Matrix

| Situation | Action | Reason |
|-----------|--------|--------|
| Just wrote a file | DON'T read | Content still in context |
| Viewed image/PDF | Write findings NOW | Multimodal → text before lost |
| Browser returned data | Write to file | Screenshots don't persist |
| Starting new phase | Read plan/findings | Re-orient if context stale |
| Error occurred | Read relevant file | Need current state to fix |
| Resuming after gap | Read all planning files | Recover state |

## The 5-Question Reboot Test

If you can answer these, your context management is solid:

| Question | Answer Source |
|----------|---------------|
| Where am I? | Current phase in task_plan.md |
| Where am I going? | Remaining phases |
| What's the goal? | Goal statement in plan |
| What have I learned? | findings.md |
| What have I done? | progress.md |

## Core Workflow

### 1. Plan Phase
- Detect user language and vault path
- Create three core files with Write tool
- Generate initial content from conversation context

### 2. Research Phase (The 2-Action Rule)
- After every 2 view/browser/search operations
- Immediately save findings to `Findings.md`
- Document key decisions and rationales

### 3. Execute Phase
- Follow task plan phase by phase
- Update progress after each session
- Log errors in error table

### 4. Review Phase
- Re-read plan before major decisions
- Update phase status and properties
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

Canvas files (`.canvas`) provide visual project overviews with JSON-based infinite canvas format.

**Benefits:**
- Visual workflow diagram showing 5-phase progression
- Click file nodes to open planning documents
- Color-coded phase status for quick assessment
- Infinite canvas for organizing complex projects

**Structure:**
```
[Project Title Node]
    ↓
[Phase 1] → [Phase 2] → [Phase 3] → [Phase 4] → [Phase 5]
    ↓           ↓           ↓
[Task Plan] [Findings] [Progress]
```

**Color Coding:**
- 🔴 Red (`"1"`) - Not started / Blocked
- 🟠 Orange (`"2"`) - Needs attention
- 🟡 Yellow (`"3"`) - In progress
- 🟢 Green (`"4"`) - Completed
- 🔵 Cyan (`"5"`) - Reference docs
- 🟣 Purple (`"6"`) - Important links

**When to Use:**
- Complex multi-phase projects
- Multi-session work requiring visual overview
- Optional for simpler tasks (prioritize markdown files)

## File Structure

```
plan-with-obsidian/
├── SKILL.md           # Core skill instructions
├── README.md          # English documentation
├── README.zh.md       # Chinese documentation
└── LICENSE            # MIT License
```

Clean and minimal - no scripts, no templates, just the skill definition.

## Examples

### Trigger Examples
- "I want to plan a new feature using Obsidian"
- "Create planning files in my Obsidian vault"
- "Set up project planning with Obsidian"
- "Plan with Obsidian: optimize homepage performance"

## Requirements

- Claude Code with skills support
- Obsidian (optional, but recommended for full features)

## Best Practices

✅ **Create plan first** - Never start complex tasks without planning files
✅ **Follow the 2-Action Rule** - Log findings every 2 operations
✅ **Update properties** - Keep frontmatter current
✅ **Use wikilinks generously** - Connect all related notes
✅ **Log all errors** - Track problems and solutions
✅ **Read before decide** - Re-read plan before major decisions
✅ **Never repeat failures** - Track attempts, change approach
✅ **Language consistency** - Match user's conversation language
✅ **Zero placeholders** - Generate meaningful content from context

## Anti-Patterns

| Don't | Do Instead |
|-------|------------|
| Use TodoWrite for persistence | Create task_plan.md file |
| State goals once and forget | Re-read plan before decisions |
| Hide errors and retry silently | Log errors to plan file |
| Stuff everything in context | Store large content in files |
| Start executing immediately | Create plan file FIRST |
| Repeat failed actions | Track attempts, mutate approach |
| Generate empty templates | Generate meaningful content from context |
| Use generic template language | Match user's conversation language |

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

## What's New in v2.0

This version removes shell script dependencies and uses Claude Code's native tools:

- ✅ **No more scripts** - Claude creates files directly
- ✅ **Multi-language support** - Auto-detects Chinese/English
- ✅ **Preserved filenames** - Keeps original characters (including Chinese)
- ✅ **Context-driven content** - Generates meaningful initial content
- ✅ **Zero empty placeholders** - Every field has actual content
- ✅ **Simplified structure** - Removed scripts/, templates/, references/

## Troubleshooting

**Filenames appear as dashes (`---`)?**
- Ensure you're using v2.0. Old version had a filename bug.

**Documents are empty?**
- Ensure you're using v2.0. New version generates content from context.

**Wrong language?**
- Check your conversation language. Documents match your messages.

**Wikilinks don't work?**
- Ensure files are in correct Obsidian vault path
- Use format: `[[File Name]]` (no .md extension)

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
