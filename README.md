# Gazo-san-report

https://hub.docker.com/repository/docker/aa332266/gazo-san-report

# What is gazo-san-report
Gazo-san-report is a report tool for visual testing between two URLs. Report page will automatically show in a simple webpage by nginx using port 80.

It's useful for checking web application between different environment. For example, checking differences between development environment and production environment.
## Usage
Start docker container by passing the target URLs in environment variables.

```
docker run -it -d -p 8080:80 --env BaseURL="https://www.google.com/?hl=ja" --env CompareURL="https://www.google.com/?hl=en" aa332266/gazo-san-report:latest
```

## Check the report
Open localhost with the port set by the previous command.

http://localhost:8080/

![report_example](docs/assets/report_example.png)

## Built With
Difference detects by [gazo-san](https://github.com/lifull-dev/Gazo-san)

Web screen shot by [puppeteer](https://github.com/puppeteer/puppeteer)