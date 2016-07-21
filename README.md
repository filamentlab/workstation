# workstation
Developer's workstation powered by Vagrant and Digital Ocean

## Requirements
- If you haven't yet, [download Vagrant](https://www.vagrantup.com/).
- Generate SSH Key. Github has a great [guide](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) for it.
- Add SSH Key to Digital Ocean.
- Get the [Vagrant Digital Ocean plugin](https://github.com/devopsgroup-io/vagrant-digitalocean) by running `$ vagrant plugin install vagrant-digitalocean`.
- [Get Gas Mask](http://clockwise.ee/) (recommended)

## Setup
- Run `$ ./setup.sh`
- Run `$ vagrant up`
- Go to your assigned IP address on your browser.

# Setting Up Projects 
After you initialize your vagrant machine you will be able to start working on projects locally. In order to do that
you will have to configure a virtual host (vhost) and probably import/create a database.
 
## Creating a Virtual Host
Basically, you want your vagrant machine to route the http request (domain) to the right directory. Go into your machine:

 `$ vagrant ssh`

Now that you're in the guest machine, find the workstation.conf file in the apache2 directory:

`$ cd /etc/apache2/sites-available`

`$ vim workstation.conf`

Add your vhost at the end of the file:
> <VirtualHost *:80>

>ServerAdmin notifications@filamentlab.com

>ServerName your_project_url.dev

>ServerAlias www.your_project_url.dev

>DocumentRoot /var/www/your_project_dir

>ErrorLog ${APACHE_LOG_DIR}/error.log

>CustomLog ${APACHE_LOG_DIR}/access.log combined

></VirtualHost>

Restart apache: `$ service apache2 restart`;