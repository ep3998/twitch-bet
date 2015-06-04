<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
	<meta name="layout" content="main"/>
	<title>Twitch-bet Main</title>
</head>
<body>
	<div class="container">
		<div class="page-header">
	        <h1>Twitch-bet</h1>
	        <p class="lead">Gambling your hats away in Team Fortress 2</p>
	    </div>
	    
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
				  <a class="navbar-brand" href="#"></a>
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
					<iframe class="embed-responsive-item" src="http://www.twitch.tv/geekandsundry/embed"></iframe>
				</div>
				
			</div>		
			<div class="col-md-4">
				<iframe src="http://www.twitch.tv/geekandsundry/chat?popout=" frameborder="0" scrolling="no" height="500" width="350"></iframe>
			</div>
		</div>
		
		<div class="row">
			<div role="tabpanel" class="col-md-12" id="adminTabs">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#dashboard" aria-controls="dashboard" role="tab" data-toggle="tab">Dashboard</a></li>
					<li role="presentation"><a href="#runEvent" aria-controls="runEvent" role="tab" data-toggle="tab">Run Event</a></li>
					<li role="presentation"><a href="#manageEvent" aria-controls="manageEvent" role="tab" data-toggle="tab">Manage Events</a></li>
					<li role="presentation"><a href="#manageUser" aria-controls="manageUser" role="tab" data-toggle="tab">Manage Users</a></li>
				</ul>
			</div>	
			
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane fade active" id="dashboard"><p>Dashboard content</p></div>
				<div role="tabpanel" class="tab-pane fade" id="runEvent">
					<div class="row">
						<div class="col-md-2">
						</div>
						<div class="col-md-5">
						</div>
						<div class="col-md-5">
						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="manageEvent"><p>manageEvent content</p></div>
				<div role="tabpanel" class="tab-pane fade" id="manageUser"><p>manageUser content</p></div>
			</div>		
		</div>
		
	</div>
	
	
</body>
</html>