<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
	 	<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><g:layoutTitle default="Grails"/></title>
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<g:layoutBody/>
	</body>
<script>
$(function() {
	Twitch.init({clientId: '2bfk0cpc2exk2xykkxctcngdpqtppnl'}, function(error, status) {
		console.log(status);
		$("#butTwitchLogout").hide();
		
		if (error) {
			// error encountered while loading
			console.log(error);
		} else {
			console.log('Success!');
		}
		// the sdk is now loaded
		if (status.authenticated) {
	    	$(".twitch-connect").hide();
	    	$("#butTwitchLogout").show();

	    	//Get user object
	    	Twitch.api({method: 'user'}, function(error, user){
				console.debug(user._id);
				console.debug(user.name);
	    	});
		}
	});

	$('.twitch-connect').on('click', function() {
		console.log("Twitch Login");
		Twitch.login({
			scope: ['user_read']
		});
	})

	$('#butTwitchLogout').on('click', function(){
		console.log("Twitch Logout");
		Twitch.logout(function(error) {
		    if(error){
				console.log(error);
			} else {
				window.location = window.location.pathname;
			}
		});
	});

	$('#adminTabs a:first').tab('show')
});
</script>
</html>
