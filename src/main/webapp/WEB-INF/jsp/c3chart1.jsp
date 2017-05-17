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
    
    <title>C3 Charts</title>
    
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />' />
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/bootstrap/css/bootstrap-theme.min.css" />' />
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/common.css" />' />
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/sticky-footer.css" />' />
	
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/c3js/c3.css" />' />
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>
	
	<!-- .container -->
	<div class="container">
		
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-primary" >
					<div class="panel-heading">Line Chart 1</div>
					<div class="panel-body ">
						<div class="chart" id="chart1" style="height: 250px;"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-primary" >
					<div class="panel-heading">Bar Chart</div>
					<div class="panel-body ">
						<div class="chart" id="chart2" style="height: 250px;"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-success" >
					<div class="panel-heading">Pie Chart 1</div>
					<div class="panel-body ">
						<div class="chart" id="chart3" style="height: 250px;"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-success" >
					<div class="panel-heading">Donut Chart</div>
					<div class="panel-body ">
						<div class="chart" id="chart4" style="height: 250px;"></div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<!-- /.container -->

	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript" src='<c:url value="/resources/js/jquery.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/sample.js"/>'></script>

	<script type="text/javascript" src='<c:url value="/resources/c3js/d3.v3.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/c3js/c3.js"/>'></script>
	<script type="text/javascript">
		$(document).ready(function() {
		    console.log( "ready!" );
		    $("#c3charts").addClass("active");
		});
	
		var chart = c3.generate({
		    bindto: '#chart1',
		    data: {
		      columns: [
		        ['data1', 30, 200, 100, 400, 150, 250],
		        ['data2', 50, 20, 10, 40, 15, 25]
		      ]
		    }
		});
		var chart = c3.generate({
			bindto: '#chart2',
		    data: {
		        columns: [
		            ['data1', 30, 200, 100, 400, 150, 250],
		            ['data2', 130, 100, 140, 200, 150, 50]
		        ],
		        type: 'bar'
		    },
		    bar: {
		        width: {
		            ratio: 0.5 // this makes bar width 50% of length between ticks
		        }
		        // or
		        //width: 100 // this makes bar width 100px
		    }
		});

		setTimeout(function () {
		    chart.load({
		        columns: [
		            ['data3', 130, -150, 200, 300, -200, 100]
		        ]
		    });
		}, 1000);
		
		var chart = c3.generate({
			bindto: '#chart3',
		    data: {
		        // iris data from R
		        columns: [
		            ['data1', 30],
		            ['data2', 120],
		        ],
		        type : 'pie',
		        onclick: function (d, i) { console.log("onclick", d, i); },
		        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
		        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
		    }
		});

		setTimeout(function () {
		    chart.load({
		        columns: [
		            ["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
		            ["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
		            ["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
		        ]
		    });
		}, 1500);

		setTimeout(function () {
		    chart.unload({
		        ids: 'data1'
		    });
		    chart.unload({
		        ids: 'data2'
		    });
		}, 2500);
		
		// Donut Chart
		var chart = c3.generate({
			bindto: '#chart4',
		    data: {
		        columns: [
		            ['data1', 30],
		            ['data2', 120],
		        ],
		        type : 'donut',
		        onclick: function (d, i) { console.log("onclick", d, i); },
		        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
		        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
		    },
		    donut: {
		        title: "Iris Petal Width"
		    }
		});

		setTimeout(function () {
		    chart.load({
		        columns: [
		            ["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
		            ["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
		            ["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
		        ]
		    });
		}, 1500);

		setTimeout(function () {
		    chart.unload({
		        ids: 'data1'
		    });
		    chart.unload({
		        ids: 'data2'
		    });
		}, 2500);

	</script>
</body>
</html>

