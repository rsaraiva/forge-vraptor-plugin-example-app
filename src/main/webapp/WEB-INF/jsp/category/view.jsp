<%@ include file="/header.jsp" %>

   <h1>Customer</h1>
   <h2>View existing Customer</h2>

   <table>
      <tbody>
         <tr>
  <td class="label"><label for="name"> Name:</label></td>
  <td class="component">
    <span id="name">${category.name}</span>
  </td>
  <td class="required"></td>
</tr>

      </tbody>
   </table>
   <div class="buttons">
      <a href="<c:url value="/category/search"/>" class="btn btn-primary">View All</a>
      <a href="<c:url value="/category/edit/${category.id}"/>" class="btn btn-primary">Edit</a>
      <a href="<c:url value="/category/create"/>" class="btn btn-primary">Create New</a>
   </div>

<%@ include file="/footer.jsp" %>
