<%@ include file="/header.jsp" %>

   <h1>Customer</h1>
   <h2>Edit existing Customer</h2>

   <form id="edit" name="edit" method="post" action="<c:url value='/customer/save'/>">
      <input id="id" type="hidden" name="customer.id" value="${customer.id}" />
      <table>
         <tbody>
            <tr>
               <td class="label"><label for="firstName"> First Name:</label></td>
               <td class="component"><input id="firstName" type="text" name="customer.firstName" value="${customer.firstName}" /></td>
               <td class="required"></td>
            </tr>
            <tr>
               <td class="label"><label for="lastName"> Last Name:</label></td>
               <td class="component"><input id="lastName" type="text" name="customer.lastName" value="${customer.lastName}" /></td>
               <td class="required"></td>
            </tr>
         </tbody>
      </table>
      <span class="buttons">
         <a href="#" onclick="document.edit.submit()" class="btn btn-primary">Save</a>
         <a href="<c:url value='/customer/search'/>" class="btn btn-primary">Cancel</a>
         <a href="#" onclick="document.edit.action='<c:url value="/customer/delete"/>';document.edit.submit()" class="btn btn-primary">Delete</a>
      </span>
   </form>

<%@ include file="/footer.jsp" %>
