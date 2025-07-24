#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."

GREEN='\033[0;32m'
NC='\033[0m'

deno update
deno run -WR ./gen/main.js
deno fmt
gleam fix
gleam check
gleam update
gleam build
gleam format

echo -e "${GREEN}==> erlang${NC}"
gleam test --target erlang

echo -e "${GREEN}==> nodejs${NC}"
gleam test --target javascript --runtime nodejs

echo -e "${GREEN}==> deno${NC}"
gleam test --target javascript --runtime deno

echo -e "${GREEN}==> bun${NC}"
gleam test --target javascript --runtime bun
