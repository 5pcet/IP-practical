%@page import=”java.sql.*”%
%@page import=”java.io.*”%
<%out.println(“
<html><body
bgcolor=String
id=request.getParameter(“id”);
String pwd=request.getParameter(“pwd”);
Driver d=new oracle.jdbc.driver.OracleDriver();
DriverManager.registerDriver(d);
Connection
con=DriverManager.getConnection(“jdbc:oracle:thin:@localhost:1521:orcl”,”scott”,”
tiger”);
Statement stmt=con.createStatement();
String sqlstmt=”select id,password from login where id=”+id+” and
password=”+pwd+””;
ResultSet
rs=stmt.executeQuery(sqlstmt); int
flag=0; while(rs.next())
{ flag=1;
}
if(flag==0)
{
out.println(“SORRY INVALID ID TRY AGAIN ID<br><br>”); out.println(“
<a href=\”/tr1/login.html\”>press LOGIN to RETRY</a>”);
} else
{
out.println(“VALID LOGIN ID<br><br>”); out.println(“<h3><ul>”);
out.println(“<li><ahref=\”profile.html\”><fontcolor=\”black\”>USER
PROFILE</font></a></li><br><br>”);
out.println(“<li><ahref=\”catalog.html\”><fontcolor=\”black\”>BOOK
S CATALOG</font></a></li><br><br>”);
out.println(“<li><ahref=\”order.html\”><fontcolor=\”black\”>ORDER
CONFIRMATION</font></a></li><br><br>”);
out.println(“</ul>”);
}
out.println(“<body></html>”);
%> 