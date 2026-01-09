# Obsidian Planning Patterns

This document outlines best practices for planning with Obsidian-flavored markdown files.

## Table of Contents

- [Core Principles](#core-principles)
- [File Naming Convention](#file-naming-convention)
- [Folder Structure](#folder-structure)
- [Using Obsidian Dataview](#using-obsidian-dataview)
- [Using Obsidian Tasks](#using-obsidian-tasks)
- [Progressive Disclosure Pattern](#progressive-disclosure-pattern)
- [Linking Strategies](#linking-strategies)
- [Properties for Queries](#properties-for-queries)
- [Using Canvas for Visualization](#using-canvas-for-visualization)
- [Embedding Content](#embedding-content)
- [Templates in Obsidian](#templates-in-obsidian)
- [Daily Note Integration](#daily-note-integration)
- [Graph View Optimization](#graph-view-optimization)
- [Search Strategies](#search-strategies)
- [Best Practices Summary](#best-practices-summary)

## Core Principles

### 1. Use Obsidian Properties (Frontmatter)

Properties enable powerful querying and organization:

```yaml
---
type: task-plan | findings | progress-log
created: 2024-01-15
status: in-progress | pending | complete
project: "Project Name"
tags:
  - planning
  - active
related:
  - "[[Related Note]]"
---
```

### 2. Leverage Wikilinks for Connections

Connect planning files using wikilinks:

```markdown
- [[Project X - Task Plan]]
- [[Project X - Findings]]
- [[Project X - Progress]]
```

Benefits:
- Click to navigate between files
- See backlinks in Obsidian
- Build knowledge graph
- Query connected notes

### 3. Use Obsidian Callouts

Callouts provide visual emphasis:

```markdown
> [!tip] Best Practice
> Always re-read the task plan before major decisions

> [!bug] Error Log
> Track errors here

> [!success] Milestone Achieved
> Feature X completed successfully

> [!warning] Critical Issue
> This needs immediate attention
```

### 4. Task Lists with Obsidian Syntax

```markdown
- [ ] Incomplete task
- [x] Completed task
- [>] Forwarded task
- [<] Scheduled task
- [!] Important task
- [-] Cancelled task
- [?] Question/needs clarification
```

### 5. Tags for Organization

Use tags liberally:

```markdown
#planning #active #project/feature-x
#blocked #review-needed #priority/high
```

Benefits:
- Search by tag
- Filter in queries
- Create tag hierarchy

## File Naming Convention

Use descriptive names with separators:

```
Project Name - Task Plan.md
Project Name - Findings.md
Project Name - Progress.md
Feature X Implementation - Task Plan.md
```

Benefits:
- Easy to find in file explorer
- Natural alphabetical grouping
- Clear file purpose

## Folder Structure

Recommended structure in Obsidian vault:

```
Vault/
├── Planning/           # All planning files
│   ├── Active/         # Current projects
│   └── Archive/        # Completed projects
├── Projects/           # Project notes
└── Resources/          # Reference materials
```

## Using Obsidian Dataview

If Dataview plugin is installed, query planning files:

````markdown
```dataview
TABLE status, created, project
FROM "Planning"
WHERE type = "task-plan"
SORT created DESC
```
````

## Using Obsidian Tasks

If Tasks plugin is installed:

````markdown
```tasks
not done
heading includes Task Plan
group by file
```
````

## Progressive Disclosure Pattern

### Level 1: Task Plan (Core)

Keep this concise - overview and current status.

### Level 2: Findings (Research)

Detailed research, decisions, resources - load when needed.

### Level 3: Progress (Session Log)

Detailed session notes - rarely re-read, but available.

## Linking Strategies

### Forward Links (Explicit)

```markdown
See [[Research on Authentication Methods]]
Implementation details in [[Auth Implementation Notes]]
```

### Backlinks (Automatic)

Obsidian automatically shows where this note is mentioned.

### Tags as Virtual Links

```markdown
#project/auth-system connects all auth-related notes
```

## Properties for Queries

Useful properties to add:

```yaml
---
type: task-plan
status: in-progress
priority: high
due: 2024-02-01
estimated_hours: 8
actual_hours: 6
team_members:
  - Alice
  - Bob
blocked_by: []
---
```

Query with Dataview:
````markdown
```dataview
TABLE priority, due, estimated_hours
FROM "Planning"
WHERE status = "in-progress"
SORT due ASC
```
````

## Using Canvas for Visualization

Create a Canvas file to visualize project structure:

1. Create `Project X - Overview.canvas`
2. Add planning notes as file nodes
3. Connect with edges showing relationships
4. Group related items

## Embedding Content

Embed sections from other notes:

```markdown
![[Project X - Findings#Technical Decisions]]
![[Project X - Progress#Phase 1]]
```

## Templates in Obsidian

Store templates in Obsidian's template folder:

1. Settings → Core plugins → Templates
2. Set template folder
3. Copy planning templates there
4. Use with Ctrl/Cmd + T

## Daily Note Integration

Link planning to daily notes:

```markdown
## 2024-01-15

- Working on [[Project X - Task Plan]]
- Completed Phase 1
- See [[Project X - Progress]] for details
```

## Graph View Optimization

Make planning files visible in graph:

- Use consistent tags
- Link between planning files
- Link to project notes
- Use properties for filtering

## Search Strategies

### Find All Active Plans

```
path:Planning status:in-progress
```

### Find Errors Across Projects

```
path:Planning section:"Error Log"
```

### Find Specific Phase

```
path:Planning "Phase 3: Implementation"
```

## Best Practices Summary

1. **Always use frontmatter** - Enables powerful queries
2. **Link generously** - Build a knowledge graph
3. **Use callouts** - Visual emphasis for important info
4. **Tag consistently** - Use hierarchical tags
5. **Embed sparingly** - Avoid context bloat
6. **Archive completed plans** - Keep vault clean
7. **Review regularly** - Update status properties
8. **Use templates** - Consistency saves time

## Common Anti-Patterns

### ❌ Don't Do This

```markdown
# Task Plan

Goal: Do the thing
Status: doing it
```

No properties, no links, no structure.

### ✅ Do This Instead

```yaml
---
type: task-plan
status: in-progress
project: "Feature Implementation"
tags: [planning, active]
---

# Task Plan: Feature Implementation

## Goal
[Clear, specific goal]

[[Related Findings]] | [[Progress Log]]
```

## Obsidian Plugin Recommendations

Useful plugins for planning:

- **Dataview** - Query notes
- **Tasks** - Manage tasks across notes
- **Calendar** - Date-based organization
- **Kanban** - Kanban boards from notes
- **Templater** - Advanced templating
- **Excalidraw** - Diagrams and sketches

## Mobile Considerations

When using Obsidian mobile:

- Keep filenames short
- Use tags for quick filtering
- Leverage quick switcher
- Use starred notes for quick access
- Sync with Obsidian Sync or Git

## Collaboration

If sharing vault:

- Use consistent naming
- Document conventions
- Use properties for ownership
- Add `author` property
- Review merge conflicts carefully

## Migration from Other Systems

### From TodoWrite

TodoWrite items → Obsidian task lists with properties

### From Planning-with-Files

Replace in-project files with Obsidian vault files, same structure but with Obsidian syntax.

## Troubleshooting

### Links Not Working

- Check spelling (case-sensitive on some systems)
- Use `[[File Name]]` not `[[file-name.md]]`
- Ensure file is in vault

### Properties Not Showing

- Check YAML syntax
- Must have `---` before and after
- No tabs, only spaces
- Check quotes around strings

### Search Not Finding

- Rebuild search index: Settings → About → Rebuild Search Index
- Check path filter
- Try simpler query

## Advanced Patterns

### Multi-Project Planning

Use tags to separate projects:

```yaml
tags:
  - planning
  - project/alpha
  - project/beta
```

Query with Dataview by project.

### Time Tracking

Add time properties:

```yaml
estimated_hours: 8
actual_hours: 6
efficiency: 75%
```

Query to analyze time usage.

### Dependency Tracking

```yaml
depends_on:
  - "[[Feature A - Task Plan]]"
  - "[[Feature B - Task Plan]]"
blocked_by:
  - "[[Bug Fix #123]]"
```

Query to see blockers.
