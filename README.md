## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Diagrams/ELK_Network_Diagram.jpeg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the install-elk.yml file may be used to install only certain pieces of it, such as Filebeat.

  - install-elk.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the Damn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balancers protect the availability of resources by balancing traffic and preventing the over saturation of end users on each resource.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system logs.
- Filebeat watches for changes in log files. This is useful for monitoring vital files for corruption or unauthorized editting.
- Metricbeat operates as a system monitor. CPU-usage, memory, filesystems, disk IO, and network IO are computer resources that can be compromised or high jacked /n
in a high threat situation. Monitoring these resources is important to detect detrimental changes or compromised resources.

The configuration details of each machine may be found below.

| Name                 | Function                         | IP Address/Private IP   | Operating System              |
|----------------------|----------------------------------|-------------------------|-------------------------------|
| Home Computer        | Base Machine                     | 192.168.1.0             | Windows 10 Home, Version 1903 |
| Jump-Box-Provisioner | Core VM and VM Modulator         | 13.88.8.203/10.0.0.4    | Ubuntu 18.04 LTS              |
| DVWA-VM1             | Hosts DVWA, generates log data   | 137.135.24.117/10.0.0.7 | Ubuntu 18.04 LTS              |
| DVWA-VW2             | Hosts DVWA, generates log data   | 168.62.10.162/10.0.0.8  | Ubuntu 18.04 LTS              |
| ELKPART2             | Hosts Kibana site, collects data | 13.77.145.77            | Ubuntu 18.04 LTS              |
|                      |                                  |                         |                               |
|                      |                                  |                         |                               |
|                      |                                  |                         |                               |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the ELK server virtual machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 13.88.8.203

Machines within the network can only be accessed by the Jump-Box-Provisioner.
- The only machine allowed to access the ELK VM is the Jump-Box-Provisioner at 13.88.8.203

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses                      |
|----------------------|---------------------|-------------------------------------------|
| Jump-Box-Provisioner | No                  | 184.59.148.140                            |
| DVWA-VM1             | No                  | 13.88.8.203                               |
| DVWA-VM2             | No                  | 13.88.8.203                               |
| ELKPART2             | Yes                 | 13.88.8.203, 184.59.148.140, the internet |
|                      |                     |                                           |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because configuration with ansible allows for a high through-put configurations of many machines without the risk of a non-uniform installation. Patches and moderation can be executed with the execution of a single playbook.

The playbook implements the following tasks:
- Configure the target VMs to use more memory (required for elk to provision sufficient RAM).
- Install docker.io
- Install python-pip
- Install docker
- Download sebp/elk container
- Start container to allow port mappings: 5601:5601, 9200:9200, 5044:5044

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/elk_container_on_server.jpeg)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- DVWA-VM1 137.135.24.117
- DVWA-VM2 168.62.10.162

We have installed the following Beats on these machines:
- Filebeat

These Beats allow us to collect the following information from each machine:
- Filebeat monitors common log files that are associated with vital functions and security. Should a significant alteration to a file occur or an execution is logged, the location and date are documented and displayed in the UI.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file into the directory: /etc/ansible/
- Update the ansible.cfg file to include:
remote_user = sysadmin
- Run the playbook, and navigate to the ELK server VM to check that the installation worked as expected. Allow a few minutes before deploying beats.

- Copy filebeat-playbook.yml to the directory: /etc/ansible/roles/
- Update the hosts file in ansible to configure which machines are provisioned with ELK or filebeat. Filebeat is installed under [webservers], ELK is installed under [elkservers].
- Navigate to < 13.77.145.77:5601 > to access ELK server kibana site.
# ELK
