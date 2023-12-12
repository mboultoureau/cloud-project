# Build and push docker image to docker hub
docker build -t 148.60.225.81:5000/iai3_10_backend:latest ./backend
docker push 148.60.225.81:5000/iai3_10_backend:latest

# Launch the stack
openstack stack create --template template.yaml cloud-project
