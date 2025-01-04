# Step 1: Use an official Nginx image as the base image
FROM nginx:alpine

# Step 2: Copy the Nginx configuration file to configure Nginx to work as a reverse proxy
COPY nginx.conf /etc/nginx/nginx.conf

# Step 3: Install Python and necessary dependencies for Flask app
RUN apk add --no-cache python3 py3-pip && \
    pip3 install --no-cache-dir Flask gunicorn

# Step 4: Set the working directory inside the container
WORKDIR /app

# Step 5: Copy your Flask app and requirements into the container
COPY . /app

# Step 6: Install the Python dependencies for Flask
RUN pip3 install --no-cache-dir -r requirements.txt

# Step 7: Expose port 5000 for Flask app (Gunicorn will run on this port)
EXPOSE 5000

# Step 8: Run Flask app using Gunicorn, making sure it's accessible by Nginx
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
