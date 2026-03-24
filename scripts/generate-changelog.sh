#!/usr/bin/env bash
#
# Generate CHANGELOG using git-chglog
#
# Usage:
#   ./scripts/generate-changelog.sh           - Generate full changelog
#   ./scripts/generate-changelog.sh v2.0.0    - Generate changelog with next tag
#   ./scripts/generate-changelog.sh --check   - Check if CHANGELOG needs updating
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if git-chglog is installed
if ! command -v git-chglog &> /dev/null; then
    echo -e "${RED}❌ Error: git-chglog is not installed${NC}"
    echo ""
    echo "Install it with:"
    echo "  macOS:   brew install git-chglog"
    echo "  Linux:   See https://github.com/git-chglog/git-chglog#installation"
    exit 1
fi

# Function to generate changelog
generate_changelog() {
    local next_tag="$1"

    echo -e "${GREEN}📝 Generating CHANGELOG.md...${NC}"

    if [ -n "$next_tag" ]; then
        echo -e "${YELLOW}Including unreleased commits as tag: $next_tag${NC}"
        git-chglog --next-tag "$next_tag" -o CHANGELOG.md
    else
        git-chglog -o CHANGELOG.md
    fi

    echo -e "${GREEN}✅ CHANGELOG.md generated successfully${NC}"
}

# Function to check if changelog needs updating
check_changelog() {
    local temp_file=$(mktemp)

    echo -e "${GREEN}🔍 Checking if CHANGELOG.md needs updating...${NC}"

    # Generate changelog to temp file
    git-chglog -o "$temp_file" 2>/dev/null

    # Compare with existing CHANGELOG
    if [ -f CHANGELOG.md ]; then
        if diff -q CHANGELOG.md "$temp_file" > /dev/null 2>&1; then
            echo -e "${GREEN}✅ CHANGELOG.md is up to date${NC}"
            rm "$temp_file"
            exit 0
        else
            echo -e "${YELLOW}⚠️  CHANGELOG.md needs updating${NC}"
            echo ""
            echo "Run one of the following to update:"
            echo "  make changelog"
            echo "  ./scripts/generate-changelog.sh"
            rm "$temp_file"
            exit 1
        fi
    else
        echo -e "${RED}❌ CHANGELOG.md does not exist${NC}"
        rm "$temp_file"
        exit 1
    fi
}

# Function to show unreleased commits
show_unreleased() {
    echo -e "${GREEN}📋 Unreleased commits:${NC}"
    echo ""

    local last_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "")

    if [ -n "$last_tag" ]; then
        echo "Since $last_tag:"
        echo ""
        git log "${last_tag}..HEAD" --oneline --no-merges
    else
        echo "No tags found. Showing all commits:"
        echo ""
        git log --oneline --no-merges
    fi
}

# Main script
case "${1:-}" in
    --check)
        check_changelog
        ;;
    --unreleased)
        show_unreleased
        ;;
    --help|-h)
        echo "Usage: $0 [OPTIONS] [NEXT_TAG]"
        echo ""
        echo "Generate CHANGELOG using git-chglog"
        echo ""
        echo "Options:"
        echo "  --check       Check if CHANGELOG needs updating"
        echo "  --unreleased  Show unreleased commits"
        echo "  --help        Show this help message"
        echo ""
        echo "Examples:"
        echo "  $0                    Generate full changelog"
        echo "  $0 v2.0.0             Generate with unreleased commits tagged as v2.0.0"
        echo "  $0 --check            Check if CHANGELOG needs updating"
        echo "  $0 --unreleased       Show commits since last tag"
        ;;
    "")
        generate_changelog
        ;;
    *)
        generate_changelog "$1"
        ;;
esac
