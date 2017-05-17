
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>Log In with your account</title>

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
		    	<form role="form" method="POST" action='<c:url value="/login"/>'>
					<!-- <fieldset> -->
						<h2>Please Sign In</h2>
						
						<c:if test="${not empty error}">
							<div class="alert alert-danger">${error}</div>
						</c:if>
						<c:if test="${not empty message}">
							<div class="alert alert-info">${message}</div>
						</c:if>
						
						<hr class="colorgraph">
						<div class="form-group">
		                    <input type="text" name="username" id="email" class="form-control input-lg" placeholder="Email Address">
						</div>
						<div class="form-group">
		                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password">
						</div>
						<span class="button-checkbox">
							<!-- <button type="button" class="btn" data-color="info">Remember Me</button> -->
							<span class="btn"></span>
		                    <input type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden">
							<a href="" class="btn btn-link pull-right">Forgot Password?</a>
						</span>
						<hr class="colorgraph">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
		                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Sign In">
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<a href="<c:url value="/registration"/>" class="btn btn-lg btn-success btn-block">Register</a>
							</div>
						</div>
					<!-- </fieldset> -->
				</form>
			</div>
		</div>

	</div>
	<!-- /container -->

	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript" src='<c:url value="/resources/js/jquery.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/sample.js"/>'></script>
	<script type="text/javascript">
		/*$(function(){
		     $('.button-checkbox').each(function(){
		    	var $widget = $(this),
					$button = $widget.find('button'),
					$checkbox = $widget.find('input:checkbox'),
					color = $button.data('color'),
					settings = {
							on: {
								icon: 'glyphicon glyphicon-check'
							},
							off: {
								icon: 'glyphicon glyphicon-unchecked'
							}
					};
		
				$button.on('click', function () {
					$checkbox.prop('checked', !$checkbox.is(':checked'));
					$checkbox.triggerHandler('change');
					updateDisplay();
				});
		
				$checkbox.on('change', function () {
					updateDisplay();
				});
		
				function updateDisplay() {
					var isChecked = $checkbox.is(':checked');
					// Set the button's state
					$button.data('state', (isChecked) ? "on" : "off");
		
					// Set the button's icon
					$button.find('.state-icon')
						.removeClass()
						.addClass('state-icon ' + settings[$button.data('state')].icon);
		
					// Update the button's color
					if (isChecked) {
						$button
							.removeClass('btn-default')
							.addClass('btn-' + color + ' active');
					} 
		            else 
		            { 
		                $button
							.removeClass('btn-' + color + ' active')
							.addClass('btn-default');
					}
				}
				function init() {
					updateDisplay();
					// Inject the icon if applicable
					if ($button.find('.state-icon').length == 0) {
						$button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
					}
				}
				init();
			});
		});*/
	</script>
</body>
</html>
