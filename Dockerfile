FROM python:2.7-slim

WORKDIR /app

# Install system dependencies for pywinauto
RUN apt-get update && apt-get install -y python-dev build-essential && apt-get clean -y

# Install pywinauto
RUN pip install pywinauto

# Install other dependencies using pip
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy your application code (excluding templates)
COPY . .  # This copies everything except the templates folder

# Copy templates folder separately
COPY templates/ .  # This copies the templates folder to /app/templates

# Expose any ports your application uses (replace with your port if needed)
EXPOSE 5000

# Define the default command (assuming app.py is your Flask application entry point)
CMD [ "python", "app.py" ]  # Replace with your actual entry point script if different
