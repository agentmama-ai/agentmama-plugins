#!/usr/bin/env bash
# Builds the ZIP that is uploaded to OpenAI's plugin dashboard
# (platform.openai.com/plugins -> Upload new or existing plugin).
#
# The ZIP holds the plugin's OpenAI files only: plugin.json, mcp.json,
# skills/ and assets/. Claude's .claude-plugin/ and .mcp.json stay out, so
# the package declares one MCP configuration. Output: dist/<name>-<version>.zip
set -euo pipefail

plugin="${1:-agentmama}"
root="$(cd "$(dirname "$0")/.." && pwd)"
src="$root/plugins/$plugin"
version="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["version"])' "$src/plugin.json")"
claude_version="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["version"])' "$src/.claude-plugin/plugin.json")"
if [ "$version" != "$claude_version" ]; then
  echo "plugin.json is $version but .claude-plugin/plugin.json is $claude_version; raise both together" >&2
  exit 1
fi

out="$root/dist/$plugin-$version.zip"
mkdir -p "$root/dist"
rm -f "$out"
(cd "$src" && zip -qrX "$out" plugin.json mcp.json skills assets -x '*.DS_Store')
echo "$out"
unzip -l "$out"
