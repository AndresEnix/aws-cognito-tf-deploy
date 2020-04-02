# node
(
    npm init -y &&
    npm install --save jwk-to-pem &&
    npm install --save jsonwebtoken &&
    npm install --save axios
)

# terraform
terraform init
terraform taint null_resource.local
terraform apply -auto-approve
