package twitch.bet

import grails.converters.JSON
import twitch.bet.bo.User
import twitch.bet.bo.Event
import twitch.bet.bo.EventChoice
import twitch.bet.bo.Channel
import twitch.bet.bo.Bet

class TwitchController {
	def TAG = 'TwitchController - '
	def eventList
	def eventTemplates
	
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
		render event as JSON
	}
	
	def getSetEvent(){
		
		
	}
}
