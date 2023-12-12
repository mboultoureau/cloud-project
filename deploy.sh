# Check if parameters are provided (OS_AUTH_URL exists)
if [ -z "$OS_AUTH_URL" ]; then
    echo "Please source your OpenStack RC file first"
    exit 1
fi

# Check if docker is installed
if ! [ -x "$(command -v docker)" ]; then
    echo "Please install docker first"
    exit 1
fi

# Check if openstack is installed
if ! [ -x "$(command -v openstack)" ]; then
    echo "Please install openstack first"
    exit 1
fi

# Build and push docker image to docker hub
docker build -t 148.60.225.81:5000/iai3_10_backend:latest ./app/backend
docker push 148.60.225.81:5000/iai3_10_backend:latest

# Launch the stack
openstack stack create --template template.yaml cloud-project
