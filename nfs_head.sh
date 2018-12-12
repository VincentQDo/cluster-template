sudo systemctl enable nfs-server.service
sudo systemctl start nfs-server.service
sudo mkdir /software
sudo chmod -R 777 /software
sudo chown nfsnobody:nfsnobody /software
sudo mv /local/repository/xport_software /etc/exports
sudo chmod 777 /etc/exports
sudo exportfs -a
sleep 20m
sudo mkdir /scratch
sudo chmod -R 777 /scratch
sudo mount -t nfs 192.168.1.3:/scratch /scratch
sudo cp /local/repository/source/* /scratch

