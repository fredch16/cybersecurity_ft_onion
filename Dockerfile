# Use an official Nginx base image
FROM nginx:latest

# Install necessary software
RUN apt-get update && apt-get install -y openssh-server tor

# Configure SSH and Tor (by copying configuration files)
COPY sshd_config /etc/ssh/sshd_config
RUN mkdir /var/run/sshd

COPY torrc /etc/tor/torrc

# Configure Nginx (by copying nginx config)
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static HTML page
COPY index.html /usr/share/nginx/html/index.html
COPY media /usr/share/nginx/html/media/

# Copy the start_services.sh script into the container
COPY start_services.sh /usr/local/bin/start_services.sh

# Make the script executable
RUN chmod +x /usr/local/bin/start_services.sh

# Set the script as the CMD to run when the container starts
CMD ["/usr/local/bin/start_services.sh"]


# add rewt password
RUN echo "root:0nionmakemecry" | chpasswd