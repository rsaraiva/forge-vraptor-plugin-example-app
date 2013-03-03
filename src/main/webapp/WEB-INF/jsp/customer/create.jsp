<%@ include file="/header.jsp" %>

   <h1>Customer</h1>
   <h2>Create a new Customer</h2>

   <form id="create" name="create" method="post" action="<c:url value='/customer/save'/>">
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
         <a href="#" onclick="document.create.submit()" class="btn btn-primary">Save</a>
         <a href="<c:url value="/customer/search"/>" class="btn btn-primary">Cancel</a>
      </span>
   </form>

<%@ include file="/footer.jsp" %>
