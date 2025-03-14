# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for Flask
EXPOSE 5000

# Run the application with the dev server
# CMD ["python", "app.py"]

# Run the app using Gunicorn (instead of Flask dev server)
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
