package twitch.bet.bo

class Event {
	String name
	EventChoice winner
	
	static hasMany = [ choices : EventChoice ]
	
    static constraints = {
    }
}
