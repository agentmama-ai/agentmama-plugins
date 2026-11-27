# AgentMama plugins

AgentMama's plugins for Claude, ChatGPT and Codex.

| Plugin                           | What it does                                                                                                                                  |
| -------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| [`agentmama`](plugins/agentmama) | Connects the assistant to your AgentMama account (MCP) and adds the `agentmama-marketer` skill for working account data together with Mama Knowledge |

## Install in Claude Code

```
/plugin marketplace add agentmama-ai/agentmama-plugins
/plugin install agentmama@agentmama-plugins
```

## Install in Codex

```
codex plugin marketplace add agentmama-ai/agentmama-plugins
```

Then restart the ChatGPT desktop app and install AgentMama from the
AgentMama marketplace in the Plugins Directory. ChatGPT and Codex users can
also install the listed plugin from OpenAI's plugin directory.

## Layout

```
.claude-plugin/marketplace.json   # this marketplace, for Claude
.agents/plugins/marketplace.json  # the same marketplace, for Codex and ChatGPT
plugins/<plugin>/                 # one folder per plugin, each its own directory submission
  .claude-plugin/plugin.json      # Claude manifest; raise `version` every release
  .mcp.json                       # Claude's remote MCP servers
  plugin.json                     # OpenAI manifest: listing, review test cases
  mcp.json                        # OpenAI's MCP server and its OAuth settings
  assets/                         # OpenAI logo and composer icon
  skills/<skill>/SKILL.md         # shared; written for any model, naming none
  README.md                       # what the plugin runs, sends or fetches
scripts/package-openai.sh         # builds the ZIP uploaded to OpenAI's plugin dashboard
```

Both manifests carry the same `version`; raise them together.
`scripts/package-openai.sh` refuses to build when they differ.

## Releasing to OpenAI

`scripts/package-openai.sh` writes `dist/<plugin>-<version>.zip` with the
OpenAI files only (`plugin.json`, `mcp.json`, `skills/`, `assets/`). Upload
it at platform.openai.com/plugins: "Upload new or existing plugin" for the
first release, "Upload plugin to make changes" after. Listing text, review
test cases, skills and assets need a new ZIP and a review. Changes to the
MCP server's tools don't: OpenAI rescans the server daily, and a new tool
stays unavailable until it is approved. The reviewer login goes in the
dashboard's review details, never in the ZIP.

## Keeping skills in step with the server

Skills and the OpenAI review test cases (`tools_triggered` in
`plugin.json`) name tools of the AgentMama MCP server, which lives in the
backend repo. When a tool is renamed, removed or changes its parameters
there, update them here and raise the plugin's `version`.
