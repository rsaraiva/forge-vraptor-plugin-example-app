<%@ include file="/header.jsp" %>

   <h1>Product</h1>
   <h2>Create a new Product</h2>

   <form id="create" name="create" method="post" action="<c:url value='/product/save'/>">
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
         <a href="#" onclick="document.create.submit()" class="btn btn-primary">Save</a>
         <a href="<c:url value="/product/search"/>" class="btn btn-primary">Cancel</a>
      </span>
   </form>

<%@ include file="/footer.jsp" %>
