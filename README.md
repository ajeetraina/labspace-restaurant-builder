# 🍛 Build Your Restaurant Website Labspace

Build a real restaurant website using AI and containers. No coding experience needed!

## Quick Start

### Run the Labspace

```bash
# On Mac/Linux
CONTENT_PATH=$PWD docker compose -f oci://dockersamples/labspace-content-dev -f .labspace/compose.override.yaml up

# On Windows with PowerShell
$Env:CONTENT_PATH = (Get-Location).Path; docker compose -f oci://dockersamples/labspace-content-dev -f .labspace/compose.override.yaml up
```

Then open http://localhost:3030 and follow the guides!

### Or just start building

```bash
cd starter-template
docker compose up
```

Open http://localhost:3000 and start customizing with AI!

## What You'll Build

- ✨ A professional restaurant website
- 🤖 Using AI to write the code
- 📦 Running in Docker containers
- 🎨 Fully customizable

## What You'll Learn

- How to use AI for development
- Why containers make everything easier
- How to build real applications
- Modern development workflows

## Workshop Mode

Perfect for in-person workshops! Guide participants through building their restaurant site in 90 minutes.

## Community

- [Collabnix](https://collabnix.com)
- [Discord](https://discord.gg/collabnix)
- [Slack](https://join.slack.com/t/collabnix/shared_invite)
