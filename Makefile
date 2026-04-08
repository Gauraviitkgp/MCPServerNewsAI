MY_DOMAIN:=newzai.ai

help:
	mcp-publisher --help

authenticate:
	@PRIVATE_KEY="$$(openssl pkey -in key.pem -noout -text | grep -A3 "priv:" | tail -n +2 | tr -d ' :\n')"; \
	mcp-publisher login dns --domain "${MY_DOMAIN}" --private-key "$${PRIVATE_KEY}"

install:
	curl -L "https://github.com/modelcontextprotocol/registry/releases/latest/download/mcp-publisher_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/').tar.gz" | tar xz mcp-publisher && sudo mv mcp-publisher /usr/local/bin/

publish:
	mcp-publisher publish

generate-txt: # source: https://modelcontextprotocol.io/registry/authentication#dns-authentication
	@# Generate public/private key pair using Ed25519
	@openssl genpkey -algorithm Ed25519 -out key.pem
	@# Generate TXT record
	@PUBLIC_KEY=$$(openssl pkey -in key.pem -pubout -outform DER | tail -c 32 | base64); echo "$${MY_DOMAIN}. IN TXT \"v=MCPv1; k=ed25519; p=$${PUBLIC_KEY}\""

find:
	curl "https://registry.modelcontextprotocol.io/v0.1/servers?search=ai.newzai.api/NewzAI"