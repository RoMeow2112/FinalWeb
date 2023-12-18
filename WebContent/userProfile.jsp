<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="DAO.*,service.*,model.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Profile Details</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
    function updateProfile() {
        window.location.href = "UpdateProfileSrv";
    }
</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color: #ace6f6;">

	<%
	/* Checking the user credentials */
			String userName = (String) session.getAttribute("username");
			String password = (String) session.getAttribute("password");

			if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
			}

			UserService dao = new UserDAO();
			User user = dao.getUserDetails(userName, password);
			if (user == null)
		user = new User("Test User", 98765498765L, "test@gmail.com", "ABC colony, Patna, bihar", 87659, "lksdjf");
	%>



	<jsp:include page="header.jsp" />

	<div class="container bg-secondary">
		<div class="row">
			<div class="col">
				<nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
					<ol class="breadcrumb mb-0">
						<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
						<li class="breadcrumb-item"><a href="profile.jsp">User
								Profile</a></li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-body text-center">
						<img src="images/profileavatar.jpg" class="rounded-circle img-fluid"
							style="width: 150px;">
						<h5 class="my-3">
							Hello
							<%=user.getName()%>
							here!!
						</h5>
						<!-- <p class="text-muted mb-1">Full Stack Developer</p>
						<p class="text-muted mb-4">Bay Area, San Francisco, CA</p> -->
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="card mb-4">
					<div class="card-body">
						<form action="UpdateProfileSrv" method="post">
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Full Name</p>
								</div>
								<div class="col-sm-9">
									<input class="text-muted mb-0" name="name" value="<%=user.getName()%>" readonly>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Email</p>
								</div>
								<div class="col-sm-9">
									<input class="text-muted mb-0" name="email" value="<%=user.getEmail()%>">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Phone</p>
								</div>
								<div class="col-sm-9">
									<input class="text-muted mb-0" name="mobile" value="<%=user.getMobile()%>">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Address</p>
								</div>
								<div class="col-sm-9">
									<input class="text-muted mb-0" name="address" value="<%=user.getAddress()%>">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">PinCode</p>
								</div>
								<div class="col-sm-9">
									<input class="text-muted mb-0" name= "pincode" value="<%=user.getPinCode()%>">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
								</div>
								<div class="col-sm-9">
									<button
									type="submit" name="Update" onclick="updateProfile()"
									style="max-width: 80px;">Update</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>

	<%@ include file="footer.html"%>
</body>
</html>
