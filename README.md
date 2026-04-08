# News MCP Server — Real-Time News for AI Agents | NewsAI

> The fastest way to add live news to any AI agent via the Model Context Protocol (MCP).

**NewsAI** is a **news MCP server** that gives Claude, Cursor, VS Code Copilot, and any MCP-compatible AI agent instant access to real-time headlines and in-depth news — across 7 global regions, in any language, on any topic.

If you are looking for a **news MCP**, this is the one. No scraping, no RSS parsing, no brittle APIs — just a single MCP endpoint that works out of the box.

[![MCP](https://img.shields.io/badge/MCP-Compatible-blue)](https://modelcontextprotocol.io)
[![Provider](https://img.shields.io/badge/Provider-NewzAI-green)](https://newzai.ai)

**Want to see it in action?** Try the news MCP live with an AI agent at [app.newzai.ai](https://app.newzai.ai) — no setup required, just chat.

---

## What Is a News MCP Server?

A **news MCP server** is a [Model Context Protocol](https://modelcontextprotocol.io) server that exposes real-time news data as tools your AI agent can call. Instead of training on stale data, your agent fetches live headlines and articles on demand — during inference, in real time.

NewsAI's MCP server for news covers:
- **7 regions:** India, United States, United Kingdom, Japan, Australia, Canada, Germany
- **Any language:** English, Japanese, German, and more via language codes
- **Any topic:** Predefined categories (Technology, Business, Sports, Entertainment, World) or fully custom keyword search
- **Recency control:** Filter news from the last N hours

---

## Quick Setup

Add the NewsAI news MCP server to your MCP client configuration:

```json
{
  "mcpServers": {
    "newzai": {
      "type": "http",
      "url": "https://api.newzai.ai/mcp/"
    }
  }
}
```

> **Authentication required** — Uses Google OAuth. You will be prompted to sign in on first use. No API key management needed.

Works with: **Claude Desktop**, **Cursor**, **VS Code Copilot**, **Windsurf**, and any MCP-compatible client.

---

## MCP Tools

This news MCP server exposes three tools to your AI agent:

---

### `fetch_news_headlines`

Fetch the latest top news headlines for a region in seconds.

| Parameter  | Type   | Required | Description                        |
| ---------- | ------ | -------- | ---------------------------------- |
| `region`   | string | Yes      | One of the supported regions below |
| `language` | string | No       | Output language (default: `en`)    |

**Supported regions:** `india`, `united-states`, `united-kingdom`, `japan`, `australia`, `canada`, `germany`

**Example prompt:**
> *Get me the latest headlines from India*

**Example response:**
```
- 25th Amendment row: Can Trump be removed from office amid Iran war?
- Iran's 'lost the key' post offers comic relief amid global tension
- NASA's Artemis II Crew To Break Distance Record
- IPL 2026: KKR vs PBKS in danger from thunderstorm threat
...
```

---

### `search_news_predefined_category`

Fetch rich, detailed news articles for a well-known topic category.

| Parameter             | Type   | Required | Description                               |
| --------------------- | ------ | -------- | ----------------------------------------- |
| `predefined_category` | enum   | Yes      | One of the predefined categories below    |
| `region`              | string | No       | Region to fetch from (default: `india`)   |
| `language`            | string | No       | Output language (default: `en`)           |
| `top_k`               | int    | No       | Number of articles to return (default: `20`) |

**Available categories:** `TECHNOLOGY`, `BUSINESS`, `ENTERTAINMENT`, `SPORTS`, `WORLD`

**Example prompt:**
> *What's happening in technology news in the US?*

---

### `search_news_for_any_category`

Fetch news for any custom keyword or topic — the most flexible tool in the news MCP.

| Parameter      | Type   | Required | Description                                               |
| -------------- | ------ | -------- | --------------------------------------------------------- |
| `category`     | string | Yes      | Any topic or keyword (e.g., `"climate change"`, `"AI"`)   |
| `region`       | string | No       | Region to fetch from (default: `india`)                   |
| `language`     | string | No       | Output language code (default: `en`)                      |
| `top_k`        | int    | No       | Number of articles to return (default: `20`)              |
| `last_n_hours` | int    | No       | Limit to news from the last N hours (e.g., `24`)          |

**Example prompts:**
> *Find me news about electric vehicles in Japan from the last 24 hours*
> *What are people saying about AI regulation this week?*
> *Search for startup funding news in the US*

---

## Why Use a News MCP Instead of Web Search?

| Feature | News MCP (NewsAI) | Generic web search |
|---|---|---|
| Structured, clean output | Yes | No — raw HTML |
| Region-specific sources | Yes | Partial |
| Language control | Yes | Limited |
| Recency filtering (last N hours) | Yes | No |
| Works natively in Claude & Cursor | Yes | Requires extra tool |
| No API key management | Yes (OAuth) | Usually no |

---

## Use Cases

This news MCP server is used for:

- **AI news briefing agents** — morning digest bots that summarize today's headlines
- **Research assistants** — fetch domain-specific news (biotech, finance, geopolitics) on demand
- **Content generation** — ground articles and social posts in real, current events
- **Market intelligence** — track competitor mentions, industry shifts, breaking business news
- **Multilingual news** — fetch news in English and deliver summaries in Japanese, German, etc.
- **RAG pipelines** — inject live news context into retrieval-augmented generation workflows

---

## Authentication

This MCP server uses **Google OAuth 2.0**. On first connection your MCP client redirects you to a Google sign-in page. After authorizing, your session is maintained automatically — no tokens to copy, no API keys to rotate.

---

## Client Configuration Examples

### Claude Desktop

```json
{
  "mcpServers": {
    "newzai": {
      "type": "http",
      "url": "https://api.newzai.ai/mcp/"
    }
  }
}
```

### Cursor

```json
{
  "mcpServers": {
    "newzai": {
      "type": "http",
      "url": "https://api.newzai.ai/mcp/"
    }
  }
}
```

### VS Code (Copilot / Continue)

```json
{
  "mcpServers": {
    "newzai": {
      "type": "http",
      "url": "https://api.newzai.ai/mcp/"
    }
  }
}
```

---

## Frequently Asked Questions

**What is the best news MCP server?**
NewsAI is purpose-built as a news MCP server — not a generic web search wrapper. It delivers structured, regional, multilingual news data directly to your AI agent via the Model Context Protocol.

**Does this work with Claude?**
Yes. Add the MCP config to Claude Desktop and Claude will automatically use the news tools when you ask about current events.

**Is there a free tier?**
Yes — it's completely free. All you need is a Google account to sign in via OAuth. If you're building an autonomous agent or pipeline that needs API key access instead of OAuth, contact [feedback@newzai.ai](mailto:feedback@newzai.ai).

**What regions are supported?**
India, United States, United Kingdom, Japan, Australia, Canada, and Germany — with more regions coming soon.

**Can I fetch news in languages other than English?**
Yes. Pass any BCP-47 language code (e.g., `ja`, `de`, `hi`) as the `language` parameter.

---

## Links

- Website: [newzai.ai](https://newzai.ai)
- API: [api.newzai.ai](https://api.newzai.ai)
- Model Context Protocol spec: [modelcontextprotocol.io](https://modelcontextprotocol.io)
