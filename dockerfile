# Use a lightweight Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install Flask inside the container
RUN pip install flask

# Run the app
CMD ["python", "app.py"]
