<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<title>Save Student</title>
</head>
<body>
	<div class="container">
		<h3>Students List</h3>
		<form action="/DebateEvent/students/list" class="form-inline">
			<a href="/DebateEvent/students/showFormForAdd"
				class="btn btn-primary btn-sm mb-3">Add Student</a>

		</form>

		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>Name</th>
					<th>Department</th>
					<th>Country</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${students}" var="temp">
					<tr>
						<td><c:out value="${temp.name }" /></td>
						<td><c:out value="${temp.department }" /></td>
						<td><c:out value="${temp.country }" /></td>

						<!-- Add "Update" button -->
						<a
							href="/DebateEvent/students/showFormForUpdate?studentid=${temp.id}"
							class="btn btn-info btn-sm">Update</a>

						<!-- Add "Delete" button -->
						<a
							href="/DebateEvent/students/showFormForDelete?studentid=${temp.id}"
							class="btn btn-danger btn-sm"
							onclick="if(!(confirm(Are you sure you want to delete?))) return false">Delete</a>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

</body>
</html>

</body>
</html>