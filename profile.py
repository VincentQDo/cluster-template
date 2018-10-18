#version 2.1
# Import the Portal object.
import geni.portal as portal
# Import the ProtoGENI library.
import geni.rspec.pg as pg
import geni.rspec.igext as IG

# Create a portal context.
pc = portal.Context()

# Create a Request object to start building the RSpec.
request = pc.makeRequestRSpec()


tourDescription = \
"""
This profile provides the template for a full research cluster with head node, scheduler, compute nodes, and shared file systems.
First node (head) should contain: 
- Shared home directory using Networked File System
- Management server for SLURM
Second node (metadata) should contain:
- Metadata server for SLURM
Third node (storage):
- Shared software directory (/software) using Networked File System
Remaining three nodes (computing):
- Compute nodes  
"""

#
# Setup the Tour info with the above description and instructions.
#  
tour = IG.Tour()
tour.Description(IG.Tour.TEXT,tourDescription)
request.addTour(tour)

prefixForIP = "192.168.1."

link = request.LAN("lan")

for i in range(15):
  if i == 0:
    node = request.XenVM("head")
    node.routable_control_ip = "true"
    #enable and start the nfs server service
    node.addService(pg.Execute(shell="sh", command="sudo systemctl enable nfs-server.service"))
    node.addService(pg.Execute(shell="sh", command="sudo systemctl start nfs-server.service"))
    #create the nfs directory
    node.addService(pg.Execute(shell="sh", command="sudo mkdir /software"))
    node.addService(pg.Execute(shell="sh", command="sudo chmod -R 777 /software"))
    node.addService(pg.Execute(shell="sh", command="sudo chown nfsnobody:nfsnobody /software"))
    #delete the current empty exports and copy the new exports form github
    node.addService(pg.Execute(shell="sh", command="sudo mv /local/repository/xport_software /etc/exports"))
    #export the NFS shares directory
    node.addService(pg.Execute(shell="sh", command="sudo chmod 777 /etc/exports"))
    node.addService(pg.Execute(shell="sh", command="sudo exportfs -a"))
    node.addService(pg.Execute(shell="sh", command="sudo mkdir /scratch"))
    node.addService(pg.Execute(shell="sh", command="sudo chmod -R 777 /scratch"))
    node.addService(pg.Execute(shell="sh", command="sudo mount 192.168.1.3:/scratch /scratch"))
    node.addService(pg.Execute(shell="sh", command="sudo cp /local/repository/source/* /scratch"))
    #script to install mpi
    node.addService(pg.Execute(shell="sh", command="sudo chmod 755 /local/repository/install_mpi.sh"))
    node.addService(pg.Execute(shell="sh", command="sudo /local/repository/install_mpi.sh"))
    
  elif i == 1:
    node = request.XenVM("metadata")
  elif i == 2:
    node = request.XenVM("storage")
    node.addService(pg.Execute(shell="sh", command="sudo yum -y install nfs-utils"))
    #enable and start the nfs server service
    node.addService(pg.Execute(shell="sh", command="sudo systemctl enable nfs-server.service"))
    node.addService(pg.Execute(shell="sh", command="sudo systemctl start nfs-server.service"))
    #create the nfs directory
    node.addService(pg.Execute(shell="sh", command="sudo mkdir /scratch"))
    node.addService(pg.Execute(shell="sh", command="sudo chmod -R 777 /scratch"))
    node.addService(pg.Execute(shell="sh", command="sudo chown nfsnobody:nfsnobody /scratch"))
    #delete the current empty exports and copy the new exports form github
    node.addService(pg.Execute(shell="sh", command="sudo mv /local/repository/xport_scratch /etc/exports"))
    #export the NFS shares directory
    node.addService(pg.Execute(shell="sh", command="sudo chmod 777 /etc/exports"))
    node.addService(pg.Execute(shell="sh", command="sudo exportfs -a"))

  else:
    node = request.XenVM("compute-" + str(i-2))
    node.cores = 4
    node.ram = 4096
    #create a directory to mount the nfs shares into the client
    node.addService(pg.Execute(shell="sh", command="sudo mkdir /software"))
    node.addService(pg.Execute(shell="sh", command="sudo mount 192.168.1.1:/software /software"))
    node.addService(pg.Execute(shell="sh", command="sudo mkdir /scratch"))
    node.addService(pg.Execute(shell="sh", command="sudo mount 192.168.1.3:/scratch /scratch"))
    node.addService(pg.Execute(shell="sh", command="sudo chmod 755 /local/repository/default_path.sh"))
    node.addService(pg.Execute(shell="sh", command="sudo /local/repository/default_path.sh"))

    
  node.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops:CENTOS7-64-STD"
  
  iface = node.addInterface("if" + str(i))
  iface.component_id = "eth1"
  iface.addAddress(pg.IPv4Address(prefixForIP + str(i + 1), "255.255.255.0"))
  link.addInterface(iface)
      #code to deal with ssh issue
  #node.addService(pg.Execute(shell="sh", command="sudo chmod 755 /local/repository/ssh_setup.sh"))
  #node.addService(pg.Execute(shell="sh", command="sudo -H -u QD899836 bash -c '/local/repository/ssh_setup.sh'"))
  #node.addService(pg.Execute(shell="sh", command="sudo chmod 755 /local/repository/passwordless.sh"))
  #node.addService(pg.Execute(shell="sh", command="sudo /local/repository/passwordless.sh"))
  node.addService(pg.Execute(shell="sh", command="sudo chmod 755 /local/repository/passwordless.sh"))
  node.addService(pg.Execute(shell="sh", command="sudo /local/repository/passwordless.sh"))
  node.addService(pg.Execute(shell="sh", command="sudo chmod 755 /local/repository/install_mpi.sh"))
  node.addService(pg.Execute(shell="sh", command="sudo /local/repository/install_mpi.sh"))
  
  # This code segment is added per Benjamin Walker's solution to address the StrictHostKeyCheck issue of ssh
  node.addService(pg.Execute(shell="sh", command="sudo chmod 755 /local/repository/ssh_setup.sh"))
  node.addService(pg.Execute(shell="sh", command="sudo -H -u QD899836 bash -c '/local/repository/ssh_setup.sh'"))
 
  node.addService(pg.Execute(shell="sh", command="sudo su QD899836 -c 'cp /local/repository/source/* /users/QD899836'"))
# Print the RSpec to the enclosing page.
pc.printRequestRSpec(request)
