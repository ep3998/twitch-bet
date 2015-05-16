package twitch.bet.bo

class User {
	String twitchId
	double money
	
	static hasMany = [ openBets: Bet, closedBets : Bet ]
	
    static constraints = {
    }
}
