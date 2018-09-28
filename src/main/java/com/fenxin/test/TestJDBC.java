package com.fenxin.test;

import org.junit.Test;

import java.sql.*;


public class TestJDBC {

    private static final String URL="jdbc:mysql://localhost:3306/test2?useSSL=false&serverTimezone=Hongkong&useUnicode=true&characterEncoding=utf-8&autoReconnect=true";
    private static final String USER="root";
    private static final String PASSWORD="138822";

    @Test
    public void test() {

	/*	// TODO Auto-generated method stub
		//1.加载驱动程序
		Class.forName("com.mysql.jdbc.Driver");
		//2.获得数据库连接
		Connection conn=DriverManager.getConnection(URL, USER, PASSWORD);
		//3.通过数据库的连接操作数据库，实现增删改查
		Statement stmt = conn.createStatement();
		ResultSet rs=stmt.executeQuery("select user_name,age from goddess where id=1");
		while(rs.next()){
			System.out.print(rs.getString("user_name")+","+rs.getInt("age"));
		}
	*/
        try {
            //加载驱动程序；
            Class.forName("com.mysql.cj.jdbc.Driver");
            //DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

            //获得数据库连接；
            Connection conn=DriverManager.getConnection(URL,USER,PASSWORD);

            //通过数据库的连接操作数据库，实现增删改查。
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("select username,id from User;");
            while(rs.next()) {
                System.out.println(rs.getString("id")+","+rs.getString("username"));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

