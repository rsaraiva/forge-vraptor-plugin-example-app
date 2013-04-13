<%@ include file="/header.jsp" %>

   <h1>Category</h1>
   <h2>Edit existing Category</h2>

   <form id="edit" name="edit" method="post" action="<c:url value='/category/save'/>">
      <input id="id" type="hidden" name="category.id" value="${category.id}" />
      <table>
         <tbody>
            <tr>  <td class="label"><label for="name"> Name:</label></td>  <td class="component">    <input id="name" type="text" name="category.name" value="${category.name}" />  </td>  <td class="required"></td></tr>
         </tbody>
      </table>
      <span class="buttons">
         <a href="#" onclick="document.edit.submit();" class="btn btn-primary">Save</a>
         <a href="<c:url value='/category/search'/>" class="btn btn-primary">Cancel</a>
         <a href="#" onclick="document.edit.action='<c:url value="/category/delete"/>';document.edit.submit();" class="btn btn-primary">Delete</a>
      </span>
   </form>

<%@ include file="/footer.jsp" %>
