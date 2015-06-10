package twitch.bet.bo

class Event {
	String name
	String channel
	EventChoice winner
	int statRuns
	int statUsers
	double statTotalMoney
	boolean isTemplate
	
	static hasMany = [ choices: EventChoice ]
	
    static constraints = {
		winner(nullable: true)
    }
}
