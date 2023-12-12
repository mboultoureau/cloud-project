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

# If the stack found and already exists, delete it, and wait for it to be deleted
if [ "$(openstack stack list -f value -c "Stack Name" | grep cloud-project)" ]; then
    openstack stack delete cloud-project
    while [ "$(openstack stack list -f value -c "Stack Name" | grep cloud-project)" ]; do
        sleep 1
    done
fi


# Build and push docker image to docker hub
docker build -t 148.60.225.81:5000/iai3_10_backend:latest ./app/backend
docker push 148.60.225.81:5000/iai3_10_backend:latest

# Launch the stack
openstack stack create --template template.yaml cloud-project

# Wait for the stack to be created
while [ "$(openstack stack show cloud-project -f value -c stack_status)" != "CREATE_COMPLETE" ]; do
    sleep 1
done

# Get IP
BACKEND_IP=$(openstack stack output show cloud-project backend_ip_address -f value -c output_value)
FRONTEND_IP=$(openstack stack output show cloud-project frontend_ip_address -f value -c output_value)

# Print IP
echo "Backend IP: $BACKEND_IP"
echo "Frontend IP: $FRONTEND_IP"