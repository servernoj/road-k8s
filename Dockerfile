# get our Python image 
FROM python:3.8
# activate default in-image directory
WORKDIR /app
# Copy entrypoint script
COPY conf/entrypoint.sh .
RUN chmod +x entrypoint.sh
# Run os-level updates 
RUN apt update
RUN apt install -y python3-venv python3-dev python3-pip
# Install redis-tools
RUN apt install -y redis-tools
# Create our Python virtual environment 
RUN python3 -m venv /opt/venv
# Update the virtual environment pip
RUN /opt/venv/bin/python -m pip install --upgrade pip
# Install our project dependencies
COPY ./src/requirements.txt .
RUN /opt/venv/bin/python -m pip install -r requirements.txt

# copy our local src folder to /app in the container 
COPY ./src .
# Run a server to expose copied files
CMD ["./entrypoint.sh"]