<%@ include file="/header.jsp" %>

   <h1>Customer</h1>
   <h2>View existing Customer</h2>

   <table>
      <tbody>
         <tr>
            <td class="label"><label for="firstName"> First Name:</label></td>
            <td class="component"><span id="firstName">${customer.firstName}</span></td>
            <td class="required"></td>
         </tr>
         <tr>
            <td class="label"><label for="lastName"> Last Name:</label></td>
            <td class="component"><span id="lastName">${customer.lastName}</span></td>
            <td class="required"></td>
         </tr>
      </tbody>
   </table>
   <div class="buttons">
      <a href="<c:url value="/customer/search"/>" class="btn btn-primary">View All</a>
      <a href="<c:url value="/customer/edit/${customer.id}"/>" class="btn btn-primary">Edit</a>
      <a href="<c:url value="/customer/create"/>" class="btn btn-primary">Create New</a>
   </div>

<%@ include file="/footer.jsp" %>
