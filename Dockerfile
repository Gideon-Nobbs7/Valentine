# Use an official Node runtime as the base image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Install a simple server for serving static content
RUN npm install -g serve

EXPOSE 3000

# Serve the build directory
CMD ["serve", "-s", "dist", "-l", "3000"]