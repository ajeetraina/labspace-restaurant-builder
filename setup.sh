#!/bin/bash

set -e

echo "🍛 Setting up Restaurant Builder Labspace (Simple Version)..."
echo ""

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

TARGET_DIR="${1:-.}"
cd "$TARGET_DIR"

echo -e "${BLUE}📁 Creating directory structure...${NC}"

mkdir -p .labspace
mkdir -p .github/workflows
mkdir -p starter-template/{app,components,public,lib,styles}
mkdir -p examples/rameshwaram-cafe

echo -e "${GREEN}✓ Directory structure created${NC}"

# Create labspace.yaml
cat > labspace.yaml << 'EOF'
title: "Build Your Restaurant Website"
description: "Build a real restaurant website using AI and containers. No coding experience needed!"
difficulty: 1
tags:
  - beginner
  - web-development
  - ai
  - vibe-coding
  - nextjs
estimated_time: 90 minutes
authors:
  - name: "Ajeet Singh Raina"
    github: "ajeetraina"
version: "1.0.0"
EOF

echo -e "${GREEN}✓ labspace.yaml created${NC}"

# Create main README
cat > README.md << 'EOF'
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
EOF

echo -e "${GREEN}✓ README.md created${NC}"

# Create .labspace/compose.override.yaml
cat > .labspace/compose.override.yaml << 'EOF'
services:
  labspace:
    volumes:
      - ${CONTENT_PATH:-.}:/app/content:ro
    environment:
      - LABSPACE_DEV_MODE=true
EOF

echo -e "${GREEN}✓ .labspace files created${NC}"

# Create Guide 01
cat > 01-getting-started.md << 'EOF'
# 🎨 Getting Started

Welcome! You're about to build a real restaurant website using AI.

## What You'll Do

In the next 90 minutes, you'll:
1. Design your restaurant concept
2. Use AI to build the website  
3. Customize it to match your vision
4. Understand how containers power it all

No coding experience needed!

## Prerequisites

- Docker Desktop installed and running
- An AI assistant (Cursor, GitHub Copilot, Claude, etc.)
- Your imagination!

## Let's Begin

### Step 1: Open the Starter Template

```bash
cd starter-template
```

This folder contains a basic Next.js restaurant template.

### Step 2: Start Docker Containers

```bash
docker compose up
```

This starts:
- 🌐 Your website (port 3000)
- 🗄️ PostgreSQL database

### Step 3: Open Your Site

Visit: http://localhost:3000

You should see a basic restaurant website template.

###Step 4: Describe Your Restaurant

Open your AI assistant and tell it about your restaurant:

**Example:**
```
My restaurant is Rameshwaram Cafe. We serve authentic South Indian 
food - especially known for our filter coffee, crispy dosas, and 
soft idlis. I want warm orange colors like sunrise, and a 
traditional but modern feel.
```

**Your turn!** Describe:
- Restaurant name
- Type of food
- Special dishes
- Colors and atmosphere

### Step 5: Let AI Build It

Ask your AI:

```
Based on that description, customize the restaurant website in 
the starter-template folder. Update:
- Colors to match the theme
- Menu items with real dishes
- Homepage hero section
- About section with the restaurant story
```

### Step 6: See the Changes

Refresh http://localhost:3000

**Your restaurant website is coming to life!** 🎉

## What Just Happened?

- AI read your description
- Generated customized code
- Docker containers reloaded automatically
- Your site updated in real-time

This is **modern development**.

## Next Steps

Continue customizing! Ask AI to:
- Add more menu items
- Change the layout
- Add your photos
- Create new pages

**Ready for more?** Continue to the next guide!
EOF

echo -e "${GREEN}✓ Guide 01 created${NC}"

# Create Guide 02
cat > 02-customize-and-build.md << 'EOF'
# 🛠️ Customize and Build

Now let's make this site truly yours!

## Talking to Your Website

Instead of writing code, you TALK to AI:

**Examples:**
- "Make the menu cards bigger"
- "Add a 🌶️ emoji next to spicy items"
- "Change the button color to green"
- "Add a weekly specials section"

## Try These Changes

### Easy Customizations

**1. Update styling:**
```
Make all menu item cards have rounded corners and a subtle shadow
```

**2. Add interactive elements:**
```
Add a "Order Now" button that shows a phone number when clicked
```

**3. Personalize content:**
```
Add a footer with contact info: phone, address, and hours
```

### Add Features

**Weekly Specials:**
```
Add a "Today's Special" banner at the top that shows a different 
dish for each day of the week. Include day detection.
```

**Photo Gallery:**
```
Create a photo gallery page with a grid layout for food photos
```

**Contact Form:**
```
Add a contact form with name, email, and message fields
```

## Understanding the Stack

Open Docker Desktop and look at your containers:

```
Containers:
├─ starter-template-web-1 (Your Next.js site)
└─ starter-template-db-1 (PostgreSQL database)
```

### What's Running?

**Web Container:**
- Next.js app on Node.js 20
- Auto-reloads when you change files
- Serves your site on port 3000

**Database Container:**
- PostgreSQL 16
- Stores your menu items
- Persistent data (survives restarts)

### Container Magic

Watch Docker Desktop while you make changes:
- Files update
- Containers detect changes
- Site reloads automatically
- No manual restart needed!

## Challenge Time

Pick ONE feature and build it:

**Option 1: Online Ordering**
```
Add a "Order Online" button that opens WhatsApp with a 
pre-filled message: "Hi! I'd like to order from [restaurant name]"
```

**Option 2: Reservations**
```
Create a reservation form that collects: name, date, time, 
party size, and special requests
```

**Option 3: Reviews Section**
```
Add a customer reviews section with 5-star ratings and 
testimonials
```

## Tips for Success

### Be Specific
❌ "Make it better"
✅ "Add padding to menu cards and increase font size to 18px"

### Iterate
Make small changes, see results, then continue.

### Reference Files
"In the Menu component (components/Menu.tsx), change the layout to 3 columns"

## Troubleshooting

**Changes not showing?**
- Hard refresh: `Cmd+Shift+R` or `Ctrl+Shift+R`
- Check terminal for errors
- Restart: `docker compose restart`

**Containers not running?**
```bash
docker compose down
docker compose up
```

**Database issues?**
```bash
# Reset database
docker compose down -v
docker compose up
```

## What You're Learning

- AI can modify code, not just create it
- Containers provide consistent environments
- Docker handles complexity automatically
- Modern dev is iterative and fast

**Next:** Learn how containers work!
EOF

echo -e "${GREEN}✓ Guide 02 created${NC}"

# Create Guide 03
cat > 03-understanding-containers.md << 'EOF'
# 💡 Understanding Containers

Your site works! Let's understand WHY containers make this possible.

## The Container Story

### The Old Way (❌ Problems)

```
You: "My code works!"
Friend: "Doesn't work for me..."

Problems:
- Different Node.js versions
- Missing dependencies  
- Different operating systems
- "Works on my machine" syndrome
```

### The Container Way (✅ Solution)

```
You: "Here's my container"
Friend: "Works perfectly!"

Why:
- Same environment everywhere
- All dependencies included
- OS doesn't matter
- Reproducible and reliable
```

## What IS a Container?

Think of containers like **shipping containers**:

**Shipping Container:**
- Standard size and shape
- Holds anything (furniture, food, etc.)
- Works on any ship, train, or truck
- Isolated from other containers

**Software Container:**
- Standard format (Docker)
- Holds app + dependencies
- Runs anywhere Docker runs
- Isolated from other apps

## Your Restaurant Site Architecture

### Local Development

```
Your Laptop
├── Docker Desktop
│   ├── Container: web
│   │   ├── Node.js 20
│   │   ├── Next.js
│   │   ├── Your code
│   │   └── Port 3000
│   │
│   └── Container: db
│       ├── PostgreSQL 16
│       ├── Your menu data
│       └── Port 5432
│
└── They talk to each other automatically!
```

### What's Inside Each Container?

**Web Container:**
```
FROM node:20-alpine

Contents:
├── Operating System (Alpine Linux)
├── Node.js runtime
├── npm packages
│   ├── next
│   ├── react
│   └── 200+ dependencies
├── Your application code
└── Configuration files
```

**Database Container:**
```
FROM postgres:16-alpine

Contents:
├── PostgreSQL database
├── Your restaurant data
└── Persistent storage
```

## Experiment 1: Container Isolation

### Test: Break One Container

1. **Stop the web container:**
```bash
docker stop starter-template-web-1
```

2. **Database still runs:**
```bash
docker ps
# You'll see db-1 still running
```

3. **Restart web:**
```bash
docker compose up
# Web comes back, connects to db automatically
```

**What this shows:** Containers are independent!

## Experiment 2: Data Persistence

### Test: Delete Everything, Data Survives

1. **Check your menu items** at http://localhost:3000

2. **Stop and remove containers:**
```bash
docker compose down
```

3. **Start again:**
```bash
docker compose up
```

4. **Menu items still there!**

**Why?** Docker volumes persist data even when containers are deleted.

```bash
# See your volumes
docker volume ls

# Your data lives here
starter-template_postgres_data
```

## Experiment 3: Share with Others

### Make Your Site Accessible on Network

1. **Find your IP:**
```bash
# Mac/Linux
ipconfig getifaddr en0

# Windows
ipconfig | findstr IPv4
```

2. **Update docker-compose.yml:**
```yaml
services:
  web:
    ports:
      - "0.0.0.0:3000:3000"  # Changed from "3000:3000"
```

3. **Restart:**
```bash
docker compose down
docker compose up
```

4. **Share your IP:**
```
http://YOUR-IP:3000
Example: http://192.168.1.100:3000
```

**Others on your WiFi can now visit your site!**

Perfect for:
- Workshop demos
- Showing to friends
- Testing on phones
- Team collaboration

## The docker-compose.yml Explained

```yaml
services:
  web:
    build: .              # Build from Dockerfile
    ports:
      - "3000:3000"      # Map container port to host
    environment:
      - DATABASE_URL=... # Connection string
    depends_on:
      - db              # Wait for database

  db:
    image: postgres:16  # Use official image
    environment:
      - POSTGRES_DB=restaurant
    volumes:
      - postgres_data:/var/lib/postgresql/data
```

**Single command does all this:**
```bash
docker compose up
```

## Key Container Concepts

### 1. Images vs Containers

**Image** = Recipe (template)
**Container** = Running instance

```bash
# See images (templates)
docker images

# See containers (running instances)
docker ps
```

### 2. Volumes

Persistent storage that survives container deletion:

```bash
# List volumes
docker volume ls

# Inspect a volume
docker volume inspect starter-template_postgres_data
```

### 3. Networks

Containers on same network can talk to each other:

```bash
# See networks
docker network ls

# Your containers are on: starter-template_default
```

### 4. Port Mapping

```
Container Port 3000 → Host Port 3000
Container is isolated, but you can access via localhost:3000
```

## Real-World Applications

### This Restaurant Site

- ✅ Development: Docker Compose
- ✅ Same everywhere: Containers
- ✅ Easy sharing: Network access
- ✅ Data persists: Volumes

### Professional Use

**Netflix:**
- Millions of containers
- Each show/feature isolated
- Auto-scaling based on demand

**Spotify:**
- Microservices in containers
- Deploy independently
- Rollback if issues

**Your Future Projects:**
- Same workflow!
- Professional infrastructure
- Local development
- Easy collaboration

## Commands Cheat Sheet

```bash
# Start everything
docker compose up

# Start in background
docker compose up -d

# Stop everything
docker compose down

# Stop and remove volumes (fresh start)
docker compose down -v

# View logs
docker compose logs

# Follow logs
docker compose logs -f

# List running containers
docker ps

# List all containers
docker ps -a

# Restart a service
docker compose restart web

# Rebuild after Dockerfile changes
docker compose up --build
```

## What You've Learned

✅ What containers are and why they matter
✅ How your app architecture works
✅ Container isolation and networking
✅ Data persistence with volumes
✅ How to share your site locally
✅ Professional development workflows

**You're not just using Docker - you understand it!**

## Bonus: Workshop Scenarios

### Scenario 1: Break & Fix

Intentionally break something:
```javascript
// Add syntax error
const broken = "missing quote
```

Watch it fail, fix it, watch it recover!

### Scenario 2: Multiple People, Same Code

Everyone in the workshop:
1. Clone the same repo
2. Run `docker compose up`
3. Everyone's site works identically!

No "works on my machine" problems!

### Scenario 3: Database Experiments

Try modifying data directly:
```bash
# Access database
docker exec -it starter-template-db-1 psql -U postgres -d restaurant

# Run SQL
SELECT * FROM menu_items;
```

Change data, see it in the app immediately!

## Next Steps

You've built a real application and understand containers!

What will you build next?
- Portfolio website
- Blog
- E-commerce site
- Community hub
- Anything you can imagine!

**Keep learning:**
- [Docker Docs](https://docs.docker.com)
- [Collabnix](https://collabnix.com)
- [Community Discord](https://discord.gg/collabnix)

**Thanks for completing this Labspace!** 🎉
EOF

echo -e "${GREEN}✓ Guide 03 created${NC}"

# Create starter template files
cat > starter-template/package.json << 'EOF'
{
  "name": "restaurant-builder",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start"
  },
  "dependencies": {
    "next": "14.2.0",
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "pg": "^8.11.3"
  },
  "devDependencies": {
    "@types/node": "^20",
    "@types/react": "^18",
    "autoprefixer": "^10.4.19",
    "postcss": "^8.4.38",
    "tailwindcss": "^3.4.3",
    "typescript": "^5"
  }
}
EOF

cat > starter-template/docker-compose.yml << 'EOF'
services:
  web:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
      - DATABASE_URL=postgresql://postgres:password@db:5432/restaurant
    depends_on:
      - db
    volumes:
      - ./app:/app/app
      - ./components:/app/components
      - ./public:/app/public
    command: npm run dev

  db:
    image: postgres:16-alpine
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=password
      - POSTGRES_DB=restaurant
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
EOF

cat > starter-template/Dockerfile << 'EOF'
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "run", "dev"]
EOF

cat > starter-template/next.config.js << 'EOF'
/** @type {import('next').NextConfig} */
const nextConfig = {}
module.exports = nextConfig
EOF

cat > starter-template/.gitignore << 'EOF'
node_modules
.next
.env*.local
EOF

mkdir -p starter-template/app
cat > starter-template/app/layout.tsx << 'EOF'
import './globals.css'

export const metadata = {
  title: 'Restaurant Name',
  description: 'Delicious food',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
EOF

cat > starter-template/app/page.tsx << 'EOF'
export default function Home() {
  return (
    <main className="min-h-screen p-8">
      <h1 className="text-4xl font-bold mb-4">Welcome to Your Restaurant</h1>
      <p className="text-xl">Use AI to customize this template!</p>
    </main>
  )
}
EOF

cat > starter-template/app/globals.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;
EOF

cat > starter-template/tailwind.config.js << 'EOF'
module.exports = {
  content: ['./app/**/*.{js,ts,jsx,tsx}', './components/**/*.{js,ts,jsx,tsx}'],
  theme: { extend: {} },
  plugins: [],
}
EOF

cat > starter-template/tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [{"name": "next"}],
    "paths": {"@/*": ["./*"]}
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
EOF

cat > starter-template/postcss.config.js << 'EOF'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

cat > starter-template/README.md << 'EOF'
# Restaurant Website Starter

## Quick Start

```bash
docker compose up
```

Open http://localhost:3000

Use AI to customize!
EOF

cat > .gitignore << 'EOF'
.DS_Store
node_modules/
.next/
.env*.local
*.log
EOF

cat > LICENSE << 'EOF'
Apache License 2.0
Copyright 2026 Ajeet Singh Raina
EOF

echo -e "${GREEN}✓ All files created${NC}"
echo ""
echo -e "${GREEN}═══════════════════════════════════${NC}"
echo -e "${GREEN}✓ Simple Labspace setup complete!${NC}"
echo -e "${GREEN}═══════════════════════════════════${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo ""
echo "1. Initialize git:"
echo "   git init && git add . && git commit -m 'Initial commit'"
echo ""
echo "2. Run the Labspace:"
echo "   CONTENT_PATH=\$PWD docker compose -f oci://dockersamples/labspace-content-dev -f .labspace/compose.override.yaml up"
echo ""
echo "3. Or just start building:"
echo "   cd starter-template && docker compose up"
echo ""
echo -e "${GREEN}🎉 Ready!${NC}"
