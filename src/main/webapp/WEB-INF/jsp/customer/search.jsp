<%@ include file="/header.jsp" %>

	<h1>Customer</h1>
	<h2>Search Customer entities</h2>

	<form id="search" name="search" method="post" action="<c:url value='/customer/search'/>">
		<span class="search">
			<table>
				<tbody>
					<tr>
						<td class="label"><label for="firstName"> First Name:</label></td>
						<td class="component"><input id="firstName" type="text" name="customer.firstName" /></td>
						<td class="required"></td>
					</tr>
					<tr>
						<td class="label"><label for="lastName"> Last Name:</label></td>
						<td class="component"><input id="lastName" type="text" name="customer.lastName" /></td>
						<td class="required"></td>
					</tr>
				</tbody>
			</table>
			<span class="buttons">
				<a href="#" onclick="document.search.submit()" class="btn btn-primary">Search</a>
				<a href="create" class="btn btn-primary">Create New</a>
			</span>
		</span>
		<table class="data-table">
			<thead>
				<tr>
					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customers}">
				<tr>
					<td><a href="<c:url value="/customer/view/${customer.id}"/>"><span>${customer.firstName}</span></a></td>
					<td><a href="<c:url value="/customer/view/${customer.id}"/>"><span>${customer.lastName}</span></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>

<%@ include file="/footer.jsp" %>
