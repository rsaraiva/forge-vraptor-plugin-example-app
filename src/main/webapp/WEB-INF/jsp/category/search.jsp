<%@ include file="/header.jsp" %>

<h1>Category</h1>
<h2>Search Category entities</h2>

<form id="search" name="search" method="post" action="<c:url value='/category/search'/>">
    <span class="search">
        <table>
            <tbody>
                <tr>  <td class="label"><label for="name"> Name:</label></td>  <td class="component">    <input id="name" type="text" name="category.name" value="${category.name}" />  </td>  <td class="required"></td></tr>
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
                <th scope="col">Name</th>

            </tr>
        </thead>
        <tbody>
            <c:forEach var="category" items="${entities}">
<tr>
<td><a href="<c:url value="/category/view/${category.id}"/>"><span>${category.name}</span></a></td>
</tr>
</c:forEach>

        </tbody>
    </table>
</form>

<%@ include file="/footer.jsp" %>
