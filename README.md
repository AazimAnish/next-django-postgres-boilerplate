Next.js + Django + PostgreSQL Full Stack Boilerplate
====================================================

A complete full-stack application boilerplate with modern technologies and Docker containerization for seamless development across all platforms.

🛠️ Tech Stack
--------------

-   **Frontend**: Next.js - React framework with server-side rendering
-   **Backend**: Django - Python web framework with REST API
-   **Database**: PostgreSQL - Robust relational database
-   **Database Admin**: pgAdmin - Web-based PostgreSQL administration tool
-   **Containerization**: Docker & Docker Compose - Consistent development environment

📁 Project Structure
--------------------

```
project-root/
├── backend/                 # Django application
│   ├── manage.py           # Django management commands
│   ├── requirements.txt    # Python dependencies
│   ├── Dockerfile         # Backend container configuration
│   └── myproject/         # Django project files
├── frontend/              # Next.js application
│   ├── package.json       # Node.js dependencies
│   ├── Dockerfile        # Frontend container configuration
│   └── src/              # React components and pages
├── docker-compose.yml    # Multi-service orchestration
├── .env.example         # Environment variables template
├── .gitignore          # Git ignore rules
└── README.md           # This documentation

```

🔧 Prerequisites
----------------

### macOS

```
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Docker Desktop
brew install --cask docker

# Install Node.js (for local development)
brew install node

# Install Python (for local development)
brew install python@3.11

```

### Windows

-   **Docker Desktop**: Download from [Docker Desktop for Windows](https://docs.docker.com/desktop/windows/install/)
-   **Node.js**: Download from [nodejs.org](https://nodejs.org/)
-   **Python**: Download from [python.org](https://python.org/)
-   **Git**: Download from [git-scm.com](https://git-scm.com/)

### Linux (Ubuntu/Debian)

```
# Update package index
sudo apt update

# Install Docker
sudo apt install docker.io docker-compose

# Add user to docker group (to run docker without sudo)
sudo usermod -aG docker $USER

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Python
sudo apt install python3 python3-pip

# Logout and login again for docker group changes to take effect

```

### Linux (CentOS/RHEL/Fedora)

```
# Install Docker
sudo dnf install docker docker-compose

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER

# Install Node.js
sudo dnf install nodejs npm

# Install Python
sudo dnf install python3 python3-pip

```

🚀 How to Run the Project
-------------------------

-   [Running with Docker Compose (all services)](https://claude.ai/chat/420844ac-0658-4b59-9e1b-56e80c34e0bd#-1-run-all-services-with-docker-compose)
-   [Running frontend standalone](https://claude.ai/chat/420844ac-0658-4b59-9e1b-56e80c34e0bd#-2-run-frontend-standalone)
-   [Running backend standalone](https://claude.ai/chat/420844ac-0658-4b59-9e1b-56e80c34e0bd#%EF%B8%8F-3-run-backend-standalone)

### 🧩 1. Run All Services with Docker Compose

```
docker compose up --build

```

This starts:

-   PostgreSQL (db)
-   Django backend (backend)
-   Next.js frontend (frontend)
-   pgAdmin (pgadmin)

with live reload, environment variables, and proper linking.

### 🌐 2. Run Frontend Standalone

📦 **Build the image:**

```
docker build -t my-frontend ./frontend

```

▶️ **Run it with live reload:**

```
docker run --rm -it\
  -v "$PWD/frontend":/app\
  -v /app/node_modules\
  -p 3000:3000\
  --env-file .env\
  my-frontend\
  sh -c "npm install && npm run dev"

```

### 🖥️ 3. Run Backend Standalone

📦 **Build the image:**

```
docker build -t my-backend ./backend

```

▶️ **Run it:**

```
docker run --rm -it\
  -v "$PWD/backend":/app\
  -p 8000:8000\
  --env-file .env\
  my-backend\
  sh -c "python manage.py runserver 0.0.0.0:8000"

```

⚠️ **Ensure PostgreSQL is running separately (via Compose or container) when using the backend.**

🚀 First Time Setup
-------------------

### 1\. Clone the Repository

```
# Clone the project
git clone https://github.com/AazimAnish/next-django-postgres-boilerplate.git

# Navigate to project directory
cd next-django-postgres-boilerplate

```

### 2\. Environment Configuration

```
# Copy environment template
cp .env.example .env

# Edit environment variables (optional for development)
# nano .env  # Linux/macOS
# notepad .env  # Windows

```

### 3\. Build and Start Services

```
# Build and start all services (first time setup)
docker-compose up --build

# Alternative: Run in background (detached mode)
docker-compose up --build -d

```

This command will:

-   🐘 Start PostgreSQL database container
-   🐍 Build and start Django backend container
-   ⚛️ Build and start Next.js frontend container
-   🛠️ Start pgAdmin container for database administration
-   🌐 Set up networking between services

💡 **Note**: If you encounter frontend build issues (e.g., lightningcss errors), try:

```
docker-compose exec frontend npm install
docker-compose restart frontend

```

### 4\. Initial Database Setup

```
# Run Django migrations (creates database tables)
docker-compose exec backend python manage.py migrate

# Create Django superuser (for admin access)
docker-compose exec backend python manage.py createsuperuser

# Load initial data (if any fixtures exist)
docker-compose exec backend python manage.py loaddata initial_data.json

```

🌐 Access Your Application
--------------------------

-   **Frontend (Next.js)**: http://localhost:3000
-   **Backend API (Django)**: http://localhost:8000
-   **Django Admin**: http://localhost:8000/admin
-   **pgAdmin**: http://localhost:5050
-   **Database**: localhost:5432 (accessible via database clients)

📋 Daily Development Commands
-----------------------------

### When to Use Build vs Up

**Use `docker-compose up --build` when:**

-   First time setup
-   Added new npm packages to package.json
-   Added new Python packages to requirements.txt
-   Modified Dockerfile configurations
-   Added new environment variables that affect build process

**Use `docker-compose up` when:**

-   Just starting existing containers
-   Added new pages/components (no new dependencies)
-   Made code changes that don't require new packages
-   Regular daily development startup

### Starting the Application

```
# First time or after adding new packages
docker-compose up --build

# Regular startup (after first setup)
docker-compose up

# Start in background
docker-compose up -d

```

### Stopping the Application

```
# Stop all services
docker-compose down

# Stop and remove volumes (resets database)
docker-compose down -v

```

### Viewing Logs

```
# View logs from all services
docker-compose logs -f

# View logs from specific service
docker-compose logs -f backend    # Django logs
docker-compose logs -f frontend   # Next.js logs
docker-compose logs -f db         # PostgreSQL logs
docker-compose logs -f pgadmin    # pgAdmin logs

```

### Database Operations

```
# Run new migrations after model changes
docker-compose exec backend python manage.py makemigrations
docker-compose exec backend python manage.py migrate

# Access Django shell for database queries
docker-compose exec backend python manage.py shell

# Access PostgreSQL directly
docker-compose exec db psql -U postgres -d mydb

```

### Development Helpers

```
# Install new Python packages (requires rebuild)
docker-compose exec backend pip install package-name
# Then add to requirements.txt and run:
docker-compose up --build backend

# Install new Node.js packages (requires rebuild)
docker-compose exec frontend npm install package-name
# Then run:
docker-compose up --build frontend

# Restart specific service after code changes (no new packages)
docker-compose restart backend
docker-compose restart frontend

# Rebuild specific service after adding packages
docker-compose build backend
docker-compose build frontend

```

### Common Development Workflows

**Adding a new Django model:**

```
# 1. Create/modify models in Django
# 2. Generate migration
docker-compose exec backend python manage.py makemigrations

# 3. Apply migration
docker-compose exec backend python manage.py migrate

# 4. No rebuild needed - just restart if needed
docker-compose restart backend

```

**Adding a new Next.js page/component:**

```
# 1. Create new pages/components
# 2. No rebuild needed - hot reload handles it automatically
# 3. Only restart if experiencing issues
docker-compose restart frontend

```

**Adding a new Python package:**

```
# 1. Add to requirements.txt
# 2. Rebuild backend container
docker-compose up --build backend

```

**Adding a new npm package:**

```
# 1. Add to package.json or install directly
docker-compose exec frontend npm install package-name

# 2. Rebuild frontend container
docker-compose up --build frontend

```

🔍 Local Development (Without Docker)
-------------------------------------

### Backend Setup

```
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
source venv/bin/activate  # macOS/Linux
venv\Scripts\activate     # Windows

# Install dependencies
pip install -r requirements.txt

# Run migrations
python manage.py migrate

# Start development server
python manage.py runserver

```

### Frontend Setup

```
cd frontend

# Install dependencies
npm install

# Start development server
npm run dev

```

☁️ EC2 Setup (AWS Deployment)
-----------------------------

### Prerequisites

-   AWS EC2 instance (e.g., Ubuntu 20.04)
-   SSH access to the instance
-   Security group allowing ports: 3000 (Next.js), 8000 (Django), 5050 (pgAdmin), 5432 (PostgreSQL)

### Steps

1.  **SSH into EC2 Instance**

```
ssh -i your-key.pem ubuntu@your-ec2-public-ip

```

1.  **Install Dependencies**

```
sudo apt update
sudo apt install docker.io docker-compose git -y
sudo usermod -aG docker $USER
# Logout and log back in

```

1.  **Clone Repository**

```
git clone https://github.com/AazimAnish/next-django-postgres-boilerplate.git
cd next-django-postgres-boilerplate

```

1.  **Configure Environment**

```
cp .env.example .env
nano .env  # Update with production values (e.g., DATABASE_URL, SECRET_KEY)

```

1.  **Run Application**

```
docker-compose up --build -d

```

1.  **Access Application**

-   Frontend: http://<ec2-public-ip>:3000
-   Backend API: http://<ec2-public-ip>:8000
-   pgAdmin: http://<ec2-public-ip>:5050

💡 **Tip**: For production, consider using a reverse proxy (e.g., Nginx) and securing with SSL (e.g., Let's Encrypt).

⚠️ Troubleshooting
------------------

### Common Issues & Solutions

**Container won't start after adding packages:**

```
# Solution: Rebuild the container
docker-compose up --build [service-name]

# Or rebuild all containers
docker-compose up --build

```

**Database migration errors:**

```
# Check if database is running
docker-compose ps

# Reset migrations (WARNING: destroys data)
docker-compose exec backend python manage.py migrate --fake-initial

# Or reset entire database
docker-compose down -v
docker-compose up -d

```

**"Port already in use" errors:**

```
# Check what's using the port
lsof -i :3000  # Replace with your port (macOS/Linux)
netstat -ano | findstr :3000  # Windows

# Kill the process or change port in docker-compose.yml

```

**Code changes not reflecting:**

```
# For Django (no hot reload by default)
docker-compose restart backend

# For Next.js (should auto-reload, if not)
docker-compose restart frontend

# Check if volumes are properly mounted in docker-compose.yml

```

### Port Conflicts

**PostgreSQL (Port 5432):**

```
# macOS - Stop local PostgreSQL
brew services stop postgresql

# Linux - Stop local PostgreSQL
sudo service postgresql stop

# Windows - Stop PostgreSQL service via Services app
# Or kill process: taskkill /f /im postgres.exe

```

**Django (Port 8000) / Next.js (Port 3000) / pgAdmin (Port 5050):**

```
# Find process using port
lsof -i :8000  # macOS/Linux
netstat -ano | findstr :8000  # Windows

# Kill process
kill -9 <PID>  # macOS/Linux
taskkill /f /pid <PID>  # Windows

```

### Docker Issues

```
# Reset Docker environment completely
docker-compose down -v
docker system prune -a

# Rebuild everything from scratch
docker-compose build --no-cache
docker-compose up

```

### Permission Issues (Linux/EC2)

```
# Fix file permissions
sudo chown -R $USER:$USER .

# Ensure Docker group membership
sudo usermod -aG docker $USER
# Logout and login again

```

### Frontend Crashes & Build Issues

**lightningcss or node_modules errors**: If you're seeing errors like:

```
Error: lightningcss failed to build
Error: ENOENT: no such file or directory, open '.../node_modules/...'

```

**Solution:**

```
# Remove any existing node_modules on host (if any)
rm -rf frontend/node_modules

# Reinstall dependencies inside container
docker-compose exec frontend npm install

# Restart the frontend container
docker-compose restart frontend

# If issues persist, rebuild the container
docker-compose build frontend
docker-compose up frontend

```

🛠️ Development Tips
--------------------

### Hot Reloading

-   **Next.js**: Automatically reloads on file changes
-   **Django**: Restart backend container after Python file changes
-   **Database**: Persist data using Docker volumes

### Environment Variables

Edit `.env` file for configuration:

```
# Database
DATABASE_URL=postgresql://postgres:password@db:5432/mydb

# Django
DEBUG=True
SECRET_KEY=your-secret-key

# Next.js
NEXT_PUBLIC_API_URL=http://localhost:8000

```

### Adding New Services

Modify `docker-compose.yml` to add services like Redis, Celery, or Nginx.

📦 Production Deployment
------------------------

### Build Production Images

```
# Build optimized production images
docker-compose -f docker-compose.prod.yml build

# Deploy to production
docker-compose -f docker-compose.prod.yml up -d

```

### Environment Setup

-   Set production environment variables
-   Configure reverse proxy (Nginx)
-   Set up SSL certificates
-   Configure database backups

🤝 Contributing
---------------

1.  Fork the repository
2.  Create feature branch: `git checkout -b feature-name`
3.  Commit changes: `git commit -am 'Add feature'`
4.  Push branch: `git push origin feature-name`
5.  Submit pull request

📄 License
----------

This project is open source and available under the MIT License.

🆘 Support
----------

-   **Documentation**: Check the official docs for [Next.js](https://nextjs.org/docs), [Django](https://docs.djangoproject.com/), and [PostgreSQL](https://www.postgresql.org/docs/)
-   **Issues**: Report bugs via [GitHub Issues](https://github.com/AazimAnish/next-django-postgres-boilerplate/issues)