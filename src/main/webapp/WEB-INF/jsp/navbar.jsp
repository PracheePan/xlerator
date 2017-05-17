<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<form id="logoutForm" method="POST" action="${contextPath}/logout">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<nav class="navbar navbar-inverse ">
	<div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Ennoapp</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class=""><a href="#" class=""><span class="glyphicon glyphicon-home"></span> Home</a></li>
                <li class=" dropdown">
                    <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Excel <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Download Excel</a></li>
                        <li><a href="#">Upload Excel</a></li>
                    </ul>
                </li>               
                <li id="c3charts" class=" dropdown"><a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">C3 Charts <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${contextPath}/c3charts/chart1/">Chart 1</a></li>
                        <li><a href="#">Chart 2</a></li>
                    </ul>
                </li>
                <!-- <li class=" dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Staff <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">View Staff</a></li>
                        <li><a href="#">Add New</a></li>
                        <li><a href="#">Bulk Upload</a></li>
                    </ul>
                </li>
                <li class=" down"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">HR <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Change Time Entry</a></li>
                        <li><a href="#">Report</a></li>
                    </ul>
                </li> -->
            </ul>
            <ul class="nav navbar-nav pull-right">
                <li class=" dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                	<c:if test="${pageContext.request.userPrincipal.name != null}">
  					Welcome <span style="font-weight: bold;font-size: 17px;"> ${pageContext.request.userPrincipal.name} </span> <span class="caret"></span>
					</c:if>   
                	</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Change Password</a></li>
                        <li><a href="#">My Profile <span class="glyphicon glyphicon-user pull-right"></span></a></li>
                        <li>
		                	<a href="#" onclick="document.forms['logoutForm'].submit()">
		            			<c:if test="${pageContext.request.userPrincipal.name != null}"> Logout <span class="glyphicon glyphicon-log-out pull-right"></span>
		            			</c:if>	
		            		</a>
		            	</li>
                    </ul>
                </li>                
            </ul>
        </div>
    </div>
</nav>