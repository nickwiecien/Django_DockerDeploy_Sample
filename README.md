# Django_DockerDeploy_Sample

Sample Django application designed to be run from a docker container. Attached Dockerfile contains necessary commands to install Linux dependencies for pyodbc 4.0.30. 

To build and run the container execute the following commands from the root directory:

```
docker build . -t django_app

docker run -p 8000:8000 django_app
```