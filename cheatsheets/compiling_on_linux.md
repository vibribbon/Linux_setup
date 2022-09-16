compiling on linux


=====================================
== python ============================
  Compile
python -m py_compile script1.py script2.py
  Interpreter
python script1.py
  Install
sudo apt-get install python3 python3-pip
  Check version
python --version


=====================================
== c =================================
  Compile
ccache gcc script1.c -o binary-name
  Install
sudo apt-get install build-essential ccache
  Check version
gcc --version


=====================================
== mariadb ===========================
  Interpret
mysql -u root -p db-name < script1.sql > output.txt
  Install
sudo apt-get install mariadb-server
sudo mysql_secure_installation
  setup user
sudo mariadb
grant all on *.* to 'user'@'localhost' identified by 'password' with grant option;
Flush privileges;
exit
Config @ /etc/mysql/mariadb.conf.d/50-server.cnf
  Check version
systemctl status mariadb


=====================================
== php ===========================
  Install
sudo apt-get install php libapache2-mod-php php-cli php-mysql php-zip php-curl php-xml 
  Check version
php -v


=====================================
== apache ============================
  Install
sudo apt-get install apache2
Configs @ /etc/apache2
Site usually @ /var/www/html
  Check version
httpd -v 


=====================================
== r =================================
Note R is capitalised!
  Interpreter
Rscript script1.R
R < script1.R --no-save
  Install
sudo apt-get install r-base
Install rstudio in flatpak
  Check version
R --version

