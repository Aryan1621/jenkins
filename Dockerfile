# Use the official Jenkins LTS image from Docker Hub
FROM jenkins/jenkins:lts

# Set the user to root to install additional packages
USER root

# Install necessary packages, e.g., Git, Docker CLI, etc.
RUN apt-get update && \
    apt-get install -y git docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Change back to the jenkins user
USER jenkins

# Copy any necessary configuration files or plugins (optional)
# COPY your-plugins.txt /usr/share/jenkins/ref/plugins.txt

# Install plugins (uncomment if you have a plugins.txt)
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Expose the default Jenkins port
EXPOSE 8080

# Define the entry point
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
