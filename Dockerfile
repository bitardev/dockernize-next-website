FROM node:18-alpine AS dev

# Install necessary dependencies for Alpine
RUN apk add --no-cache libc6-compat 

WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the application files
COPY . .

# Set environment to development
ENV NODE_ENV=development

# Expose the development port
EXPOSE 3000

# Set hostname for development
ENV HOSTNAME=0.0.0.0

# Run the development server
CMD ["npm", "run", "dev"]
