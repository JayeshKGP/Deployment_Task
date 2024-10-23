# Deployment_Task
Automates web server deployment on AWS EC2 instances, including SSH setup, web server installation (NGINX/Apache).
Checkout: http://3.0.51.116/

## Steps for setting up EC2 for website deploy
- First created a 2 EC2 instance. One with Ubuntu and other Amazon Linux. While creating EC2 instance created new key pair. Configuration mentioned in task used. Allowed HTTP & HTTPS while creating EC2.
- After instance launch, I connect to it using ssh. 
```console
jayeshdeshmukh@Jayeshs-MacBook-Air ~ % sudo ssh -i "task_ubuntu.pem" ubuntu@ec2-3-0-51-116.ap-southeast-1.compute.amazonaws.com
```
- The below commands where used to setup NGINX server and host a webpage.
```console
ubuntu@ip-172-31-24-96:~$ apt update
ubuntu@ip-172-31-24-96:~$ sudo apt install nginx -y
ubuntu@ip-172-31-24-96:~$ sudo systemctl start nginx
ubuntu@ip-172-31-24-96:~$ sudo systemctl enable nginx
ubuntu@ip-172-31-24-96:~$ cd /var/www/html
ubuntu@ip-172-31-24-96:/var/www/html$ rm -rf *
ubuntu@ip-172-31-24-96:/var/www/html$ sudo nano index.html
```
- Once index.html edited website available on http://{public_ip}
- For my instance its http://3.0.51.116
- Also, for ping I added ICMP to security groups in inbound rules.

## To install it using script 
- I have created a bash script for this setup.
- First create instance as mentioned above and connect it using ssh. And run following command.
```console
ubuntu@ip-172-31-23-9:~$ git clone https://github.com/JayeshKGP/Deployment_Task.git
ubuntu@ip-172-31-23-9:~$ cd Deployment_Task
ubuntu@ip-172-31-23-9:~/Deployment_Task$ sudo bash install.sh
```
- This will return output as 
```
Server setup completed. You can access your web page at http://13.215.156.69
```
- The webpage is available at http://13.215.156.69 that we created using script.

## Addtional things to do
- Hosting backend server on same VPS and allowing it's port from security groups.
- Buying and forwarding domain to our EC2 instance by setting DNS records.
- Setting nginx for frontned and backend.
- Setting SSL certifications using certbot.
