## Alternative build steps
```
docker run --rm --platform linux/amd64 -it -v ${PWD}:/project -p 4400:4200 node:8 bash -c "cd project/ && npm install"
docker run --rm --platform linux/amd64 -it -v ${PWD}:/project -p 4400:4200 node:8 bash -c "cd project/ && npm run build"
```
