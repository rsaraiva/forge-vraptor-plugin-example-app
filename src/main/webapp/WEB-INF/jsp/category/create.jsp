<%@ include file="/header.jsp" %>

   <h1>Category</h1>
   <h2>Create a new Category</h2>

   <form id="create" name="create" method="post" action="<c:url value='/category/save'/>">
      <table>
         <tbody>
            <tr>  <td class="label"><label for="name"> Name:</label></td>  <td class="component">    <input id="name" type="text" name="category.name" value="${category.name}" />  </td>  <td class="required"></td></tr>
         </tbody>
      </table>
      <span class="buttons">
         <a href="#" onclick="document.create.submit()" class="btn btn-primary">Save</a>
         <a href="<c:url value="/category/search"/>" class="btn btn-primary">Cancel</a>
      </span>
   </form>

<%@ include file="/footer.jsp" %>
