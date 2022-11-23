chown appuser /app
chmod 777 /app
bun init -y && bun install express && bun run index.js
