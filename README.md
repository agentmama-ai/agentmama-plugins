# AgentMama plugins

AgentMama's plugins for Claude.

| Plugin                           | What it does                                                                                                                                  |
| -------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| [`agentmama`](plugins/agentmama) | Connects Claude to your AgentMama account (MCP) and adds the `agentmama-marketer` skill for working account data together with Mama Knowledge |

## Install in Claude Code

```
/plugin marketplace add agentmama-ai/agentmama-plugins
/plugin install agentmama@agentmama-plugins
```

## Layout

```
.claude-plugin/marketplace.json   # this marketplace
plugins/<plugin>/                 # one folder per plugin, each its own directory submission
  .claude-plugin/plugin.json      # manifest; raise `version` with every release
  .mcp.json                       # remote MCP servers
  skills/<skill>/SKILL.md
  README.md                       # describes everything the plugin runs, sends or fetches
```

## Keeping skills in step with the server

Skills name tools of the AgentMama MCP server, which lives in the backend
repo. When a tool is renamed, removed or changes its parameters there, update
the skills here and raise the plugin's `version`.
