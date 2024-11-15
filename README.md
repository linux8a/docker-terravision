# Docker for Terravision

Docker Image for Terravision. Terravision creates Professional Cloud Architecture Diagrams from your Terraform code automatically. Supports AWS, Google and Azure.

## Quickstart
1. Clone the repo ``git clone https://github.com/linux8a/docker-terravision.git``
2. Get the working directory (full path) by doing `docker-terravision
3. Builds docker image ``sudo docker build -t linux8a/terravision:v1 -f Dockerfile . ``
4. Run `terravision` and specify your Terraform source files in the format:

``` sh
sudo docker run -it -v ${PWD}:/works/my-terraform-code --rm linux8a/terravision:v1 draw --source /works/my-terraform-code
```
5. View help use this command

```sh
sudo docker run --rm linux8a/terravision:v1 --help
```


## All command
```sh
git clone https://github.com/linux8a/docker-terravision.git
cd docker-terravision
sudo docker build -t linux8a/terravision:v1 -f Dockerfile . 
sudo docker run --rm linux8a/terravision:v1 --help
```


## Github for Terravision

https://github.com/patrickchugh/terravision/tree/main