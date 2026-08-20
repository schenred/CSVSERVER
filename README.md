# CSVServer Docker Assignment - Part I Solution

## Steps:

### 1. Run the container initially (fails)
```bash
docker run -d --name csvserver infracloudio/csvserver:latest
docker logs csvserver

### 2. Create gencsv.sh script to create inputfile
``` bash
nano gencsv.sh
chmod +x gencsv.sh

### 3. Generate inputfile
``` bash
./gencsv.sh 2 8
cat inputFile

### 4. Run container with input file
``` bash
docker run -d --name csvserver -v $(pwd)/inputFile:/csvserver/inputdata -p 9393:9300 infracloudio/csvserver:latest
docker ps #should list the container as up with name csvserver

### 5. Check container and port
``` bash
docker exec -it csvserver sh
netstat -an | grep LISTEN
docker stop csvserver && docker rm csvserver

### 6. Rerun with environment variable using following command
``` bash
docker run -d --name csvserver \
  -v $(pwd)/inputFile:/csvserver/inputdata \
  -p 9393:9300 \
  -e CSVSERVER_BORDER=Orange \
  infracloudio/csvserver:latest

# i am sravani

