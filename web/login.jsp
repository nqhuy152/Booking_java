<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Document</title>
</head>

<body>
<h1>read data</h1>
<ul>
	<li>
		<p>
			<b>First Name:</b>
			<%= request.getParameter("email")%>
		</p>
	</li>
	<li>
		<p>
			<b>Last Name:</b>
			<%= request.getParameter("password")%>
		</p>
	</li>
</ul>
</body>
</html>
