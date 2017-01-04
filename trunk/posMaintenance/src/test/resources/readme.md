
# SpringWind 说明


> 简单介绍

```
该项目为 SSM 核心库 spring-wind 演示项目

http://git.oschina.net/juapk/spring-wind
```


> 运行项目配置说明

```
1、根据 /SpringWind/src/main/resources/properties/jdbc.properties 配置数据库

2、导入数据库 /SpringWind/src/test/resources/springwind.sql

3、导入Quartz 相关表
   a) MySql MyISAM引擎（默认）：/SpringWind/src/test/resources/quartz/quartz_mysql.sql
   b) MySql InnoDB引擎：       /SpringWind/src/test/resources/quartz/quartz_mysql_innodb.sql
   c) 其他数据库版本请到 http://www.quartz-scheduler.org/downloads/ 下载

4、配置 host 为  127.0.0.1 demo.baomidou.com

5、访问：http://demo.baomidou.com:8080 登录账户默认：  admin 管理员，密码 123 ，普通会员 test 密码  123

```


> 测试权限

```
1、test 账户登录系统

2、访问地址：http://demo.baomidou.com:8080/role/list.html
```

> Quartz 使用说明
```
1、 使用QuartzJobManager类进行Job的添加和删除操作

2、 所有的Job必须继承QuartzJobSupport类

```


> 开发与部署项目 loserStar 362527240@qq.com
maven命令：
mvn  compile 进行编译项目，生成target
mvn clear 清理编译后的项目，清理target目录
mvn test　运行测试用例+编译项目，生成target
mvn install 编译并打包

window-preferences-Genernal-Content Types-调整所有文件的编码方式
window-preferences-Java-Installed JREs-配置eclipse中的jdk和jre版本
window-preferences-Java-Compiler-调整eclipse编译项目用的JDK版本
window-preferences-Java-Maven-Installations-设置自己所用maven版本
window-preferences-Java-Maven-User Settings-设置自己所用的maven配置文件及maven仓库地址

对项目右键-properties-Maven-指定maven项目的POM.xml文件
对项目右键-properties-java compiler-指定该项目的编译jdk版本
对项目右键-properties-java build path-指定项目引入的库，引入对应的jdk版本和pom.xml,项目会自动引入对应jar包
对项目右键-properties-java compiler-building-设置Java代码错误提示

1.如果某些jar包提示报错，到maven本地仓库中删除该jar包，然后重新编译，maven自动下载

2.运行tomcat的maven插件可以直接启动项目，如遇端口被占用，可以使用绿色启动，启动前结束java进程
mvn tomcat:run 
3.此命令可以直接使用debug启动，可进入调试模式，如果不能跟踪断点，在设置命令的地方的source选项卡加入该项目
4.项目打成war包，可以直接丢在tomcat上运行，如果提示找不到一些class文件，重新删除maven仓库中的jar包，重新编译打包
5.直接使用tomcat配置Catalina的方式，把配置文件看成一个项目，然给这个配置文件直接去找target工程目录，或者之类找war包都可以
绿色启动命令：
@rem @for /F "delims=" %%I in ("%~dp0") do echo %%~fI
@echo off
chcp 936
color a
echo ----------running maven start----------------------
rem @setlocal
set MAVEN_HOME=E:\myIDE\maven-3.3.9\bin
set JAVA_HOME=e:\jdk1.8
set classpath=.;.\classes\;.\target\test-classes\;.\target\classes\;%JAVA_HOME%\jre\lib\rt.jar;%JAVA_HOME%\lib\tools.jar;
set LANG=zh_CN.UTF8
set path=.;%MAVEN_HOME%;%JAVA_HOME%\bin;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem
call mvn -v

@call setpath.bat
taskkill /F /IM "java.exe"
cd posMaintenance
mvn tomcat:run
pause
