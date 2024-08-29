# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Define environment variable (if needed)
ENV NAME World

# Run salary-calculator.py when the container launches
CMD ["python", "salary-calculator.py"]
