# Step 1: Use an official Nginx image as the base image
FROM nginx:alpine

# Step 2: Copy your local files into the Nginx container
COPY . /usr/share/nginx/html

# Step 3: Expose port 80 to make the web accessible
EXPOSE 80
