package twitch.bet.bo

class User {
	String twitchId
	String name
	double money
	
	static hasMany = [ bets: Bet ]
	
    static constraints = {
    }
}
