# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json ./
RUN yarn install

# Copy application code
COPY . .

# Expose port
EXPOSE 3000

# Start the app
CMD ["yarn", "dev"]
