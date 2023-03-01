# A Container Based HTTP Server Written in C

*The orginal project can be found at: https://tinyhttpd.sourceforge.net/*

*Credits to: J. David Blackstone.*

*Modified by Dr. Peilong Li to fit the teaching purposes.*

## Task 1: Write a Makefile

Write a Makefile for the project so you can generate an execuatable named `httpd`. Then compile and run the program to see the results.

## Task 2: Write a Dockerfile

Write a Dockerfile so you can build the project into a docker image. There are a few tips;

1. Use `Ubuntu:20.04` as the base image
2. Add the following two lines to your file so you can set the time zone for the Apache2 server.
    ```
    ENV TZ=America/New_York
    RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
    ```
3. Ensure to install the following packages: `build-essential`, `apache2`, `libcgi-session-perl`.
4. Add the following two lines after all the packages are installed. They are used to enable the CGI module for your Apache2 server, and then restart the server.
    ```
    RUN ln -s /etc/apache2/mods-available/cgi.load /etc/apache2/mods-enabled/
    RUN service apache2 restart
    ```

## Task 3: Build the Docker Image and Run the App

1. Build the docker image and tag it as `tinyhttpd`, and give it a version number `0.1`.
2. Create a new container from the newly built image. Ensure to map the TCP port `55555` in the container to port `44444` on the Docker host (your GCP VM).
3. Open a web brower on your docker host (GCP VM), then open the web app from the docker container. 
4. A list of useful docker commands:
    ```
    # show the available images
    docker images 

    # Build a new docker image
    docker build -t <user_name>/<image_name>:<version_number>

    # Create a container and map the ports
    docker run --name <container_name> -p <host_port>:<container_port> -it <user_name>/<image_name>:<version_number>

    # Show all the running containers processes
    docker ps 

    # Show all the containers (use -a to show exited)
    docker container ls 

    # Find container's IP address
    docker inspect <container_id> | grep "IP" 

    # Stop a running container
    docker stop <container_id>

    # Start an exited container
    docker start -i <container_id>
    ```



