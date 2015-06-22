import twitch.bet.bo.User
import twitch.bet.bo.Event
import twitch.bet.bo.EventChoice
import twitch.bet.bo.Channel
import twitch.bet.bo.Bet

class BootStrap {

    def init = { servletContext ->
		log.println "Event Count - " + Event.count()
		if(!Event.count()){
			log.println "Populating default values."
			for(i in 0..8){
				def newEvent = new Event()
				newEvent.name = "My Event ${i}"
				if( i < 6){
					newEvent.channel = "geekandsundry"
				} else {
					newEvent.channel = "ep3998"
				}
				newEvent.statUsers = 3
				newEvent.statTotalMoney = 100000.00
				newEvent.startDate = new Date()
				newEvent.startDate.set(year: 2015, month: java.util.Calendar.NOVEMBER, date: 1, hour: 0)
				newEvent.endDate = new Date()
				newEvent.endDate.set(year: 2015, month: java.util.Calendar.NOVEMBER, date: 1, hour: 1)
				newEvent.choices = []
				
				for(j in 0..2){
					def newChoice = new EventChoice()
					newChoice.name = "Event ${i} Choice ${j}"
					newChoice.description = "Description here"
					newChoice.odds = j + 1
					newChoice.isActive = true
					newChoice.statWin = 1
					newChoice.statLoss = 1
					newChoice.statWinDollar = 10.00
					newChoice.statLossDollar = 20.00
					
					newEvent.addToChoices(newChoice)
				} 
				
				log.println "New Event: ${newEvent}"
				newEvent.save(failOnError: true)
				
				if(i % 2){
					def newEventTemplate = new Event()
					newEventTemplate.name = "Event ${i} Template"
					newEventTemplate.statRuns = i + 1
					newEventTemplate.statTotalMoney = 500000.00
					newEventTemplate.isTemplate = true
					
					if( i < 6){
						newEventTemplate.channel = "geekandsundry"
					} else {
						newEventTemplate.channel = "ep3998"
					}
					
					newEventTemplate.choices = []
					
					for(j in 0..2){
						def newChoice = new EventChoice()
						newChoice.name = "Event ${i} Choice ${j}"
						newChoice.description = "Description here"
						newChoice.odds = j + 1
						newChoice.isActive = true
						newChoice.statWin = 1
						newChoice.statLoss = 1
						newChoice.statWinDollar = 10.00
						newChoice.statLossDollar = 20.00
						
						newEventTemplate.addToChoices(newChoice)
					}
					
					newEventTemplate.save(failOnError: true)
				}
			}
		}
		log.println "Event Count - " + Event.count()
//		
//		
//		
//		defBets Bet[]
//		for(int i = 0; i < 3; i++){
//			newBet = new Bet()
//		}
//		
//		if (User.count() == 0) {
//			
//			
//			new User(twitchId: '1', name: 'ep3998', money: 20000.00).save()
//			new User(twitchId: '2', name: 'jdoe', money: 10000.00).save()
//			new User(twitchId: '3', name: 'kdoe', money: 2000.00).save()
//		}
    }
    def destroy = {
    }
}
