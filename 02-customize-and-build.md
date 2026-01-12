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
