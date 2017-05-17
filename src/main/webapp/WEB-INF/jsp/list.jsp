

	<div class="container">

		<div class="starter-template">
			<h2>Spring Boot Web JSP Example</h2>
			<div class="generic-container">
			    <div class="panel panel-default">
			        <div class="panel-heading"><span class="lead">User </span></div>
					<div class="panel-body">
				        <div class="formcontainer">
				            <div class="alert alert-success" role="alert" ng-if="ctrl.successMessage">{{ctrl.successMessage}}</div>
				            <div class="alert alert-danger" role="alert" ng-if="ctrl.errorMessage">{{ctrl.errorMessage}}</div>
				            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
				                <input type="hidden" ng-model="ctrl.employee.id" />
				                
				                <div class="row">
				                    <div class="form-group col-md-12">
				                        <label class="col-md-2 control-lable" for="employeeId">Employee Id</label>
				                        <div class="col-md-7">
				                            <input type="text" ng-model="ctrl.employee.employeeId" id="employeeId" class="username form-control input" placeholder="Enter Your Employee Id" required ng-minlength="3"/>
				                        </div>
				                    </div>
				                </div>
				                
				                <div class="row">
				                    <div class="form-group col-md-12">
				                        <label class="col-md-2 control-lable" for="firstName">First Name</label>
				                        <div class="col-md-7">
				                            <input type="text" ng-model="ctrl.employee.firstName" id="firstName" class="firstName form-control input" placeholder="Enter Your Last Name" required ng-minlength="3"/>
				                        </div>
				                    </div>
				                </div>
				                
				                <div class="row">
				                    <div class="form-group col-md-12">
				                        <label class="col-md-2 control-lable" for="lastName">Last Name</label>
				                        <div class="col-md-7">
				                            <input type="text" ng-model="ctrl.employee.lastName" id="lastName" class="lastname form-control input" placeholder="Enter Your Last Name" required ng-minlength="3"/>
				                        </div>
				                    </div>
				                </div>
			
				                <div class="row">
				                    <div class="form-group col-md-12">
				                        <label class="col-md-2 control-lable" for="age">Age</label>
				                        <div class="col-md-7">
				                            <input type="text" ng-model="ctrl.employee.age" id="age" class="form-control input" placeholder="Enter your Age." required ng-pattern="ctrl.onlyIntegers"/>
				                        </div>
				                    </div>
				                </div>
				
				                <div class="row">
				                    <div class="form-group col-md-12">
				                        <label class="col-md-2 control-lable" for="salary">Salary</label>
				                        <div class="col-md-7">
				                            <input type="text" ng-model="ctrl.employee.salary" id="salary" class="form-control input" placeholder="Enter your Salary." required ng-pattern="ctrl.onlyNumbers"/>
				                        </div>
				                    </div>
				                </div>
			
				                <div class="row">
				                    <div class="form-group ">
				                    	<div class="col-xs-offset-5">
					                        <input type="submit"  value="{{!ctrl.employee.id ? 'Add' : 'Update'}}" class="btn btn-success" ng-disabled="myForm.$invalid || myForm.$pristine">
					                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning" ng-disabled="myForm.$pristine">Reset</button>
				                        </div>
				                    </div>
				                </div>
				            </form>
			    	    </div>
					</div>	
			    </div> 
			    <div class="panel panel-default">
			        <!-- Default panel contents -->
			        <div class="panel-heading"><span class="lead">List of Users </span></div>
					<div class="panel-body">
						<div class="table-responsive">
					        <table class="table table-hover">
					            <thead>
						            <tr>
						                <th>ID</th>
						                <th>EmployeeId</th>
						                <th>First Name</th>
						                <th>Last Name</th>
						                <th>Age</th>
						                <th>Salary</th>
						                <th width="100"></th>
						                <th width="100"></th>
						            </tr>
					            </thead>
					            <tbody>
					            <tr ng-repeat="emp in ctrl.getAllEmployees()">
					                <td>{{emp.id}}</td>
					                <td>{{emp.employeeId}}</td>
					                <td>{{emp.firstName}}</td>
					                <td>{{emp.lastName}}</td>
					                <td>{{emp.age}}</td>
					                <td>{{emp.salary}}</td>					                
					                <td><button type="button" ng-click="ctrl.editEmployee(emp.id)" class="btn btn-success ">Edit</button></td>
					                <td><button type="button" ng-click="ctrl.removeEmployee(emp.id)" class="btn btn-danger">Remove</button></td>
					            </tr>
					            </tbody>
					        </table>		
						</div>
					</div>
			    </div>
			</div>
		</div>

	</div>
	<!-- /.container -->
