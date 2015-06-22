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
	def choiceList
	
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
		 
		def event = Event.get(params.eventId)
		choiceList = event.choices
		
		render event as JSON
	}
	
	@Transactional
	def saveEvent() {
		log.println(TAG + "Id - " + params.eventId)
		log.println(TAG + "Winner - " + params.winner)
		
		def event = Event.get(params.eventId)
		if(event == null){
			return
		}
		
//		if()
		
		render event as JSON
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
		render template: '/layouts/choiceList',
			model: [choiceList: choiceList],
			contentType: 'text/plain'
	}
	
	def getSetEvent(){
		
		
	}
}
