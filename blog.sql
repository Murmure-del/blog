-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `description` varchar(80) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `like_counts` int(11) DEFAULT NULL,
  `views` bigint(20) DEFAULT NULL,
  `comment_counts` int(11) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '1',
  `appreciate` tinyint(1) DEFAULT '1',
  `share_statement` tinyint(1) DEFAULT '1',
  `comment_abled` tinyint(1) DEFAULT '1',
  `publishd` tinyint(1) DEFAULT '1',
  `recommend` tinyint(1) DEFAULT '0',
  `create_time` date DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  `types_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_user` (`user_id`),
  KEY `fk_article_types` (`types_id`),
  CONSTRAINT `fk_article_types` FOREIGN KEY (`types_id`) REFERENCES `types` (`id`),
  CONSTRAINT `fk_article_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES ('1','C++','Spring mvc',NULL,'photo',1,100,1,1,1,1,1,1,0,'2019-01-01','2021-06-10','2','1'),('2','你真的理解什么是财富自由吗？','正确做好任何一件事情的前提是清晰、正确的理解目标。而事实是，我们很多人很多时候根本没有对目标正确的定义，甚至根本从来就没有想过，只是大家都那么做而已…...','正确做好任何一件事情的前提是清晰、正确的理解目标。而事实是，我们很多人很多时候根本没有对目标正确的定义，djjjd甚至根本从来就没有想过，只是大家都那么做而已','photo',1,5544,1,1,1,1,1,1,0,'2017-10-01','2021-06-10','2','1'),('375389da23804de8b32f3dc4bcfb374a','MyBatis工具类','### 绑定接口配置文件\r\n\r\n**UserMapper.xml**\r\n\r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<!DOCTYPE mapper\r\n        PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"\r\n        \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\r\n<mapper namespace=\"com.dao.UserMapper\">\r\n    <select id=\"getUserList\" resultType=\"com.pojo.User\">\r\n		SELECT *\r\n		FROM\r\n		test.flow\r\n	</select>\r\n\r\n	<select id=\"getUserLike\" resultType=\"com.pojo.User\">\r\n		SELECT * FROM test.t1 where name like #{value};\r\n	</select>\r\n\r\n	<select id=\"getUserById\" parameterType=\"String\" resultType=\"com.pojo.User\">\r\n		select * from test.flow where phone = #{id};\r\n	</select>\r\n\r\n\r\n	<insert id=\"addUser\" parameterType=\"com.pojo.User\" >\r\n		insert into test.t1 (id,`name`,age) values (#{id},#{name},#{age});\r\n	</insert>\r\n\r\n	<update id=\"updataUser\" parameterType=\"com.pojo.User\">\r\n		update test.t1 set age = #{age} where name = #{name} and id = #{id};\r\n	</update>\r\n\r\n	<update id=\"updataUser2\" parameterType=\"map\">\r\n		update test.t1 set age = #{age} where name = #{name}\r\n	</update>\r\n\r\n	<delete id=\"deleteUser\" parameterType=\"int\">\r\n		delete from test.t1 where id = #{id};\r\n	</delete>\r\n</mapper>\r\n```\r\n\r\n### MyBatis工具类\r\n\r\n**MybatisUtils.java**\r\n\r\n```java\r\npackage com.Utils;\r\n\r\nimport org.apache.ibatis.io.Resources;\r\nimport org.apache.ibatis.session.SqlSession;\r\nimport org.apache.ibatis.session.SqlSessionFactory;\r\nimport org.apache.ibatis.session.SqlSessionFactoryBuilder;\r\n\r\nimport java.io.IOException;\r\nimport java.io.InputStream;\r\n\r\npublic class MyBatisUtils {\r\n    private static SqlSessionFactory sqlSessionFactory;\r\n    static {\r\n        String resource = \"mybatis-config.xml\";\r\n        try {\r\n            InputStream inputStream = Resources.getResourceAsStream(resource);\r\n            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);\r\n        } catch (IOException e) {\r\n            e.printStackTrace();\r\n        }\r\n    }\r\n    public static SqlSession getSession(){\r\n        return sqlSessionFactory.openSession();\r\n    }\r\n\r\n}\r\n```\r\n\r\n- 可以想象为数据库连接池\r\n-  SqlSessionFactory 一旦被创建就应该在应用的运行期间一直存在，没有任何理由丢弃它或重新创建另一个实例。  \r\n-  SqlSessionFactory 的最佳作用域是应用作用域。 \r\n\r\n**SqlSession**\r\n\r\n- 类似连接数据池中的一个请求\r\n- 用完之后必须关闭，否则资源会被占用\r\n-  每个线程都应该有它自己的 SqlSession 实例。 \r\n-  它的最佳的作用域是请求或方法作用域。 \r\n-  绝对不能将 SqlSession 实例的引用放在一个类的静态域，甚至一个类的实例变量也不行。  也绝不能将 SqlSession 实例的引用放在任何类型的托管作用域中 ','绝对不能将 SqlSession 实例的引用放在一个类的静态域','photo',NULL,NULL,NULL,0,1,1,1,0,1,NULL,NULL,'1','1'),('5b8de0fc6c654f3ab46af80e1b0bd2b9','MyBatis工具类','### 绑定接口配置文件\r\n\r\n**UserMapper.xml**\r\n\r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<!DOCTYPE mapper\r\n        PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"\r\n        \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\r\n<mapper namespace=\"com.dao.UserMapper\">\r\n    <select id=\"getUserList\" resultType=\"com.pojo.User\">\r\n		SELECT *\r\n		FROM\r\n		test.flow\r\n	</select>\r\n\r\n	<select id=\"getUserLike\" resultType=\"com.pojo.User\">\r\n		SELECT * FROM test.t1 where name like #{value};\r\n	</select>\r\n\r\n	<select id=\"getUserById\" parameterType=\"String\" resultType=\"com.pojo.User\">\r\n		select * from test.flow where phone = #{id};\r\n	</select>\r\n\r\n\r\n	<insert id=\"addUser\" parameterType=\"com.pojo.User\" >\r\n		insert into test.t1 (id,`name`,age) values (#{id},#{name},#{age});\r\n	</insert>\r\n\r\n	<update id=\"updataUser\" parameterType=\"com.pojo.User\">\r\n		update test.t1 set age = #{age} where name = #{name} and id = #{id};\r\n	</update>\r\n\r\n	<update id=\"updataUser2\" parameterType=\"map\">\r\n		update test.t1 set age = #{age} where name = #{name}\r\n	</update>\r\n\r\n	<delete id=\"deleteUser\" parameterType=\"int\">\r\n		delete from test.t1 where id = #{id};\r\n	</delete>\r\n</mapper>\r\n```\r\n\r\n### MyBatis工具类\r\n\r\n**MybatisUtils.java**\r\n\r\n```java\r\npackage com.Utils;\r\n\r\nimport org.apache.ibatis.io.Resources;\r\nimport org.apache.ibatis.session.SqlSession;\r\nimport org.apache.ibatis.session.SqlSessionFactory;\r\nimport org.apache.ibatis.session.SqlSessionFactoryBuilder;\r\n\r\nimport java.io.IOException;\r\nimport java.io.InputStream;\r\n\r\npublic class MyBatisUtils {\r\n    private static SqlSessionFactory sqlSessionFactory;\r\n    static {\r\n        String resource = \"mybatis-config.xml\";\r\n        try {\r\n            InputStream inputStream = Resources.getResourceAsStream(resource);\r\n            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);\r\n        } catch (IOException e) {\r\n            e.printStackTrace();\r\n        }\r\n    }\r\n    public static SqlSession getSession(){\r\n        return sqlSessionFactory.openSession();\r\n    }\r\n\r\n}\r\n```\r\n\r\n- 可以想象为数据库连接池\r\n-  SqlSessionFactory 一旦被创建就应该在应用的运行期间一直存在，没有任何理由丢弃它或重新创建另一个实例。  \r\n-  SqlSessionFactory 的最佳作用域是应用作用域。 \r\n\r\n**SqlSession**\r\n\r\n- 类似连接数据池中的一个请求\r\n- 用完之后必须关闭，否则资源会被占用\r\n-  每个线程都应该有它自己的 SqlSession 实例。 \r\n-  它的最佳的作用域是请求或方法作用域。 \r\n-  绝对不能将 SqlSession 实例的引用放在一个类的静态域，甚至一个类的实例变量也不行。  也绝不能将 SqlSession 实例的引用放在任何类型的托管作用域中 ','绝对不能将 SqlSession 实例的引用放在一个类的静态域','photo',NULL,NULL,NULL,0,1,1,1,0,1,NULL,NULL,'1','1'),('b18b5d6270794ecea512230bd7e6ba2b','MyBatis','# MyBatis\r\n\r\n[TOC]\r\n\r\n\r\n\r\n## 1、简介\r\n\r\n### 1.1、什么是MyBatis\r\n\r\n MyBatis 是一款优秀的持久层框架。\r\n\r\n它支持自定义 SQL、存储过程以及高级映射。\r\n\r\nMyBatis 免除了几乎所有的 JDBC 代码以及设置参数和获取结果集。\r\n\r\nMyBatis 可以通过简单的 XML 或注解来配置和映射原始类型、接口和 Java POJO（Plain Old Java Objects，普通老式 Java 对象）为数据库中的记录。 \r\n\r\n### 1.2、pom.xml\r\n\r\n```xml\r\n<dependencies>\r\n        <dependency>\r\n            <groupId>org.mybatis</groupId>\r\n            <artifactId>mybatis</artifactId>\r\n            <version>3.5.2</version>\r\n        </dependency>\r\n\r\n        <dependency>\r\n            <groupId>junit</groupId>\r\n            <artifactId>junit</artifactId>\r\n            <version>4.13.2</version>\r\n        </dependency>\r\n\r\n        <dependency>\r\n            <groupId>mysql</groupId>\r\n            <artifactId>mysql-connector-java</artifactId>\r\n            <version>5.1.48</version>\r\n        </dependency>\r\n    </dependencies>\r\n\r\n    <build>\r\n        <resources>\r\n            <resource>\r\n                <directory>src/main/java</directory>\r\n                <includes>\r\n                    <include>**/*.properties</include>\r\n                    <include>**/*.xml</include>\r\n                </includes>\r\n                <filtering>true</filtering>\r\n            </resource>\r\n            <resource>\r\n                <directory>src/main/resources</directory>\r\n                <includes>\r\n                    <include>**/*.properties</include>\r\n                    <include>**/*.xml</include>\r\n                </includes>\r\n                <filtering>true</filtering>\r\n            </resource>\r\n        </resources>\r\n    </build>\r\n```\r\n\r\n## 2、第一个MyBatis程序\r\n\r\n### 数据库\r\n\r\n**user表**\r\n\r\n```mysql\r\ncreate database test;\r\nuse test;\r\ncreate table t1(id int primary key,name varchar(255),age int) charset=\"utf8\";\r\ninsert into t1 (id,name,age) values (1,\"李四\",18);\r\ninsert into t1 (id,name,age) values (2,\"张三\",17);\r\ninsert into t1 (id,name,age) values (3,\"王五\",16);\r\ninsert into t1 (id,name,age) values (4,\"李五\",19);\r\n```\r\n\r\n代码实现：\r\n\r\n### mybatis配置\r\n\r\n**mybatis-config.xml**\r\n\r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<!DOCTYPE configuration\r\n        PUBLIC \"-//mybatis.org//DTD Config 3.0//EN\"\r\n        \"http://mybatis.org/dtd/mybatis-3-config.dtd\">\r\n<configuration>\r\n    <environments default=\"development\">\r\n        <environment id=\"development\">\r\n            <transactionManager type=\"JDBC\"/>\r\n            <dataSource type=\"POOLED\">\r\n                <property name=\"driver\" value=\"com.mysql.jdbc.Driver\"/>\r\n                <property name=\"url\" value=\"jdbc:mysql://localhost:3306?test\"/>\r\n                <property name=\"username\" value=\"root\"/>\r\n                <property name=\"password\" value=\"p@ssw0rd\"/>\r\n            </dataSource>\r\n        </environment>\r\n    </environments>\r\n    <mappers>\r\n        <mapper resource=\"com/dao/UserMapper.xml\"/>\r\n    </mappers>\r\n</configuration>\r\n```\r\n\r\n### 实体类\r\n\r\n**User.java**\r\n\r\n```java\r\npackage com.pojo;\r\n\r\npublic class User {\r\n    private int id;\r\n    private String name;\r\n    private int age;\r\n\r\n    public User() {\r\n    }\r\n\r\n    public User(int id, String name, int age) {\r\n        this.id = id;\r\n        this.name = name;\r\n        this.age = age;\r\n    }\r\n\r\n    public int getId() {\r\n        return id;\r\n    }\r\n\r\n    public void setId(int id) {\r\n        this.id = id;\r\n    }\r\n\r\n    public String getName() {\r\n        return name;\r\n    }\r\n\r\n    public void setName(String name) {\r\n        this.name = name;\r\n    }\r\n\r\n    public int getAge() {\r\n        return age;\r\n    }\r\n\r\n    public void setAge(int age) {\r\n        this.age = age;\r\n    }\r\n\r\n    @Override\r\n    public String toString() {\r\n        return \"User{\" +\r\n                \"id=\" + id +\r\n                \", name=\'\" + name + \'\\\'\' +\r\n                \", age=\" + age +\r\n                \'}\';\r\n    }\r\n}\r\n\r\n```\r\n\r\n### 实体类User的接口UserMapper\r\n\r\n**UserMapper.java**\r\n\r\n```java\r\npackage com.dao;\r\n\r\nimport com.pojo.User;\r\nimport com.pojo.User;\r\n\r\nimport java.util.List;\r\nimport java.util.Map;\r\n\r\npublic interface UserMapper {\r\n    //查询所有用户\r\n    List<User> getUserList();\r\n\r\n    //模糊查询\r\n    List<User> getUserLike(String value);\r\n    //根据号码查询流量\r\n    User getUserById(String id);\r\n\r\n    //inset一条记录\r\n    int addUser(User user);\r\n\r\n    //修改记录\r\n    int updataUser(User user);\r\n\r\n    //删除记录\r\n    int deleteUser(int id);\r\n\r\n    //万能Map\r\n    int updataUser2(Map<String,Object> map);\r\n}\r\n\r\n```\r\n','MyBatis 可以通过简单的 XML 或注解来配置和映射原始类型.','photo',NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,'1','1'),('d9a7b4188aed413ea0bd1fa7d3ff02dc','MyBatis工具类','### 绑定接口配置文件\r\n\r\n**UserMapper.xml**\r\n\r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<!DOCTYPE mapper\r\n        PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"\r\n        \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\r\n<mapper namespace=\"com.dao.UserMapper\">\r\n    <select id=\"getUserList\" resultType=\"com.pojo.User\">\r\n		SELECT *\r\n		FROM\r\n		test.flow\r\n	</select>\r\n\r\n	<select id=\"getUserLike\" resultType=\"com.pojo.User\">\r\n		SELECT * FROM test.t1 where name like #{value};\r\n	</select>\r\n\r\n	<select id=\"getUserById\" parameterType=\"String\" resultType=\"com.pojo.User\">\r\n		select * from test.flow where phone = #{id};\r\n	</select>\r\n\r\n\r\n	<insert id=\"addUser\" parameterType=\"com.pojo.User\" >\r\n		insert into test.t1 (id,`name`,age) values (#{id},#{name},#{age});\r\n	</insert>\r\n\r\n	<update id=\"updataUser\" parameterType=\"com.pojo.User\">\r\n		update test.t1 set age = #{age} where name = #{name} and id = #{id};\r\n	</update>\r\n\r\n	<update id=\"updataUser2\" parameterType=\"map\">\r\n		update test.t1 set age = #{age} where name = #{name}\r\n	</update>\r\n\r\n	<delete id=\"deleteUser\" parameterType=\"int\">\r\n		delete from test.t1 where id = #{id};\r\n	</delete>\r\n</mapper>\r\n```\r\n\r\n### MyBatis工具类\r\n\r\n**MybatisUtils.java**\r\n\r\n```java\r\npackage com.Utils;\r\n\r\nimport org.apache.ibatis.io.Resources;\r\nimport org.apache.ibatis.session.SqlSession;\r\nimport org.apache.ibatis.session.SqlSessionFactory;\r\nimport org.apache.ibatis.session.SqlSessionFactoryBuilder;\r\n\r\nimport java.io.IOException;\r\nimport java.io.InputStream;\r\n\r\npublic class MyBatisUtils {\r\n    private static SqlSessionFactory sqlSessionFactory;\r\n    static {\r\n        String resource = \"mybatis-config.xml\";\r\n        try {\r\n            InputStream inputStream = Resources.getResourceAsStream(resource);\r\n            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);\r\n        } catch (IOException e) {\r\n            e.printStackTrace();\r\n        }\r\n    }\r\n    public static SqlSession getSession(){\r\n        return sqlSessionFactory.openSession();\r\n    }\r\n\r\n}\r\n```\r\n\r\n- 可以想象为数据库连接池\r\n-  SqlSessionFactory 一旦被创建就应该在应用的运行期间一直存在，没有任何理由丢弃它或重新创建另一个实例。  \r\n-  SqlSessionFactory 的最佳作用域是应用作用域。 \r\n\r\n**SqlSession**\r\n\r\n- 类似连接数据池中的一个请求\r\n- 用完之后必须关闭，否则资源会被占用\r\n-  每个线程都应该有它自己的 SqlSession 实例。 \r\n-  它的最佳的作用域是请求或方法作用域。 \r\n-  绝对不能将 SqlSession 实例的引用放在一个类的静态域，甚至一个类的实例变量也不行。  也绝不能将 SqlSession 实例的引用放在任何类型的托管作用域中 ','绝对不能将 SqlSession 实例的引用放在一个类的静态域','photo',NULL,NULL,NULL,0,1,1,1,0,1,NULL,NULL,'1','1'),('e72b4f138a8640ad90f49ccadecef9ec','MyBatis工具类','### 绑定接口配置文件\r\n\r\n**UserMapper.xml**\r\n\r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<!DOCTYPE mapper\r\n        PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"\r\n        \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\r\n<mapper namespace=\"com.dao.UserMapper\">\r\n    <select id=\"getUserList\" resultType=\"com.pojo.User\">\r\n		SELECT *\r\n		FROM\r\n		test.flow\r\n	</select>\r\n\r\n	<select id=\"getUserLike\" resultType=\"com.pojo.User\">\r\n		SELECT * FROM test.t1 where name like #{value};\r\n	</select>\r\n\r\n	<select id=\"getUserById\" parameterType=\"String\" resultType=\"com.pojo.User\">\r\n		select * from test.flow where phone = #{id};\r\n	</select>\r\n\r\n\r\n	<insert id=\"addUser\" parameterType=\"com.pojo.User\" >\r\n		insert into test.t1 (id,`name`,age) values (#{id},#{name},#{age});\r\n	</insert>\r\n\r\n	<update id=\"updataUser\" parameterType=\"com.pojo.User\">\r\n		update test.t1 set age = #{age} where name = #{name} and id = #{id};\r\n	</update>\r\n\r\n	<update id=\"updataUser2\" parameterType=\"map\">\r\n		update test.t1 set age = #{age} where name = #{name}\r\n	</update>\r\n\r\n	<delete id=\"deleteUser\" parameterType=\"int\">\r\n		delete from test.t1 where id = #{id};\r\n	</delete>\r\n</mapper>\r\n```\r\n\r\n### MyBatis工具类\r\n\r\n**MybatisUtils.java**\r\n\r\n```java\r\npackage com.Utils;\r\n\r\nimport org.apache.ibatis.io.Resources;\r\nimport org.apache.ibatis.session.SqlSession;\r\nimport org.apache.ibatis.session.SqlSessionFactory;\r\nimport org.apache.ibatis.session.SqlSessionFactoryBuilder;\r\n\r\nimport java.io.IOException;\r\nimport java.io.InputStream;\r\n\r\npublic class MyBatisUtils {\r\n    private static SqlSessionFactory sqlSessionFactory;\r\n    static {\r\n        String resource = \"mybatis-config.xml\";\r\n        try {\r\n            InputStream inputStream = Resources.getResourceAsStream(resource);\r\n            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);\r\n        } catch (IOException e) {\r\n            e.printStackTrace();\r\n        }\r\n    }\r\n    public static SqlSession getSession(){\r\n        return sqlSessionFactory.openSession();\r\n    }\r\n\r\n}\r\n```\r\n\r\n- 可以想象为数据库连接池\r\n-  SqlSessionFactory 一旦被创建就应该在应用的运行期间一直存在，没有任何理由丢弃它或重新创建另一个实例。  \r\n-  SqlSessionFactory 的最佳作用域是应用作用域。 \r\n\r\n**SqlSession**\r\n\r\n- 类似连接数据池中的一个请求\r\n- 用完之后必须关闭，否则资源会被占用\r\n-  每个线程都应该有它自己的 SqlSession 实例。 \r\n-  它的最佳的作用域是请求或方法作用域。 \r\n-  绝对不能将 SqlSession 实例的引用放在一个类的静态域，甚至一个类的实例变量也不行。  也绝不能将 SqlSession 实例的引用放在任何类型的托管作用域中 ','绝对不能将 SqlSession 实例的引用放在一个类的静态域','photo',NULL,NULL,NULL,0,1,1,1,0,1,NULL,NULL,'1','1');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` varchar(255) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `blog_counts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
INSERT INTO `label` VALUES ('1','方法论',10),('2','进化论',20),('3','博弈论',30);
/*!40000 ALTER TABLE `label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labeltoarticle`
--

DROP TABLE IF EXISTS `labeltoarticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labeltoarticle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` varchar(255) DEFAULT NULL,
  `label_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LabelToArticle_label` (`label_id`),
  KEY `fk_LabelToArticle_article` (`article_id`),
  CONSTRAINT `fk_LabelToArticle_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `fk_LabelToArticle_label` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labeltoarticle`
--

LOCK TABLES `labeltoarticle` WRITE;
/*!40000 ALTER TABLE `labeltoarticle` DISABLE KEYS */;
INSERT INTO `labeltoarticle` VALUES (1,'1','1'),(2,'1','2'),(3,'1','3'),(4,'2','1'),(5,'2','2'),(6,'2','3'),(10,'b18b5d6270794ecea512230bd7e6ba2b','1'),(11,'b18b5d6270794ecea512230bd7e6ba2b','2'),(12,'375389da23804de8b32f3dc4bcfb374a','2'),(13,'375389da23804de8b32f3dc4bcfb374a','3'),(14,'e72b4f138a8640ad90f49ccadecef9ec','2'),(15,'e72b4f138a8640ad90f49ccadecef9ec','3'),(16,'d9a7b4188aed413ea0bd1fa7d3ff02dc','2'),(17,'d9a7b4188aed413ea0bd1fa7d3ff02dc','3'),(18,'5b8de0fc6c654f3ab46af80e1b0bd2b9','2'),(19,'5b8de0fc6c654f3ab46af80e1b0bd2b9','3');
/*!40000 ALTER TABLE `labeltoarticle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` varchar(255) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `blog_counts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES ('1','JAVA','很好',1),('2','python','很好',1);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `portrait` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  `A_currency` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','安安','123456','203545204@qq.com',NULL,NULL,'2021-06-10',NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-11 19:43:23
