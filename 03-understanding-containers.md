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
