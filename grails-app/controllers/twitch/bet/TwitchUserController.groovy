package twitch.bet

import grails.converters.JSON
import grails.transaction.Transactional;
import twitch.bet.bo.User
import twitch.bet.bo.*

class TwitchUserController {
	def TAG = 'TwitchUserController - '
	def currEvent
	def currChoiceList
	def currUser
	
	def getUser(String userid, String username){
		def myUser = []
		
		myUser.addAll(User.findAllByTwitchId(userid))
		
		if(myUser.isEmpty()){
			myUser.add(createUser(userid, username));
		}
		
		currUser = myUser.get(0);
		
		render currUser as JSON
	}
	
	def getChoice() {
		log.println(TAG + "Id - " + params.int('choiceId'))
		 
		def currBetChoice = currChoiceList[params.int('choiceId')]
		def currBet = [		
			'name': currBetChoice.name,
			'history': "0W 0L 1T",
			'money': currUser.money
		]
		
		render currBet as JSON
	}
	
	def openBet(){
		currEvent = Event.get(1)
		currChoiceList = currEvent.choices;
		
		log.println(TAG + "getChoiceList - " + currChoiceList + " - " + currChoiceList[0].name)
		
		render (template: '/layouts/betChoiceList',
			model: [choices: currChoiceList],
			contentType: 'text/html')
	}
	
	@Transactional
	def createUser(String userid, String username){
		
		def newUser = new User()
		newUser.twitchId = userid
		newUser.name = username
		newUser.money = 1000.00

		newUser.save flush:true	
		
		return newUser	
	}
}
