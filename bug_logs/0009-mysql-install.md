## 命令行的方式启动

If you have installed the Startup Item, use this command:

     shell> sudo /Library/StartupItems/MySQLCOM/MySQLCOM start
     (ENTER YOUR PASSWORD, IF NECESSARY)
     (PRESS CONTROL-D OR ENTER "EXIT" TO EXIT THE SHELL)

If you don't use the Startup Item, enter the following command sequence:

     shell> cd /usr/local/mysql
     shell> sudo ./bin/mysqld_safe
     (ENTER YOUR PASSWORD, IF NECESSARY)
     (PRESS CONTROL-Z)
     shell> bg
     (PRESS CONTROL-D OR ENTER "EXIT" TO EXIT THE SHELL)

## mysql的环境变量设置

使用

```objectivec
  alias mysql=/usr/local/mysql/bin/mysql
     alias mysqladmin=/usr/local/mysql/bin/mysqladmin



     alias mysql /usr/local/mysql/bin/mysql
     alias mysqladmin /usr/local/mysql/bin/mysqladmin
     
```
   
或者

```objectivec
touch ~/.bash_login && echo export PATH=$PATH:/usr/local/mysql/bin | tee ~/.bash_login
```

## mysql开机启动:


看看启动是否正常，然后就可以使用如下的方式让 MySQL 自动启动：

1. 创建一个新文件：/Library/LaunchDaemons/com.mysql.mysql.plist


```objectivec
<?xml version="1.0" encoding="UTF-8"?> 
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>KeepAlive</key>
    <true />
    <key>Label</key>
    <string>com.mysql.mysqld</string>
    <key>ProgramArguments</key>
    <array>
      <string>/usr/local/mysql/bin/mysqld_safe</string>
      <string>--user=mysql</string>
    </array>
  </dict>
</plist>
```
2. 更新权限并添加到 launchctl

```objectivec
sudo chown root:wheel /Library/LaunchDaemons/com.mysql.plist
sudo chmod 644 /Library/LaunchDaemons/com.mysql.plist
sudo launchctl load -w /Library/LaunchDaemons/com.mysql.plist
这是由于 Yosemite 废弃了 StartupItems 导致的，苹果官方有解释为什么废弃，请看 a note at the start of the page in Apple's docs explaining this。

```

## 参考资料:

- https://www.v2ex.com/t/153188#reply9
- https://www.computersnyou.com/3376/setup-apache-php-mysql-macosx-10-10-yosemite/
- http://coolestguidesontheplanet.com/get-apache-mysql-php-phpmyadmin-working-osx-10-10-yosemite/
- mysql的安装里有个ReadMe.txt


