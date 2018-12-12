#generate a munge key
/usr/sbin/create-munge-key -f
#make the group own the key file
chown -R munge:munge /etc/munge/munge.key
#change the permission to 400
sudo chmod 400 /etc/munge/munge.key
#copy the key file to scratch to allow other compute nodes to see it and copy it later
sudo cp /etc/munge/munge.key /scratch/
