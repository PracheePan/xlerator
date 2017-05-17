<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="date" class="java.util.Date" />
<fmt:formatDate value="${date}" pattern="yyyy" var="currentYear" />
<footer class="footer">
	<div class="container">
		<p class="text-muted text-center">Copyright &copy; <c:out value="${currentYear}" /> Place sticky footer content here.</p>
	</div>
</footer>