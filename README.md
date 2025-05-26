Next.js + Django + PostgreSQL Full Stack Boilerplate
====================================================

A complete full-stack application boilerplate with modern technologies and Docker containerization for seamless development across all platforms.

🛠️ Tech Stack
--------------

-   **Frontend**: [Next.js](https://nextjs.org/) - React framework with server-side rendering
-   **Backend**: [Django](https://www.djangoproject.com/) - Python web framework with REST API
-   **Database**: [PostgreSQL](https://www.postgresql.org/) - Robust relational database
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

bash

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

1.  **Docker Desktop**: Download from [Docker Desktop for Windows](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)
2.  **Node.js**: Download from [nodejs.org](https://nodejs.org/en/download/)
3.  **Python**: Download from [python.org](https://www.python.org/downloads/windows/)
4.  **Git**: Download from [git-scm.com](https://git-scm.com/download/win)

### Linux (Ubuntu/Debian)

bash

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

bash

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

🚀 First Time Setup
-------------------

### 1\. Clone the Repository

bash

```
# Clone the project
git clone https://github.com/AazimAnish/next-django-postgres-boilerplate.git

# Navigate to project directory
cd next-django-postgres-boilerplate
```

### 2\. Environment Configuration

bash

```
# Copy environment template
cp .env.example .env

# Edit environment variables (optional for development)
# nano .env  # Linux/macOS
# notepad .env  # Windows
```

### 3\. Build and Start Services

bash

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
-   🌐 Set up networking between services

### 4\. Initial Database Setup

bash

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

-   **Frontend (Next.js)**: <http://localhost:3000>
-   **Backend API (Django)**: <http://localhost:8000>
-   **Django Admin**: <http://localhost:8000/admin>
-   **Database**: localhost:5432 (accessible via database clients)

📋 Daily Development Commands
-----------------------------

### Starting the Application

bash

```
# Start all services (after first setup)
docker-compose up

# Start in background
docker-compose up -d
```

### Stopping the Application

bash

```
# Stop all services
docker-compose down

# Stop and remove volumes (resets database)
docker-compose down -v
```

### Viewing Logs

bash

```
# View logs from all services
docker-compose logs -f

# View logs from specific service
docker-compose logs -f backend    # Django logs
docker-compose logs -f frontend   # Next.js logs
docker-compose logs -f db         # PostgreSQL logs
```

### Database Operations

bash

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

bash

```
# Install new Python packages
docker-compose exec backend pip install package-name
# Then add to requirements.txt

# Install new Node.js packages
docker-compose exec frontend npm install package-name

# Restart specific service after changes
docker-compose restart backend
docker-compose restart frontend

# Rebuild specific service
docker-compose build backend
docker-compose build frontend
```

🔍 Local Development (Without Docker)
-------------------------------------

### Backend Setup

bash

```
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
source venv/bin/activate  # macOS/Linux
# venv\Scripts\activate   # Windows

# Install dependencies
pip install -r requirements.txt

# Run migrations
python manage.py migrate

# Start development server
python manage.py runserver
```

### Frontend Setup

bash

```
cd frontend

# Install dependencies
npm install

# Start development server
npm run dev
```

⚠️ Troubleshooting
------------------

### Port Conflicts

**PostgreSQL (Port 5432)**

bash

```
# macOS - Stop local PostgreSQL
brew services stop postgresql

# Linux - Stop local PostgreSQL
sudo service postgresql stop

# Windows - Stop PostgreSQL service via Services app
# Or kill process: taskkill /f /im postgres.exe
```

**Django (Port 8000) / Next.js (Port 3000)**

bash

```
# Find process using port
lsof -i :8000  # macOS/Linux
netstat -ano | findstr :8000  # Windows

# Kill process
kill -9 <PID>  # macOS/Linux
taskkill /f /pid <PID>  # Windows
```

### Docker Issues

bash

```
# Reset Docker environment completely
docker-compose down -v
docker system prune -a

# Rebuild everything from scratch
docker-compose build --no-cache
docker-compose up
```

### Permission Issues (Linux)

bash

```
# Fix file permissions
sudo chown -R $USER:$USER .

# Ensure Docker group membership
sudo usermod -aG docker $USER
# Logout and login again
```

🛠️ Development Tips
--------------------

### Hot Reloading

-   **Next.js**: Automatically reloads on file changes
-   **Django**: Restart backend container after Python file changes
-   **Database**: Persist data using Docker volumes

### Environment Variables

Edit `.env` file for configuration:

env

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

bash

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

This project is open source and available under the [MIT License](LICENSE).

🆘 Support
----------

-   **Documentation**: Check the official docs for [Next.js](https://nextjs.org/docs), [Django](https://docs.djangoproject.com/), and [PostgreSQL](https://www.postgresql.org/docs/)
-   **Issues**: Report bugs via GitHub Issues
