FROM ubuntu:12.04

# Update packages and install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Install a specific version of pip (19.3.1 in this example)
RUN pip3 install --no-cache-dir pip==20.3.4

# Install Flask using pip
RUN pip3 install flask

# Copy the Flask application files to the container
COPY app.py /opt/

# Set the FLASK_APP environment variable
ENV FLASK_APP=/opt/app.py

# Set the entrypoint command to run the Flask application
ENTRYPOINT ["flask", "run", "--host=0.0.0.0", "--port=8080"]
