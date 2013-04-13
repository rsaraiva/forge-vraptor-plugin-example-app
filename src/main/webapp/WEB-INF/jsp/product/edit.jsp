<%@ include file="/header.jsp" %>

   <h1>Product</h1>
   <h2>Edit existing Product</h2>

   <form id="edit" name="edit" method="post" action="<c:url value='/product/save'/>">
      <input id="id" type="hidden" name="product.id" value="${product.id}" />
      <table>
         <tbody>
            <tr>  <td class="label"><label for="name"> Name:</label></td>  <td class="component">    <input id="name" type="text" name="product.name" value="${product.name}" />  </td>  <td class="required"></td></tr><tr>  <td class="label"><label for="category"> Category:</label></td>  <td class="component">    <input id="category" type="text" name="product.category" value="${product.category}" />  </td>  <td class="required"></td></tr>
         </tbody>
      </table>
      <span class="buttons">
         <a href="#" onclick="document.edit.submit();" class="btn btn-primary">Save</a>
         <a href="<c:url value='/product/search'/>" class="btn btn-primary">Cancel</a>
         <a href="#" onclick="document.edit.action='<c:url value="/product/delete"/>';document.edit.submit();" class="btn btn-primary">Delete</a>
      </span>
   </form>

<%@ include file="/footer.jsp" %>
