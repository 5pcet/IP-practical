%@page import=”java.sql.*”%
%@page import=”java.io.*”%
<% out.println(“<html><body
bgcolor=
String name=request.getParameter(“name”);
String addr=request.getParameter(“addr”);
String phno=request.getParameter(“phno”);
String id=request.getParameter(“id”);
String pwd=request.getParameter(“pwd”);
int no=Integer.parseInt(phno);
Driver d=new oracle.jdbc.driver.OracleDriver();
DriverManager.registerDriver(d);
Connection con=
DriverManager.getConnection
(“jdbc:oracle:thin:@localhost:1521:orcl”,”scott”,”tiger”);
Statement stmt=con.createStatement();
String sqlstmt=”select id from login”;
ResultSet
rs=stmt.executeQuery(sqlstmt); int
flag=0; while(rs.next())
{
if(id.equals(rs.getString(1)))
{ flag=1;
} }
if(flag==1)
{
out.println(“SORRY LOGIN ID ALREADY EXISTS TRY AGAIN WITH NEW ID
<br><br>”); out.println(“<a href=\”//reg.html\”>press REGISTER to
RETRY</a>”);
} else
{
Statement stmt1=con.createStatement ();
stmt1.executeUpdate (“insert into login values
(“+name+”,”+addr+”,”+no+”,”+id+”,”+pwd+”)”);
out.println (“YOU DETAILS ARE ENTERED <br><br>”);
58
out.println (“<a href =\”/login.html\”>press LOGIN to login</a>”); }
out.println (“</body></html>”);%>