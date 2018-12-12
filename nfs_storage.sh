sudo systemctl enable nfs-server.service
sudo systemctl start nfs-server.service
sudo mkdir /scratch
sudo chmod -R 777 /scratch
sudo chown nfsnobody:nfsnobody /scratch
sudo mv /local/repository/xport_scratch /etc/exports
sudo chmod 777 /etc/exports
sudo exportfs -a
sudo touch /local/repository/storage.done
