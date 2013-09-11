	<%	
		Dim oConn, oRs
		Dim qry, connectstr
		Dim db_name, db_username, db_userpassword

		db_server = "localhost"
		db_name = "ws2"
		db_username = "root"
		db_userpassword = "root"
		fieldname = "level2"
		tablename = "taxonomy"

		connectstr = "Driver={MySQL ODBC 5.2 ANSI Driver};SERVER=" & db_server & ";DATABASE=" & db_name & ";UID=" & db_username & ";PWD=" & db_userpassword

		Set oConn = Server.CreateObject("ADODB.Connection")
		oConn.Open connectstr

		response.write "Connection to database:<blockquote> " & connectstr & "<br/>" & oConn & "</blockquote>"
	
		response.write("Retrieving data from db:<br/>")

		qry = "SELECT * FROM " & tablename

		'Executing the SQL query
		Set oRS = oConn.Execute(qry)

		response.write "<blockquote>"
		if not oRS.EOF then
		while not oRS.EOF
			response.write ucase(fieldname) & ": " & oRs.Fields(fieldname) & "<br>"
			oRS.movenext
		wend
			oRS.close
		end if
		response.write "</blockquote>"

		Set oRs = nothing
		Set oConn = nothing
	%>