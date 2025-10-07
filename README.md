## AWS Platform
#### Used Terraform script to create the below resources
- VPC
- Public Subnet
- Route Table
- Security Group
- EC2 Instance [Ubuntu]
- Elastic IP address

## Modsecurity
- Installed Apache, PHP, MySQL, Modsecurity services
```
sudo apt update && sudo apt install -y software-properties-common apache2 mysql-server php8.3 libapache2-mod-php8.3 libapache2-mod-security2 && \
sudo systemctl enable apache2 && \
sudo systemctl start apache2 && \
sudo systemctl enable mysql && \
sudo systemctl start mysql && \
sudo a2enmod proxy_fcgi setenvif && \
sudo a2enconf php8.3-fpm  && \
sudo a2enmod security2  && \
sudo sed -i "s/^\s*SecRuleEngine\s\+.*/SecRuleEngine On/" /etc/modsecurity/modsecurity.conf && \
sudo systemctl restart apache2

```
- Created database and table in MySQL
- Created a login page using PHP script and connected MySQL DB

## Pages
vuln.php - Exploitable [Vulnerable to SQL injection] <br>
secure.php - Non-Exploitable [ModSecurity WAF configured]
