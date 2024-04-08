wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
tar -xf ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
chmod +x ngrok > /dev/null 2>&1
./ngrok config add-authtoken 2UEc6WUEbjbA3JpjmWfem5IZFzK_6EyQFfMJ1amaocetmur7q > /dev/null 2>&1
./ngrok tcp 22 &>/dev/null &
echo "======================="
echo Updating Please Wait
echo "======================="
apt install openssh-server > /dev/null 2>&1
mkdir -p /var/run/sshd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
echo "export LD_LIBRARY_PATH" >> /root/.bashrc
sudo service ssh start
echo "===================================="
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo create root password
passwd
echo "===================================="
