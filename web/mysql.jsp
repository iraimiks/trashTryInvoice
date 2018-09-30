<%--
  Created by IntelliJ IDEA.
  User: iraimiks
  Date: 18.25.9
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    String product = request.getParameter("product[]");
    String qty=request.getParameter("qty[]");
    String price=request.getParameter("price[]");
    String total=request.getParameter("total[]");
    String invoice = request.getParameter("invoice");
    String date1 = request.getParameter("date1");
    String employee = request.getParameter("employee");



    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/invoiceDBOTM?autoReconnect=true&useSSL=false", "root", "");
        Statement st = conn.createStatement();

        //int i =  st.executeUpdate("INSERT INTO `productDB`(`PRODUCT_NAME`, `PRODUCT_PRICE`,`PRODUCT_QTY`,`PRODUCT_TOTAL`,`ID_INVOICEDB`) VALUES('"+product+"', '"+price+"', '"+qty+"', '"+total+"','"+invoice+"')");
        int j = st.executeUpdate("INSERT INTO `invoiceDB`(`ID_INVOICEDB`, `DATE_INVOICE`,`SENDER_NAME`) VALUES('" + invoice + "', '" + date1 + "', '" + employee + "')");
        PreparedStatement pst = conn.prepareStatement("INSERT INTO `productDB`(`PRODUCT_NAME`, `PRODUCT_PRICE`, `PRODUCT_QTY`,`PRODUCT_TOTAL`,`ID_INVOICEDB`) VALUES (?, ?, ?, ?,?);");
        pst.setString(1, product);
        pst.setString(2, price);
        pst.setString(3, qty);
        pst.setString(4, total);
        pst.setString(5, invoice);


        pst.addBatch();
        pst.executeBatch();
        /*for (int rowCount = 0; rowCount < product.length; rowCount++)
        {
            int i = st.executeUpdate("insert into productDB(PRODUCT_PRICE)values('"+price[rowCount]+"')");
        }
        for (int rowCount = 0; rowCount < product.length; rowCount++)
        {
            int i = st.executeUpdate("insert into productDB(PRODUCT_TOTAL)values('"+total[rowCount]+"')");
        }
        for (int rowCount = 0; rowCount < product.length; rowCount++)
        {
            int i = st.executeUpdate("insert into productDB(PRODUCT_QTY)values('"+qty[rowCount]+"')");
        }*/
        /*for (int x = 0; x < product.length; x++)
        {
            int i = st.executeUpdate("insert into productDB(product_name, product_qty, product_elementPrice, product_totalPrice)values('" + product[x] + "', '" + qty[x] +"','"+price[x]+"','"+total[x]+"')");
        }*/






        out.println("Data is successfully inserted!");
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
%>
