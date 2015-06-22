package twitch.bet.bo

class Event {
	String name
	String channel
	EventChoice winner
	int statRuns
	int statUsers
	double statTotalMoney
	boolean isTemplate
	Date startDate
	Date endDate
	
	static hasMany = [ choices: EventChoice ]
	
    static constraints = {
		winner(nullable: true)
		startDate(nullable: true)
		endDate(nullable: true)
    }
}
