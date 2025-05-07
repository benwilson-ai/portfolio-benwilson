FROM node:20-alpine
WORKDIR /app

# Install pnpm
RUN npm install -g pnpm@latest

# Copy package files first
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy the rest of the application
COPY . .

# Set environment variables
ENV NODE_ENV=development
ENV PORT=3000

# Expose port
EXPOSE 3000

# Start the development server
CMD ["pnpm", "dev"]