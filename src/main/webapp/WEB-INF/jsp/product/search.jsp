<%@ include file="/header.jsp" %>

<h1>Product</h1>
<h2>Search Product entities</h2>

<form id="search" name="search" method="post" action="<c:url value='/product/search'/>">
    <span class="search">
        <table>
            <tbody>
                <tr>  
                    <td class="label"><label for="name"> Name:</label></td>  
                    <td class="component">
                        <input id="name" type="text" name="product.name" value="${product.name}" />
                    </td>  
                    <td class="required"></td>
                </tr>
                <tr>  
                    <td class="label"><label for="category"> Category:</label></td>  
                    <td class="component">
                        <select name="product.category.id">
                            <c:forEach items="${categoryList}" var="item">
                                <option value="${item.id}" ${product.category.id eq item.id ? 'selected' : '' }  >${item.name}</option>
                            </c:forEach>
                        </select>
                    </td>
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
                <th scope="col">Name</th>
<th scope="col">Category</th>

            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${entities}">
<tr>
<td><a href="<c:url value="/product/view/${product.id}"/>"><span>${product.name}</span></a></td>
<td><a href="<c:url value="/product/view/${product.id}"/>"><span>${product.category}</span></a></td>
</tr>
</c:forEach>

        </tbody>
    </table>
</form>

<%@ include file="/footer.jsp" %>
