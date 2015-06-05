package twitch.bet

class TwitchController {

    def index() { 
		render index: [channel:params.stream]
	}
}
