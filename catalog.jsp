<%@page import=”java.io.*”%>
<% out.println (“<html><body
bgcolor=
String title=request.getParameter (“title”);
Driver d=new oracle.jdbc.driver.OracleDriver ();
DriverManager.regiserDriver (d);
Connection con=DriverManager.getConnection(“jdbc:oracle:thin:@localhost:1521:orcl”,”scott”,”tiger”);
Statement stmt=con.createStatement ();
String sqlstmt=”select * from book where title=”+title+””;
ResultSet rs=stmt.executeQuery
(sqlstmt); int flag=0; while(rs.next())
{ out.println (“<div align=\”center\”>”); out.println
(“TITLE :”+rs.getString(1)+”<br>”); out.println
(“AUTHOR :”+rs.getString(2)+”<br>”); out.println
(“VERSION:”+rs.getString(3)+”<br>”); out.println
(“PUBLISHER :” +rs.getString(4)+”<br>”);
out.println (“COST :” +rs.getString(5)+”<br>”);
out.println (“</div>”); flag=1; } if(flag==0)
{
out.println(“SORRY INVALID ID TRY AGAIN ID <br><br>”);
out.println(“<a href=\”/tr1/catalog.html\”>press HERE to RETRY</a>”);
} out.println
(“</body></html>”);
%>
Order.jsp:
<%@page import=”java.io.*”%>
<% out.println (“<html><body
bgcolor= String
id=request.getParameter (“id”);
String pwd=request.getParameter (“pwd”);
String title=request.getParameter (“title”);
String count1=request.getParameter (“no”);
60
String date=request.getParameter (“date”);
String cno=request.getParameter (“cno”);
int count=Integer.parseInt(count1);
Driver d=new oracle.jdbc.driver.OracleDriver ();
DriverManager.regiserDriver (d);
Connection con=
DriverManager.getConnection
(“jdbc:oracle:thin:@localhost:1521:orcl”,”scott”,”tiger”);
Statement stmt=con.createStatement (); String
sqlstmt=”select id, password from login”;
ResultSet rs=stmt.executeQuery (sqlstmt); int
flag=0,amount,x; while(rs.next())
{
if(id.equals(rs.getString(1))&& pwd.equals(rs.getString(2)))
{ flag=1;
} }
if(flag==0
)
{
out.println(“SORRY INVALID ID TRY AGAIN ID <br><br>”);
out.println(“<a href=\”/tr1/order.html\”>press HERE to RETRY </a>”);
} else
{
Statement stmt2=con.createStatement();
String s=”select cost from book where title=”+title+””;
ResultSet rs1=stmt2.executeQuery(s);
int flag1=0; while(rs1.next())
{
flag1=1;
x=Integer.parseInt(rs1.getString(1));
amount=count*x;
out.println(“AMOUNT :”+amount+”<br><br><br><br>”);
Statement stmt1=con.createStatement (); stmt1.executeUpdate
(“insert into details
(“+id+”,”+title+”,”+amount+”,”+date+”,”+cno+”)”);
out.println (“YOU ORDER HAS TAKEN<br>”);
}
61
if(flag1==0)
{
out.println(“SORRY INVALID BOOK TRY AGAIN <br><br>”);
out.println(“<a href=\”/tr1/order.html\”>press HERE to RETRY </a>”);
}
} out.println (“</body></html>”);%> 