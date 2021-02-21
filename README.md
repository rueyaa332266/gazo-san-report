# Gazo-san-report

https://hub.docker.com/repository/docker/aa332266/gazo-san-report


## Usage
```
# Start the container
docker run -it -d -p 8080:80 --env BaseURL=https://www.google.com/\?hl\=ja --env CompareURL=https://www.google.com/\?hl\=en aa332266/gazo-san-report:latest

# Check the report
http://localhost:8080/
```
## Deploy
```
docker build -t aa332266/gazo-san-report:latest .
docker push aa332266/gazo-san-report:latest
```
