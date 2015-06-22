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
<%--		<asset:javascript src="listgroup.js"/>--%>
		<g:layoutHead/>
	</head>
	<body>
		<g:layoutBody/>
	</body>
<script>
$(function() {
	var twitchClientId = "${grailsApplication.config.twitch.clientid}";
	
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

	function updateChoiceList(){
		$.ajax({
			type: 'POST',
            url: "/twitch-bet/twitch/${twitchStream}/getChoiceList",
            dataType: 'text/plain',
            success: function(data) {
        		$("#runEventWinnerList").html(data);
            },
            error: function(xhr){
                alert(xhr.responseText); //<----when no data alert the err msg
            }
        });
	}
	
	function updateEvent(eventName){
		var id = eventName.substring(eventName.indexOf('_')+1)
		console.log('Updating event - ', id);

		$.ajax({
			type: 'POST',
            url: "/twitch-bet/twitch/${twitchStream}/getEvent",
            dataType: 'json',
            data:{eventId:id},
            success: function(data) {
                console.log(data); //<-----this logs the data in browser's console
                $("#runEventName").html(data.name);
        		$("#runEventChannel").html(data.channel);
        		$("#runEventCol2").removeClass('hidden');

        		updateChoiceList();
            },
            error: function(xhr){
                alert(xhr.responseText); //<----when no data alert the err msg
            }
        });
	}

	function saveEventWinner(winner){
		var eventId = $('#runEventList a .active').id;
		console.log("Event Winner Id - " + eventId);

		$.ajax({
			type: 'POST',
            url: "/twitch-bet/twitch/${twitchStream}/getEvent",
            dataType: 'json',
            data:{eventId:id,
                winner:winner},
            success: function(data) {
                console.log(data); //<-----this logs the data in browser's console
                $("#runEventName").html(data.name);
        		$("#runEventChannel").html(data.channel);

        		$("#runEventCol2").removeClass('hidden');
            },
            error: function(xhr){
                alert(xhr.responseText); //<----when no data alert the err msg
            }
        });
	}
	
	$('#runEventList a').on('click', function(e) {
        e.preventDefault();
        var currId = e.target.id;

        $that = $(this);

		if(!$that.hasClass('disabled')){
	        $that.parent().find('a').removeClass('active');
	        $that.addClass('active');
	
			console.log('Click');
			updateEvent(e.target.id);
		}
    });

    function resetEvent(){
    	$('#runEventTimer').timer('remove');
    	$('#runEventBetOpen').removeClass().addClass('btn btn-success');
    	$('#runEventBetClose').removeClass().addClass('btn btn-default disabled');

    	//Reset total values
    	$('#runEventTotalUser').text("0");
    	$('#runEventTotalBets').text("0");

    	//Reset winner choice
    	$('#runEventWinnerDropdown').addClass('disabled');
    	$('#runEventWinnerLock').addClass('disabled');
    }

    $('#runEventLock').click(function(e){
		if($("#runEventCol3").hasClass('hidden')){
			$("#runEventLock").text("Unlock Event");
			resetEvent();
		} else {
			$("#runEventLock").text("Lock Event");
		}

		$("#runEventList a").toggleClass('disabled');
		$("#runEventCol3").toggleClass('hidden');
				
		$("#runEventLock").toggleClass("btn-default").toggleClass("btn-primary");
    });

    $('#runEventBetOpen').on('click', function(e){
    	$('#runEventBetOpen').addClass('disabled');
    	$('#runEventBetClose').removeClass('disabled').addClass('btn-danger');

		$('#runEventTimer').timer();
    });

    $('#runEventBetClose').on('click', function(e){
    	$('#runEventBetClose').addClass('disabled');
		$('#runEventTimer').timer('pause');

		$('#runEventWinnerDropdown').removeClass('disabled');
    });

    $('#runEventWinnerLock').on('click', function(e){
		var selWinner = $('#runEventWinnerDropdown').text();
		console.log("Saving winner - " + selWinner);
    });
        

    $(".dropdown-menu li a").on('click', function(){
    	var selText = $(this).text();
        console.log("Menu clicked - " + selText);

        $('#runEventWinnerLock').removeClass('disabled');
   		
   		$(this).parents('.dropup').find('button[data-toggle="dropdown"]').html(selText+' <span class="caret"></span>');
   	});
    
});
</script>
</html>
