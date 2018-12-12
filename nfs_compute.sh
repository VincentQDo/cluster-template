sudo mkdir /scratch
while [ ! -f /scratch/storage.done ]
do
  sleep 5
  sudo mount -t nfs 192.168.1.3:/scratch /scratch
done

sudo mkdir /software
while [ ! -f /software/head.done ]
do
  sleep 5
  sudo mount -t nfs 192.168.1.1:/software /software
done

sudo chmod 755 /local/repository/default_path.sh
sudo /local/repository/default_path.sh
