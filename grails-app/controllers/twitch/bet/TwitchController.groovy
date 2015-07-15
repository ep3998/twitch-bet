package twitch.bet

import grails.converters.JSON
import grails.transaction.Transactional;
import twitch.bet.bo.User
import twitch.bet.bo.Event
import twitch.bet.bo.EventChoice
import twitch.bet.bo.Channel
import twitch.bet.bo.Bet

class TwitchController {
	def TAG = 'TwitchController - '
	def eventList
	def eventTemplates
	def currChoiceList
	def currEvent
	
    def index() { 
		log.println(TAG + "Rendering index")
		
		eventList = getEventList()
		eventTemplates = getEventTemplates()
		log.println(TAG + "Events - " + eventList)
		
		render (view:'/twitch/index', model:[twitchStream: params.stream, events: eventList, templates: eventTemplates])
	}
	
	def getEventList(){
		return Event.findAllByChannelAndIsTemplate(params.stream, false)
	}
	
	def getEventTemplates(){
		return Event.findAllByChannelAndIsTemplate(params.stream, true)
	}
	
	def getEvent() {
		log.println(TAG + "Id - " + params.eventId)
		 
		currEvent = Event.get(params.eventId)
		currChoiceList = currEvent.choices;
		
		log.println(TAG + "Choices - " + currChoiceList + " - " + currChoiceList[0].name)
		
		render currEvent as JSON
	}
	
	@Transactional
	def saveEvent() {
		log.println(TAG + "Winner - " + params.winner)
		
		def newEvent = new Event()
		newEvent.name = params.eventName
		newEvent.channel = currEvent.channel
		newEvent.winner = EventChoice.get(params.winner)
		newEvent.isTemplate = false
		newEvent.startDate = new Date()
		newEvent.endDate = new Date()
		
		newEvent.save flush:true
		
		render newEvent as JSON
	}
	
//	@Transactional
//	def save(Event eventInstance) {
//		if (eventInstance == null) {
//			notFound()
//			return
//		}
//
//		if (eventInstance.hasErrors()) {
//			respond eventInstance.errors, view:'create'
//			return
//		}
//
//		eventInstance.save flush:true
//
//		request.withFormat {
//			form multipartForm {
//				flash.message = message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), eventInstance.id])
//				redirect eventInstance
//			}
//			'*' { respond eventInstance, [status: CREATED] }
//		}
//	}
	
	def getChoiceList(){
		log.println(TAG + "getChoiceList - " + currChoiceList + " - " + currChoiceList[0].name)
		
		render (template: '/layouts/choiceList',
			model: [choices: currChoiceList],
			contentType: 'text/html') 
	}
	
	def getSetEvent(){
		
	}
	
	def getUser(String userid, String username){
		def myUser = []
		
		myUser.addAll(User.findAllByTwitchId(userid))
		
		if(myUser.isEmpty()){
			myUser.add(createUser(userid, username));
		}
		
		def currUser = myUser.get(0);
		
		render currUser as JSON
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
