# Use an official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the React app
RUN npm run build

# Install serve to run the application
RUN npm install -g serve

# Set the command to serve the app
CMD ["serve", "-s", "build"]

# Expose the port the app runs on
EXPOSE 3000
