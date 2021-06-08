##########################################################################################################
#
# DOT Core Server Dockerfile
#
# Prepare for Docker image build:
# - set correct configuration values in config/application.yml (uncomment iface license filepath)
#
# Build Docker image:
# docker build -t dot-core-server:tag .
#
# Run the container:
# docker container run -v /local/path/to/license/dir/:/srv/dot-core-server/license -p 9000:8080 dot-core-server:tag
#
# Alternative: Run the container with persisting log files in the local filesystem:
# docker container run -v /local/path/to/license/dir/:/srv/dot-core-server/license -v /local/path/to/logs/dir/:/srv/dot-core-server/logs -p 9000:8080 dot-core-server:tag
#
# Keep in mind that your IFace license file must be present in the folder /local/path/to/license/dir/.
#
##########################################################################################################

# Use an openjdk:11-jre-slim as a parent image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /srv/dot-core-server

# Copy IFace shared object file
COPY libiface.so.4.8.0 /srv/dot-core-server/iface/

# Copy IFace solvers
COPY solvers /srv/dot-core-server/iface/solvers

# Copy the DOT Core Server JAR file
COPY dot-core-server.jar /srv/dot-core-server

# Copy the application configuration file
COPY config/application.yml /srv/dot-core-server/

# Install necessary libraries and create a link to the library previously copied to our workdir
RUN apt-get update && apt-get install -y curl libusb-0.1 libgomp1 && ldconfig /srv/dot-core-server/iface/

# Make the port 8080 available outside this container
EXPOSE 8080

# Run DOT Core Server when the container launches
CMD java -jar dot-core-server.jar -Djna.library.path=/srv/dot-core-server/iface/
