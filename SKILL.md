---
name: plan-with-obsidian
description: Persistent planning with Obsidian vault integration. Use when the user mentions Obsidian planning, wants planning files in their Obsidian vault, or says "plan with Obsidian". Creates structured planning documents (task_plan.md, findings.md, progress.md) and visual Canvas overview with Obsidian-specific features (wikilinks, properties, callouts, tags).
---

# Plan with Obsidian

File-based planning using Obsidian-flavored markdown, combining structured planning with Obsidian's linking and visualization features.

## Quick Start

Before starting any complex task:

1. **Initialize**: Run `scripts/init_obsidian_plan.sh "Task Title" [vault-path]`
2. **Customize**: Edit files in Obsidian vault (default: `./obsidian-plan/Planning/`)
3. **Work**: Follow the planning workflow below

## Core Workflow

### Step 1: Initialize Planning Files

```bash
scripts/init_obsidian_plan.sh "Task Title" [vault-path]
```

Creates four files in `Planning/` folder:
- `Task Title - Task Plan.md` - Main planning document
- `Task Title - Findings.md` - Research log
- `Task Title - Progress.md` - Session tracking
- `Task Title - Overview.canvas` - Visual project overview

### Step 2: Customize Task Plan

In Obsidian:
- Fill in Goal section
- Customize phases
- Update properties (status, tags)
- Add `[[wikilinks]]` to related notes

### Step 3: Work Through Phases

For each phase:

1. **Before starting** - Read task_plan.md
2. **During work** - Update findings.md after every 2 view/browser operations
3. **After completion** - Mark phase complete, update progress.md
4. **On errors** - Log to task_plan.md error table

### Step 4: Use Obsidian Features

While working:
- Link with `[[wikilinks]]`
- Tag with `#tags`
- Use callouts for emphasis (see obsidian-patterns.md)
- Update properties for queries
- View Canvas for visual overview

## File Structure

```
./obsidian-plan/
└── Planning/
    ├── Task Title - Task Plan.md
    ├── Task Title - Findings.md
    ├── Task Title - Progress.md
    └── Task Title - Overview.canvas
```

## Obsidian Features

### Properties (YAML Frontmatter)

```yaml
---
type: task-plan | findings | progress-log
status: in-progress | pending | complete
project: "Project Name"
tags: [planning, active]
related: ["[[Other Note]]"]
---
```

Use for Dataview queries and filtering.

### Wikilinks

Connect planning files:

```markdown
See [[Task Title - Findings]] for research
```

Benefits: Click to navigate, automatic backlinks, knowledge graph.

### Callouts

```markdown
> [!tip] Best Practice
> Re-read plan before decisions

> [!bug] Error
> Track errors here
```

For details on callout types and patterns, see `references/obsidian-patterns.md`.

### Canvas Visualization

The `Overview.canvas` file provides:
- Visual project structure
- 5-phase workflow diagram
- Planning document links
- Current status overview

For Canvas customization and advanced usage, see `references/canvas-guide.md`.

## Critical Rules

### 1. Create Plan First

Never start complex tasks without initialized planning files.

### 2. The 2-Action Rule

After every 2 view/browser/search operations, IMMEDIATELY save findings to `findings.md`.

### 3. Update Properties

Keep frontmatter current:
- Update `status` as phases progress
- Add `related` links to connected notes
- Tag appropriately

### 4. Use Wikilinks Generously

Link between:
- Planning files (task_plan ↔ findings ↔ progress)
- Planning files and project notes
- Planning files and references

### 5. Log All Errors

Every error goes in task_plan.md error table:
- Error description
- Attempt number
- Resolution
- Prevention strategy

## Resources

### scripts/

- `init_obsidian_plan.sh` - Initialize planning files in Obsidian vault

### templates/

- `task_plan.md` - Task planning template with properties and callouts
- `findings.md` - Research findings template
- `progress.md` - Progress tracking with 5-question reboot check
- `overview_canvas.json` - Visual Canvas template

### references/

- `obsidian-patterns.md` - Complete guide to Obsidian features, callout types, plugin recommendations
- `canvas-guide.md` - Comprehensive Canvas usage, customization, and advanced techniques

## When to Use

**Use this skill when:**
- User mentions "Obsidian planning" or "plan with Obsidian"
- User wants planning files in their Obsidian vault
- User has an active Obsidian vault
- User wants Obsidian features (graph, properties, wikilinks)

**Consider planning-with-files when:**
- Planning files should stay with project
- User doesn't use Obsidian
- Simple markdown without Obsidian features

## Troubleshooting

**Script fails:**
- Check vault path (default: `./obsidian-plan`)
- Ensure Planning folder can be created
- Verify file permissions

**Wikilinks don't work:**
- Ensure files in Obsidian vault
- Use format: `[[File Name]]` (no .md extension)

**Properties not showing:**
- Check YAML has `---` before and after
- Use spaces only (no tabs)
- Quote strings with colons

**Canvas files don't open:**
- Use relative paths: `Planning/Task Title - Task Plan.md`
- Don't include leading `/` or `./`
