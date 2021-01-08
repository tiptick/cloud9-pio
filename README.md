# cloud9-pio

This build is adding Platform IO to the Cloud9 docker image of Linuxserver


## Docker usage

This can be also in detail looked at (https://github.com/linuxserver/docker-cloud9) 

### Docker compose

Create the container via compose:

```yaml
version: "2.1"
services:
  cloud9-pio:
    image: tiptick/cloud9-pio:latest
    container_name: cloud9-pio
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - GITURL=https://github.com/linuxserver/docker-cloud9.git #optional
      - USERNAME= #optional
      - PASSWORD= #optional
    volumes:
      - /path/to/your/code:/code #optional
      - /var/run/docker.sock:/var/run/docker.sock #optional
    ports:
      - 8000:8000
    restart: unless-stopped    
```

## Platform IO

access cloud9 from (http://yourIP:8000) and follow instructions in (https://docs.platformio.org/en/latest/integration/ide/cloud9.html)

especially inside cloud9 create a buildsystem via Menu: Run > Build System > New Build System

```json
{
    "cmd" : ["pio", "run", "-d", "$file"],
    "info" : "Building $project_path/$file_name",
    "selector": "^.*\\.(cpp|c|h|hpp|S|ini|ino|pde)$"
}
```
