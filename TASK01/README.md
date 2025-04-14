Firstly Developers write the Python and mention assocaiated requirements. 

Then, based on application - we create Dockerfile from these application files. 

Publish the image to a public container registry

Steps for Pushing Image-

firstly we need to login to docker

**docker login**

Then we need to build docker image from Dockerfile

**docker build -t sohamnewalkar/simpletimeservice:latest .**

Push the Dockerimage into repository

**docker push sohamnewalkar/simpletimeservice:latest**


For testing locally

**docker run -p 8080:8080 sohamnewalkar/simpletimeservice:latest**

we will get output

**curl http://localhost:8080**


