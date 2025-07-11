# Use Node.js 20 for compatibility
FROM node:20

# Create app directory
WORKDIR /app

# Install required system packages
RUN apt-get update && apt-get install -y \
  python3 make g++ && \
  rm -rf /var/lib/apt/lists/*

# Copy files
COPY . .

# Install dependencies
RUN yarn install

# Build the Strapi admin panel
RUN yarn build

# Expose the port Strapi will run on
EXPOSE 1337

# Start Strapi
CMD ["yarn", "start"]
