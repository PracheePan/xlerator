<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />' />
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/bootstrap/css/bootstrap-theme.min.css" />' />
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/common.css" />' />
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/sticky-footer.css" />' />
</head>
<body>

	
	
	<!-- .container -->
	<div class="container">
		<jsp:include page="navbar.jsp"></jsp:include>
		<h2>Message: ${message}</h2>
		
	</div>
	<!-- /.container -->

	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript" src='<c:url value="/resources/js/jquery.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/sample.js"/>'></script>
		

</body>
</html>

