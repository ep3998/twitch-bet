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
		<g:layoutHead/>
	</head>
	<body>
		<g:layoutBody/>
		<asset:javascript src="application.js"/>
	</body>
<script>
$(function() {
	var twitchClientId = "${grailsApplication.config.twitch.clientid}";

	//Initialize Twitch
	Twitch.init({clientId: twitchClientId}, function(error, status) {
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
			$("#welcomeSection").hide();	
	    	
	    	//Get user object
	    	Twitch.api({method: 'user'}, function(error, user){
				var username = user.name;
				var userid = user._id;
				var stream = "${twitchStream}";
		    	
				console.debug(userid);
				console.debug(username);

				//if((stream == username) || (username == "ep3998")){
				if((stream == username)){
					$("#adminSection").removeClass("hidden");
				} else {
					$("#userSection").removeClass("hidden");
				}

			    grabUserInfo(userid, username);	
	    	});
		}
	});

	//Login to Twitch
	$('.twitch-connect').on('click', function() {
		console.log("Twitch Login");
		Twitch.login({
			scope: ['user_read']
		});
	})
	
	//Logout of Twitch
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

	//Initialize tabs
	$('#adminTabs a:first').tab('show')
	$('#userTabs a:first').tab('show')

	function grabUserInfo(userid, username){
		$.ajax({
			type: 'POST',
            url: "/twitch-bet/twitch/${twitchStream}/getUser",
            dataType: 'json',
            data:{userid: userid,
                username: username},
            success: function(data) {
                console.log(data); //<-----this logs the data in browser's console
            },
            error: function(xhr){
                alert(xhr.responseText); //<----when no data alert the err msg
            }
        });
	}
});
</script>
</html>
