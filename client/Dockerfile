# Use Node.js image
FROM node:24-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json* ./
RUN npm install

# Copy rest of the app
COPY . .

# Expose port and run
EXPOSE 3000
CMD ["npm", "run", "dev"]
