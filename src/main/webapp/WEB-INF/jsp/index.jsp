<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" ng-app="crudApp">
    <head>
        <title>${title}</title>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />' />
		<%-- <link rel="stylesheet" type="text/css" href='<c:url value="/resources/bootstrap/css/bootstrap-theme.min.css" />' /> --%>
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
    
        <div ui-view></div>
                
        <script type="text/javascript" src='<c:url value="/resources/js/lib/angular.min.js"/>' ></script>
        <script type="text/javascript" src='<c:url value="/resources/js/lib/angular-ui-router.min.js"/>' ></script>
        <script type="text/javascript" src='<c:url value="/resources/js/lib/localforage.min.js"/>' ></script>
        <script type="text/javascript" src='<c:url value="/resources/js/lib/ngStorage.min.js"/>' ></script>
        <script type="text/javascript" src='<c:url value="/resources/js/app/app.js"/>' ></script>
        <script type="text/javascript" src='<c:url value="/resources/js/app/EmployeeService.js"/>' ></script>
        <script type="text/javascript" src='<c:url value="/resources/js/app/EmployeeController.js"/>' ></script>
        <script type="text/javascript" src='<c:url value="/resources/js/jquery.min.js"/>' ></script>
        <script type="text/javascript" src='<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>' ></script>        
    </body>
</html>