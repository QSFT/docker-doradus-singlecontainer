Doradus on Docker Quickstart
============================

This is a simple Docker example that demonstrates how to deploy and use Doradus (https://github.com/dell-oss/Doradus) as an Docker image.

- This experimental Docker image supports: 
	- A single server container for development
	- A single client container to run client tools such as cqlsh, nodetool, etc.



Running on Docker
----------------

1. Launch a container called doradus:

		docker run -p 1123:1123 -d --name doradus traduong1/docker-doradus-singlecontainer
   The -p option tells docker to bind port 1123 on the host (your laptop) to port 1123 in the container

2. Test

   Invoke this URL to list all applications under Doradus
   		http://<docker_host>:1123/_applications