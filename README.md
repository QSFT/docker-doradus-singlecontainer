Doradus on Docker Quickstart
============================

This is a simple Docker example that demonstrates how to deploy and use Doradus (https://github.com/dell-oss/Doradus) as an Docker image.

- This experimental Docker image supports: 
	- A single server container for development
	- A single client container to run Cassandra client tools such as cqlsh, nodetool, etc.



Running on Docker
----------------

1. Launch a container called ‘doradus’:

		docker run -p 1123:1123 -d --name doradus traduong1/docker-doradus-singleinstance
   The -p option tells docker to bind port 1123 on the host to port 1123 in the container

2. Test

   Invoke this URL to list all applications under Doradus

   		http://$docker_host:1123/_applications


   Connect to Cassandra DB in the ‘doradus’ container 

		docker inspect --format='{{.NetworkSettings.IPAddress}}' doradus
		
	You should see the IP of the single instance of Cassandra, for ex 172.17.0.14.

	Run the cqlsh tool using the IP
		
		docker run --rm -i -t traduong1/docker-doradus-singleinstance cqlsh 172.17.0.14

		cqlsh> describe keyspaces;

	You should see the ‘Doradus’ keyspace in Cassandra

		system  Doradus  system_traces
		