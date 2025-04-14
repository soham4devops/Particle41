# I am using standard Python slim image
FROM python:3.11-slim

# Create a non-root user
RUN adduser --disabled-password --gecos '' appuser

# Set working directory
WORKDIR /app

# Copy requirements and do installation
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY app.py .

# Using non-root user
USER appuser

# Expose port
EXPOSE 8080

# Start the app
CMD ["python", "app.py"]
