 # Install Docker
 #
 'sudo apt-get update',
 'sudo apt-get install ca-certificates curl gnupg -y',
 'sudo mkdir -m 0755 -p /etc/apt/keyrings',
 'sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg',
 'sudo echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null',
 'sudo apt-get update',
 'sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y',
 'sudo docker run hello-world',
 'sudo systemctl enable docker',
 #
 ]
 
 #"sudo apt update",
 #"docker ps -a",
 #"sudo ls /root",
 #"docker ps -a"
