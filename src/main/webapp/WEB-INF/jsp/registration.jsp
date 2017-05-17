
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in with your account</title>

    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />' />
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/bootstrap/css/bootstrap-theme.min.css" />' />
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/common.css" />' />
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/sticky-footer.css" />' />    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<jsp:include page="navbar.jsp"></jsp:include>
	
	<div class="container">
			
	    <div class="row" style="margin-top:60px">
		    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		    	<form:form method="POST" modelAttribute="userForm" >
		    	<fieldset>
			        <h2 class="form-signin-heading">Create your account</h2>
			        
			        <hr class="colorgraph">
			        
			        <spring:bind path="username">
			            <div class="form-group ${status.error ? 'has-error' : ''}">
			                <form:input type="text" path="username" class="form-control input-lg" placeholder="Username" autofocus="true"></form:input>
			                <form:errors path="username"></form:errors>
			            </div>
			        </spring:bind>
			
			        <spring:bind path="password">
			            <div class="form-group ${status.error ? 'has-error' : ''}">
			                <form:input type="password" path="password" class="form-control input-lg" placeholder="Password"></form:input>
			                <form:errors path="password"></form:errors>
			            </div>
			        </spring:bind>
			
			        <spring:bind path="passwordConfirm">
			            <div class="form-group ${status.error ? 'has-error' : ''}">
			                <form:input type="password" path="passwordConfirm" class="form-control input-lg" placeholder="Confirm your password"></form:input>
			                <form:errors path="passwordConfirm"></form:errors>
			            </div>
			        </spring:bind>
					<hr class="colorgraph">
					<div class="form-group">
						<!-- <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button> -->
						<div class="col-xs-8 col-sm-8 col-md-8">
	                        <input type="submit" class="btn btn-lg btn-primary btn-block" value="Submit">
						</div>
						<div class="col-xs-4 col-sm-4 col-md-4">						
							<a href='<c:url value="/login"/>' class="btn btn-lg btn-link">Log In</a>
						</div>
					</div>
			     </fieldset>
			    </form:form>	    	
			</div>
		</div>	
	</div>
	<!-- /container -->
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript" src='<c:url value="/resources/js/jquery.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/sample.js"/>'></script>
	<script type="text/javascript">
		$(function(){
		    
		});
	</script>
</body>
</html>
