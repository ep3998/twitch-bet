package twitch.bet.bo

class Channel {
	static hasMany = [ events: Event, users: User ]
	
    static constraints = {
    }
}
