sudo apt-get update
sudo apt-get install -y unzip
cd /home/ubuntu
rm -rf terraform_0.14.5_linux_amd64.zip
wget https://releases.hashicorp.com/terraform/0.14.5/terraform_0.14.5_linux_amd64.zip
unzip terraform_0.14.5_linux_amd64.zip
sudo mv terraform /usr/local/bin/
echo "Installed Terraform"
rm -rf terraform_0.14.5_linux_amd64.zip

mkdir deployAWS
cd deployAWS
rm -rf a1.tf
aws s3 sync s3://terraformconfigjan .
terraform init
terraform apply -auto-approve
echo "AWS Config Deployed"