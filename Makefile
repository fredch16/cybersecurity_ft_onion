# Makefile to manage Docker containers for the project

# Define default image and container names
CONTAINER_NAME=ft_onion
NETWORK_NAME=ft_onion_network

# Build the Docker image and start containers
build:
	docker-compose up -d --build

# Stop the containers without removing them
stop:
	docker-compose stop

# Remove the containers and network
down:
	docker-compose down

# Show logs from the container
logs:
	docker logs $(CONTAINER_NAME)

# Rebuild and restart the containers
rebuild:
	down build

# Run the container in interactive mode (e.g., for debugging)
exec:
	docker exec -it $(CONTAINER_NAME) bash

# Restart the containers
restart:
	stop build

# Clean up by removing unused volumes, networks, and images
clean:
	docker system prune -f