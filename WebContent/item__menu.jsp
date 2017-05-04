<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.*,java.util.*,java.sql.*"%>  
     <%@ page isELIgnored="false"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
    <link rel="stylesheet" href="bootstrap-4-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/menu.css">

<title>Title</title>
</head><!-- Image and text -->
<nav class="navbar navbar-inverse bg-inverse">
    <div class="container">
    <a class="navbar-brand" href="#">
        <img src="image/logo2.png" width="55" height="55" class="d-inline-block align-top" alt="">
    </a>
    <button type="submit" name="submit" value="order" class="order-button">Place Order</button>
    </div>
</nav>

<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                     url="jdbc:mysql://localhost/LoveToEat"
                    user="root" password="root"/>
                    
<div class="front-shade">
<div class="container">
    <div class="title-wrap">
        <h2>MENU</h2>
    </div>

    <div class="dropdown-container">
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="n-veg" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                Veg   
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                <button class="dropdown-item" type="button">Veg</button>
                <button class="dropdown-item" type="button">Non-veg</button>
            </div>
        </div>

        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="category" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                <button class="dropdown-item" type="button">Breakfast</button>
                <button class="dropdown-item" type="button">Lunch</button>
                <button class="dropdown-item" type="button">Dinner</button>
                <button class="dropdown-item" type="button">Starters</button>
                <button class="dropdown-item" type="button">Snacks</button>
                <button class="dropdown-item" type="button">Drinks</button>
            </div>
        </div>
    </div>


    <table class="table table-hover">
   <sql:query dataSource="${snapshot }" var="result"> 
Select * from itemList;
</sql:query>
        <thead>
        <tr>
            <th></th>
            <th>Name</th>
            <th>Price</th>
            <th>Veg/Non-veg</th>
            <th>Quantity</th>
            <th>Request</th>
        </tr>
        </thead>
        <c:forEach items="${result.rows}"  var="col">
        
        <tr>
        
            <td><input type="checkbox" name="select"></td>
            <td><c:out value="${col.item_name }"></c:out></td>
            <td><c:out value="${col.price}"></c:out></td>
            <td>Non-veg</td>
            <td><input type="text" name="quantity"></td>
            <td><input type="text" name="request"></td>
                   
       
            
            
        </tr>
     </c:forEach> 
        
    </table>
</div>
</div>

<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-4-dist/js/bootstrap.min.js"></script>


</body>
</html>