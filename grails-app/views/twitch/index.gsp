<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
	<meta name="layout" content="main"/>
	<title>Twitch-bet Main</title>
</head>
<body>
	<div class="container">
<%--		<div class="page-header">--%>
<%--	        <h1>Twitch-bet</h1>--%>
<%--	        <p class="lead">Gambling your hats away in Team Fortress 2 since 2015</p>--%>
<%--	    </div>--%>
	    
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
			  		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				    <span class="sr-only">Toggle navigation</span>
				    <span class="icon-bar"></span>
				    <span class="icon-bar"></span>
				    <span class="icon-bar"></span>
				  </button>
				  <a class="navbar-brand" href="#">twitch-bet</a>
				</div>
				
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				  <form class="navbar-form navbar-left" role="search">
				  </form>
				  <ul class="nav navbar-nav navbar-right">
				    <li><a href="#"><img src="http://ttv-api.s3.amazonaws.com/assets/connect_dark.png" class="twitch-connect" href="#" /></a></li>
					<li><button type="button" id="butTwitchLogout" class="btn btn-default navbar-btn">Logout</button></li>
				    <li><a href="#">FAQ</a></li>
				  </ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>
	    
	
		<div class="row">
			<div class="col-md-8">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item" src="http://www.twitch.tv/${twitchStream}/embed"></iframe>
				</div>
			</div>		
			<div class="col-md-4">
				<iframe src="http://www.twitch.tv/${twitchStream}/chat?popout=" frameborder="0" scrolling="no" height="500" width="350"></iframe>
			</div>
		</div>
		
		<div class="row">
			<div role="tabpanel" class="col-md-12" id="adminTabs">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#dashboard" aria-controls="dashboard" role="tab" data-toggle="tab">Dashboard</a></li>
					<li role="presentation"><a href="#runEvent" aria-controls="runEvent" role="tab" data-toggle="tab">Run Event</a></li>
					<li role="presentation"><a href="#manageEvent" aria-controls="manageEvent" role="tab" data-toggle="tab">Edit Events</a></li>
					<li role="presentation"><a href="#manageUser" aria-controls="manageUser" role="tab" data-toggle="tab">Manage Users</a></li>
				</ul>
			
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="dashboard">
					<table class="table">
						<thead>
						<tr>
							<g:sortableColumn property="name" title="${message(code: 'event.name.label', default: 'Name')}" />
							<g:sortableColumn property="statRuns" title="${message(code: 'event.statRuns.label', default: 'Stat Runs')}" />
							<g:sortableColumn property="statTotalMoney" title="${message(code: 'event.statTotalMoney.label', default: 'Stat Total Money')}" />
							<g:sortableColumn property="statUsers" title="${message(code: 'event.statUsers.label', default: 'Stat Users')}" />
							<th><g:message code="event.winner.label" default="Winner" /></th>
						</tr>
					</thead>
					<g:each in="${events}" status="i" var="eventInstance">
						<tr>
							<td><g:link action="show" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "name")}</g:link></td>
							<td>${fieldValue(bean: eventInstance, field: "statRuns")}</td>
							<td>${fieldValue(bean: eventInstance, field: "statTotalMoney")}</td>
							<td>${fieldValue(bean: eventInstance, field: "statUsers")}</td>
							<td>${fieldValue(bean: eventInstance, field: "winner")}</td>
						</tr>
					</g:each>
					</table>
					
					</div>
					
					<div role="tabpanel" class="tab-pane fade" id="runEvent">
						<div class="row">
							<div id="runEventCol1" class="col-md-2">
								<h3>Choose Event</h3>
								<div id="runEventList" class="list-group">
								<g:each in="${templates}" status="i" var="eventInstance">
									<a id="event_${eventInstance.id}" href="#" class="list-group-item">${fieldValue(bean: eventInstance, field: "name")}</a>
								</g:each>
								</div>
							</div>
							
							<div id="runEventCol2" class="col-md-5 hidden">
								<h3>Event Details</h3>
								<label for="runEventName">Name:</label>
								<p id="runEventName"></p>
								
								<label for="runEventChannel">Channel:</label>
								<p id="runEventChannel"></p>		
								
								<button id="runEventLock" type="button" class="btn btn-primary">Lock Event</button>						
							</div>
							
							<div id="runEventCol3" class="col-md-5 hidden">
								<h3>Manage Event</h3>
								
								<h4>Bets</h4>
								<div class="btn-group" role="group">
									<button id="runEventBetOpen" type="button" class="btn btn-success">Open</button>
									<button id="runEventBetClose" type="button" class="btn btn-default disabled">Close</button>
								</div>
								
								<br/>
								
								<div class="row">
									<div class="col-md-1"><b>Time: </b></div>
									<div id="runEventTimer" class="col-md-11"></div>
								</div>
								
								<div class="row">
									<div class="col-md-3"><b>Total Users: </b></div>
									<div id="runEventTotalUser" class="col-md-9">0</div>
								</div>
								
								<div class="row">
									<div class="col-md-3"><b>Total Bets: </b></div>
									<div id="runEventTotalBets" class="col-md-9">0</div>
								</div>
								
								<h4>Winner</h4>
								<div class="dropup">
								  <button class="btn btn-default dropdown-toggle disabled" type="button" id="runEventWinnerDropdown" data-toggle="dropdown" aria-expanded="true">
								    Choose Winner...
								    <span class="caret"></span>
								  </button>
								  <ul class="dropdown-menu" role="menu" aria-labelledby="runEventWinnerDropdown">
								    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Winner 1</a></li>
								    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Winner 2</a></li>
								    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Winner 3</a></li>
								    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Winner 4</a></li>
								  </ul>
								</div>
								<button id="runEventWinnerLock" type="button" class="btn btn-danger disabled">Lock Winner</button>
							</div>
						</div>
					</div>
					
					
					<div role="tabpanel" class="tab-pane fade" id="manageEvent">
						<div class="col-md-2">
							<h3>Choose Event</h3>
							<g:each in="${templates}" status="i" var="eventInstance">
							<div class="checkbox">
							    <label>
							    	<input id="event_${eventInstance.id}" type="checkbox"> ${fieldValue(bean: eventInstance, field: "name")}
							    </label>
						  	</div>
							</g:each>
							
							<div class="btn-group btn-group-justified" role="group">
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default">New</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default">Edit</button>
								</div>
							</div>
							
							<div class="btn-group btn-group-justified" role="group">
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default">Clone</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default">Delete</button>
								</div>
							</div>
						</div>
						
						<div class="col-md-5">
							<h3>Event Details</h3>
							<table class="table">
								<thead>
								<tr>
									<th><g:message code="eventchoice.name" default="Name"/></th>
									<th><g:message code="eventchoice.odds" default="Odds"/></th>
									<th><g:message code="eventchoice.description" default="Description"/></th>
								</tr>
							</thead>
							<g:each in="${events[0].choices}" status="i" var="choiceInstance">
								<tr>
									<td><g:link action="show" id="${choiceInstance.id}">${fieldValue(bean: choiceInstance, field: "name")}</g:link></td>
									<td>${fieldValue(bean: choiceInstance, field: "odds")}</td>
									<td>${fieldValue(bean: choiceInstance, field: "description")}</td>
								</tr>
							</g:each>
							</table>
						</div>
						
						<div class="col-md-5">
							<h3>Choice Details</h3>
						</div>
					</div>
					
					
					<div role="tabpanel" class="tab-pane fade" id="manageUser">
						<div class="col-md-4">
							<h3>User List</h3>
						</div>
						
						<div class="col-md-8">
							<h3>Edit User</h3>
						</div>
					</div>
				</div>	
			</div>	
		</div>
		
	</div>
</body>
</html>