<%@ include file="/header.jsp" %>

   <h1>Customer</h1>
   <h2>View existing Customer</h2>

   <table>
      <tbody>
         <tr>
  <td class="label"><label for="name"> Name:</label></td>
  <td class="component">
    <span id="name">${product.name}</span>
  </td>
  <td class="required"></td>
</tr>
<tr>
  <td class="label"><label for="category"> Category:</label></td>
  <td class="component">
    <span id="category">${product.category}</span>
  </td>
  <td class="required"></td>
</tr>

      </tbody>
   </table>
   <div class="buttons">
      <a href="<c:url value="/product/search"/>" class="btn btn-primary">View All</a>
      <a href="<c:url value="/product/edit/${product.id}"/>" class="btn btn-primary">Edit</a>
      <a href="<c:url value="/product/create"/>" class="btn btn-primary">Create New</a>
   </div>

<%@ include file="/footer.jsp" %>
