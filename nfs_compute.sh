sleep 20m
sudo mkdir /software
sudo mount -t nfs 192.168.1.1:/software /software
sudo mkdir /scratch
sudo mount -t nfs 192.168.1.3:/scratch /scratch
sudo chmod 755 /local/repository/default_path.sh
sudo /local/repository/default_path.sh
