#!/bin/bash
# Initialize Obsidian planning files for a new task
# Usage: init_obsidian_plan.sh "Task Title" [obsidian-vault-path]

set -e

# Configuration
OBSIDIAN_VAULT="${2:-./obsidian-plan}"
PLANNING_FOLDER="Planning"
TEMPLATE_DIR="$(dirname "$0")/../templates"

# Parse arguments
if [ -z "$1" ]; then
  echo "Usage: $0 \"Task Title\" [obsidian-vault-path]"
  echo "Example: $0 \"Implement User Auth\" \"\$HOME/MyVault\""
  exit 1
fi

TASK_TITLE="$1"
SAFE_TITLE=$(echo "$TASK_TITLE" | sed 's/[^a-zA-Z0-9 ]/-/g' | sed 's/ /-/g')
CURRENT_DATE=$(date '+%Y-%m-%d')
CURRENT_DATETIME=$(date '+%Y-%m-%d %H:%M')

# Create planning folder if it doesn't exist
PLANNING_PATH="$OBSIDIAN_VAULT/$PLANNING_FOLDER"
mkdir -p "$PLANNING_PATH"

# File paths
TASK_PLAN="$PLANNING_PATH/$SAFE_TITLE - Task Plan.md"
FINDINGS="$PLANNING_PATH/$SAFE_TITLE - Findings.md"
PROGRESS="$PLANNING_PATH/$SAFE_TITLE - Progress.md"
OVERVIEW_CANVAS="$PLANNING_PATH/$SAFE_TITLE - Overview.canvas"

# Check if files already exist
if [ -f "$TASK_PLAN" ]; then
  echo "⚠️  Planning files already exist for '$TASK_TITLE'"
  echo "   $TASK_PLAN"
  read -p "Overwrite? (y/N): " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 0
  fi
fi

# Function to replace template variables
replace_vars() {
  local file="$1"
  sed -e "s/{{title}}/$TASK_TITLE/g" \
      -e "s/{{date:YYYY-MM-DD}}/$CURRENT_DATE/g" \
      -e "s/{{date:YYYY-MM-DD HH:mm}}/$CURRENT_DATETIME/g" \
      "$file"
}

# Create files from templates
echo "📝 Creating planning files for: $TASK_TITLE"
echo "   Location: $PLANNING_PATH"

replace_vars "$TEMPLATE_DIR/task_plan.md" > "$TASK_PLAN"
echo "✅ Created: $SAFE_TITLE - Task Plan.md"

replace_vars "$TEMPLATE_DIR/findings.md" > "$FINDINGS"
echo "✅ Created: $SAFE_TITLE - Findings.md"

replace_vars "$TEMPLATE_DIR/progress.md" > "$PROGRESS"
echo "✅ Created: $SAFE_TITLE - Progress.md"

# Create Canvas file with variable replacement
sed -e "s/{{title}}/$TASK_TITLE/g" \
    -e "s/{{safe_title}}/$SAFE_TITLE/g" \
    "$TEMPLATE_DIR/overview_canvas.json" > "$OVERVIEW_CANVAS"
echo "✅ Created: $SAFE_TITLE - Overview.canvas"

echo ""
echo "✨ Planning files initialized successfully!"
echo ""
echo "Next steps:"
echo "1. Open $SAFE_TITLE - Task Plan.md in Obsidian"
echo "2. Fill in the Goal section"
echo "3. Customize phases as needed"
echo "4. Start working on Phase 1"
echo ""
echo "Files created:"
echo "  - [[$SAFE_TITLE - Task Plan]]"
echo "  - [[$SAFE_TITLE - Findings]]"
echo "  - [[$SAFE_TITLE - Progress]]"
echo "  - [[$SAFE_TITLE - Overview]] (Canvas visualization)"

