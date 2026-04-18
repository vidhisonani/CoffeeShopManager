# CoffeeShopManager — Setup Guide

## Prerequisites
- Java JDK installed
- XAMPP installed (MySQL + Tomcat)
- MySQL Connector JAR placed in `WEB-INF/lib/`

---

## Step 1 — Database Setup
1. Start XAMPP → start **MySQL** and **Apache**
2. Open `http://localhost/phpmyadmin`
3. Click **SQL** tab and run:
```sql
source database/coffee_shop.sql;
```
Or open the file manually and paste contents into SQL tab.

---

## Step 2 — Place Project in Tomcat

Copy the entire `CoffeeShopManager` folder into your Tomcat webapps folder.

### XAMPP on C drive
```
C:\xampp\tomcat\webapps\CoffeeShopManager\
```

### XAMPP on D drive
```
D:\xampp\tomcat\webapps\CoffeeShopManager\
```

### Standalone Tomcat
```
C:\Program Files\Apache Software Foundation\Tomcat x.x\webapps\CoffeeShopManager\
```

---

## Step 3 — Compile Java Files

Open Command Prompt, go to your project folder, run:

### XAMPP on C drive
```cmd
cd C:\xampp\tomcat\webapps\CoffeeShopManager
javac -cp "WEB-INF/lib/servlet-api.jar;WEB-INF/lib/mysql-connector-j-9.6.0.jar" -d WEB-INF/classes src/dao/*.java src/model/*.java src/com/servlet/*.java
```

### XAMPP on D drive
```cmd
cd D:\xampp\tomcat\webapps\CoffeeShopManager
javac -cp "WEB-INF/lib/servlet-api.jar;WEB-INF/lib/mysql-connector-j-9.6.0.jar" -d WEB-INF/classes src/dao/*.java src/model/*.java src/com/servlet/*.java
```

### Standalone Tomcat
```cmd
cd "C:\Program Files\Apache Software Foundation\Tomcat x.x\webapps\CoffeeShopManager"
javac -cp "WEB-INF/lib/servlet-api.jar;WEB-INF/lib/mysql-connector-j-9.6.0.jar" -d WEB-INF/classes src/dao/*.java src/model/*.java src/com/servlet/*.java
```

---

## Step 4 — Start Tomcat and Run

1. Start Tomcat from XAMPP Control Panel
2. Open browser:

### Customer view
```
http://localhost:8080/CoffeeShopManager/menu
```

### Admin panel
```
http://localhost:8080/CoffeeShopManager/adminLogin
```
- Username: `admin`
- Password: `admin123`

---

## JAR Files Required
Place all these in `WEB-INF/lib/`:

| JAR | Where to get |
|---|---|
| `mysql-connector-j-9.6.0.jar` | dev.mysql.com/downloads/connector/j |
| `servlet-api.jar` | copy from your Tomcat `lib/` folder |
| `taglibs-standard-impl-1.2.5.jar` | already in repo |
| `taglibs-standard-spec-1.2.5.jar` | already in repo |

---

## Troubleshooting

| Problem | Fix |
|---|---|
| 404 on any page | Check JSP files are directly inside `CoffeeShopManager/` not in a subfolder |
| 500 error on startup | Run compile command again, check for errors |
| Login not working | Run `INSERT INTO admin VALUES (...)` in phpMyAdmin |
| Menu shows no items | Check MySQL is running and `coffee_shop.sql` was imported |