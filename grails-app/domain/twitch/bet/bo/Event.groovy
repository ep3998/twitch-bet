package twitch.bet.bo

class Event {
	String name
	EventChoice winner
	int statRuns
	int statUsers
	double statTotalMoney
	
	static hasMany = [ choices: EventChoice ]
	
    static constraints = {
		winner(nullable: true)
    }
}
