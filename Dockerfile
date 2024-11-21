# Use a base image that includes GDAL
FROM ghcr.io/osgeo/gdal:ubuntu-small-3.10.0

# Install Python and other dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv

# Set environment variables for GDAL
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

# Create and activate a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . /code

# Set the working directory
WORKDIR /code

# Command to run your application
CMD ["python3", "manage.py", "runserver"]