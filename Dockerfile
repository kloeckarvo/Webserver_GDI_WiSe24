# Dockerfile
FROM python:3.10-slim

# Set the working directory
WORKDIR /code

# Install dependencies
COPY requirements.txt /code/
RUN apt-get update && \
    apt-get install -y binutils libproj-dev gdal-bin && \
    pip install --no-cache-dir -r requirements.txt

# Copy the project files
COPY . /code/

# Expose the port the app runs on
EXPOSE 8000

# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]