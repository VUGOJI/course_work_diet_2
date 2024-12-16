# Use the official Node.js 18 base image
FROM node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the application script into the container
COPY server.js .

# Expose port 8080 to allow traffic
EXPOSE 8080

# Command to run your Node.js application
CMD ["node", "app.js"]

