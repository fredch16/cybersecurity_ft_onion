#!/bin/bash
# Start SSH service
service ssh start

# Start Tor service
service tor start

# Start Nginx service (in the foreground)
nginx -g "daemon off;"
