# AgentMama for Claude, ChatGPT and Codex

Connects your assistant (Claude, ChatGPT or Codex) to your
[AgentMama](https://agentmama.ai) account and teaches it to work your
marketing data together with Mama Knowledge, AgentMama's knowledge base of
current marketing practice. Ask about account performance, audits, Google
Ads, Meta, Merchant Center, GA4, TikTok or Microsoft Ads, budgets, bidding,
creative, feeds, search terms or measurement, and the assistant answers from
your account's own figures, checked against what leading practitioners do
today.

## Install in Claude Code

```
/plugin install agentmama --marketplace agentmama-ai/agentmama-plugins
```

## Install in ChatGPT or Codex

Install AgentMama from OpenAI's plugin directory, or add this repo as a
marketplace with `codex plugin marketplace add agentmama-ai/agentmama-plugins`.

## What's inside

- **`agentmama` MCP server**: the remote server at
  `https://mcp.agentmama.ai/mcp`. It gives the assistant read access to your
  account data and Mama Knowledge, and the tools to create reports
  (explorations) and action cards in AgentMama.
- **`agentmama-marketer` skill**: how the assistant combines the two sources:
  orient on the account and its decisions, frame the question with current
  practice, pull the figures, reconcile the two, and deliver recommendations
  that cite both.

## Requirements

An AgentMama account. The first time the assistant uses a tool, it opens
AgentMama's sign-in in your browser (OAuth). The assistant sees only the
accounts your user can see. ChatGPT also reads your email address and
whether it is verified (OpenID Connect), which a ChatGPT workspace can use
to restrict which email domains may connect.

## Data and network use

- The plugin runs no local code. Everything goes to `https://mcp.agentmama.ai`
  over HTTPS, signed in as you.
- Questions and queries about your account are sent to AgentMama and answered
  from your account's data there.
- Mama Knowledge receives marketing topics only. The skill tells the
  assistant never to send account names, customer data or figures to it.
- Nothing is sent to any other service.

## Writes

Reading is free. Creating a report or an action card writes to your live
AgentMama account, and the skill only does so when you explicitly ask. Action
cards are applied by a person in the AgentMama app; nothing runs on save.

## Privacy and terms

- Privacy: [agentmama.ai/privacy-policy](https://agentmama.ai/privacy-policy/)
- Use of the AgentMama service is governed by the
  [AgentMama terms of service](https://agentmama.ai/terms-of-service/).

## License

The plugin's files are licensed under the
[Apache License 2.0](https://github.com/agentmama-ai/agentmama-plugins/blob/main/LICENSE).
Copyright 2026 AgentMama AI AB. The license covers this plugin only, not the
AgentMama service, and grants no rights to the AgentMama name or logo.

## Support

[agentmama.ai](https://agentmama.ai)
