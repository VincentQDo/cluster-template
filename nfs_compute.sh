sudo mkdir /scratch
#the while loop is to check if the storage.done flag is present. This flag is present when the storage node is finished setting up the nfs folder /scratch. if it is not present then keep trying to mount the folder until it does.
while [ ! -f /scratch/storage.done ]
do
  sleep 5
  sudo mount -t nfs 192.168.1.3:/scratch /scratch
done

sudo mkdir /software
#same with the loop above
while [ ! -f /software/head.done ]
do
  sleep 5
  sudo mount -t nfs 192.168.1.1:/software /software
done

sudo chmod 755 /local/repository/default_path.sh
sudo /local/repository/default_path.sh
