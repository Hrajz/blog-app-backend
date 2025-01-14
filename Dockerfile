# Use the official Python image from Docker Hub
FROM python:alpine

# Set the working directory inside the container
WORKDIR /app

# Copy only requirements first to leverage Docker's layer caching
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files
COPY . /app/

# Expose port 8000 for the application
EXPOSE 8000

# Set environment variable to ensure that Django doesn't create .pyc files
ENV PYTHONUNBUFFERED=1

# Default command to run migrations and start the server
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
