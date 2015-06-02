package twitch.bet.bo

class EventChoice {
	String name
	String description
	double odds
	boolean isActive
	
	int statWin
	int statLoss
	
	double statWinDollar
	double statLossDollar
	
    static constraints = {
		description(nullable: true)
    }
}
