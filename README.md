# zero-admin
一个通用的后台管理系统（Java）

该项目是一个通用的后台管理系统，使用Java开发，项目已托管至github平台。

github下载地址:https://github.com/herenpeng/zero-admin.git

## 项目开发环境
- JDK   1.8
- Maven 3.6.3
- MySQL 5.7.30
- Redis:(Windows)3.2.100

## 项目建议运行环境
如果可以和项目开发环境保持一致是最好的，如果无法保持一致，可以使用建议运行环境

- JDK1.8版本或以上
- Maven 3.0.0版本或以上
- MySQL 5.7版本或以上（不建议使用MySQL5.7以下的版本，因为使用5.7以下的版本，需要修改数据库的连接驱动）



## 运行项目
1、从github地址上将项目下载下来。

2、将项目设置为Maven项目，并使用Maven下载相关依赖。

3、修改application-dev.yml里面的MySQL数据库和Redis数据库的连接信息

4、启动Redis数据库

5、运行MyApplication的main()方法，启动项目

## 补充说明

1、该项目为一个前后端分离项目，启动该项目只是一个纯后端系统，需要结合前端项目进行使用，具体说明可以参考前端项目说明。

前端项目github下载地址：https://github.com/herenpeng/zero-admin-vue.git


2、该项目的SpringBoot版本为2.3.2.RELEASE，请不要使用较低的SpringBoot版本，否则可能会因为SpringAop的执行顺序变化问题，导致系统日志功能发生异常。
具体关于SpringAop执行顺序问题，可以参考作者博客：[不同版本的SpringAop执行顺序变化](https://blog.csdn.net/qq_45193304/article/details/109430545)

3、系统内部集成了Swagger2接口文档，直接通过项目系统【项目文档】菜单或者/swagger-ui.html路径，可以直接访问接口说明文档


## 项目相关技术栈
- SpringBoot
- MyBatisPlus
- JWT
- WebSocket
- Swagger2