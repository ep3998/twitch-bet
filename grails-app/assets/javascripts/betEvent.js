(function($) {
	$('#startBet').on('click', function(e){
		$.ajax({
			type: 'POST',
	        url: "/twitch-bet/twitchUser/openBet",
	        dataType: 'html',
	        success: function(data) {
	    		$("#betChoiceList").html(data);
	        },
	        error: function(xhr){
	            alert(xhr.responseText); //<----when no data alert the err msg
	        }
	    });
	});
	
	$('#betChoiceList').on('click', 'a', function(e) {
		e.preventDefault();
		var currId = e.target.id;
	
		$that = $(this);
	
		if(!$that.hasClass('disabled')){
			$that.parent().find('a').removeClass('active');
			$that.addClass('active');
	
			console.log('Click');
			updateEvent(e.target.id);
		}
	
		$("#runEventName").attr("disabled", false);
	});

	function updateEvent(eventName){
		var id = eventName.substring(eventName.indexOf('_')+1)
		console.log('Updating event - ', id);
	
		$.ajax({
			type: 'POST',
	        url: "/twitch-bet/twitchUser/getChoice",
	        dataType: 'json',
	        data:{choiceId:id},
	        success: function(data) {
	            console.log(data); //<-----this logs the data in browser's console
	            $("#userBetChoiceName").html(data.name);
	    		$("#userBetChoiceHistory").html(data.history);
	    		$("#userBank").html(data.money);
	    		
	    		$("#userBetOpenCol2").removeClass('hidden');
	    		$("#userBetOpenCol3").removeClass('hidden');
	        },
	        error: function(xhr){
	            alert(xhr.responseText); //<----when no data alert the err msg
	        }
	    });
	}
	
//	function updateChoiceList(){
//		$.ajax({
//			type: 'POST',
//            url: "/twitch-bet/twitch/${twitchStream}/getChoiceList",
//            dataType: 'html',
//            success: function(data) {
//        		$("#runEventWinnerList").html(data);
//            },
//            error: function(xhr){
//                alert(xhr.responseText); //<----when no data alert the err msg
//            }
//        });
//	}
//
//	//Update event on click
//	function updateEvent(eventName){
//		var id = eventName.substring(eventName.indexOf('_')+1)
//		console.log('Updating event - ', id);
//
//		$.ajax({
//			type: 'POST',
//            url: "/twitch-bet/twitch/${twitchStream}/getEvent",
//            dataType: 'json',
//            data:{eventId:id},
//            success: function(data) {
//                console.log(data); //<-----this logs the data in browser's console
//                $("#runEventName").val(data.name);
//        		$("#runEventChannel").html(data.channel);
//        		$("#runEventCol2").removeClass('hidden');
//
//        		updateChoiceList();
//            },
//            error: function(xhr){
//                alert(xhr.responseText); //<----when no data alert the err msg
//            }
//        });
//	}
//
//	//Save event winner
//	function saveEventWinner(winnerId){
//		$.ajax({
//			type: 'POST',
//            url: "/twitch-bet/twitch/${twitchStream}/saveEvent",
//            dataType: 'json',
//            data:{winner:winnerId,
//            	 eventName:$("#runEventName").val()},
//            success: function(data) {
//                console.log(data); //<-----this logs the data in browser's console
//                $("#runEventWinnerLock").removeClass().addClass("btn btn-success disabled");
//                $("#runEventWinnerLock").text("Successfully Saved");
//                $('#runEventWinnerDropdown').addClass('disabled');
//            },
//            error: function(xhr){
//                alert(xhr.responseText); //<----when no data alert the err msg
//            }
//        });
//	}
//
//	//
//	$('#runEventList a').on('click', function(e) {
//        e.preventDefault();
//        var currId = e.target.id;
//
//        $that = $(this);
//
//		if(!$that.hasClass('disabled')){
//	        $that.parent().find('a').removeClass('active');
//	        $that.addClass('active');
//	
//			console.log('Click');
//			updateEvent(e.target.id);
//		}
//
//		$("#runEventName").attr("disabled", false);
//    });
//
//	//Reset event containers
//    function resetEvent(){
//    	$('#runEventTimer').timer('remove');
//    	$('#runEventBetOpen').removeClass().addClass('btn btn-success');
//    	$('#runEventBetClose').removeClass().addClass('btn btn-default disabled');
//
//    	//Reset total values
//    	$('#runEventTotalUser').text("0");
//    	$('#runEventTotalBets').text("0");
//
//    	//Reset winner choice
//    	$('#runEventWinnerDropdown').addClass('disabled');
//    	$('#runEventWinnerDropdown').html('Choose Winner... <span class="caret"></span>');
//    	
//    	$('#runEventWinnerLock').removeClass().addClass('btn btn-danger disabled');
//    	$('#runEventWinnerLock').text("Lock Winner")
//
//    	//Reset Lock Winner button
//    }
//
//	//Lock event
//    $('#runEventLock').click(function(e){
//		if($("#runEventCol3").hasClass('hidden')){
//			$("#runEventLock").text("Unlock/Reset Event");
//			$("#runEventName").attr("disabled", true);
//			resetEvent();
//		} else {
//			$("#runEventLock").text("Lock Event");
//			$("#runEventName").attr("disabled", false);
//		}
//
//		$("#runEventList a").toggleClass('disabled');
//		$("#runEventCol3").toggleClass('hidden');
//				
//		$("#runEventLock").toggleClass("btn-default").toggleClass("btn-primary");
//
//		
//    });
//
//	//Start event
//    $('#runEventBetOpen').on('click', function(e){
//    	$('#runEventBetOpen').addClass('disabled');
//    	$('#runEventBetClose').removeClass('disabled').addClass('btn-danger');
//
//		$('#runEventTimer').timer();
//    });
//
//	//Stop event 
//    $('#runEventBetClose').on('click', function(e){
//    	$('#runEventBetClose').addClass('disabled');
//		$('#runEventTimer').timer('pause');
//
//		$('#runEventWinnerDropdown').removeClass('disabled');
//    });
//
//	//Update text on winner selection
//    $("#runEventWinnerList").on('click', 'li a', function(e){
//    	var selText = $(this).text();
//        console.log("Menu clicked - " + selText);
//
//        $('#runEventWinnerLock').removeClass('disabled');
//   		
//   		$('#runEventWinnerDropdown').html(selText+' <span class="caret"></span>');
//   		$('#runEventWinnerDropdown').data('winner', $(this).parent().attr("id"));
//   	});
//
//	//Save new event instance and winner
//    $('#runEventWinnerLock').on('click', function(e){
//		var selWinnerText = $('#runEventWinnerDropdown').text();
//		var selWinnerId = $('#runEventWinnerDropdown').data('winner');
//		console.log("Winner Id - " + selWinnerId);
//
//		var choiceId = selWinnerId.substring(selWinnerId.indexOf('_')+1);
//		saveEventWinner(choiceId);
//    });
})(jQuery);