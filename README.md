# NewsAI MCP Server

> Your agents' window to the world — real-time news, any topic, any region, any language.

The NewsAI MCP server by [NewzAI](https://newzai.ai) gives your AI agents instant access to real-time news across 7 global regions, in any language, for any topic — predefined or custom.

---

## Quick Setup

Add the following to your MCP client configuration:

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

> **Authentication required** — This server uses Google OAuth. You will be prompted to sign in with your Google account on first use.

---

## Tools

### `fetch_news_headlines`

Fetch the latest news headlines for a region.

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

Fetch detailed news for a well-known topic category.

| Parameter             | Type   | Required | Description                              |
| --------------------- | ------ | -------- | ---------------------------------------- |
| `predefined_category` | enum   | Yes      | One of the predefined categories below   |
| `region`              | string | No       | Region to fetch from (default: `india`)  |
| `language`            | string | No       | Output language (default: `en`)          |
| `top_k`               | int    | No       | Number of items to return (default: `20`) |

**Available categories:** `TECHNOLOGY`, `BUSINESS`, `ENTERTAINMENT`, `SPORTS`, `WORLD`

**Example prompt:**
> *What's happening in technology news in the US?*

---

### `search_news_for_any_category`

Fetch detailed news for any custom topic or keyword.

| Parameter      | Type    | Required | Description                                              |
| -------------- | ------- | -------- | -------------------------------------------------------- |
| `category`     | string  | Yes      | Any topic or keyword (e.g., `"climate change"`, `"AI"`) |
| `region`       | string  | No       | Region to fetch from (default: `india`)                  |
| `language`     | string  | No       | Output language code (default: `en`)                     |
| `top_k`        | int     | No       | Number of items to return (default: `20`)                |
| `last_n_hours` | int     | No       | Limit news to the last N hours (e.g., `24`)              |

**Example prompt:**
> *Find me news about electric vehicles in Japan from the last 24 hours*

---

## Authentication

This server requires a **Google account** to authenticate via OAuth 2.0. On first connection your MCP client will redirect you to a Google sign-in page. After authorizing, your session token is used automatically for all subsequent requests.

---

## Examples

### Claude Desktop / VS Code Copilot

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

---

## Links

- Website: [newzai.ai](https://newzai.ai)
- API: [api.newzai.ai](https://api.newzai.ai)
