package twitch.bet.bo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventChoiceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EventChoice.list(params), model:[eventChoiceInstanceCount: EventChoice.count()]
    }

    def show(EventChoice eventChoiceInstance) {
        respond eventChoiceInstance
    }

    def create() {
        respond new EventChoice(params)
    }

    @Transactional
    def save(EventChoice eventChoiceInstance) {
        if (eventChoiceInstance == null) {
            notFound()
            return
        }

        if (eventChoiceInstance.hasErrors()) {
            respond eventChoiceInstance.errors, view:'create'
            return
        }

        eventChoiceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'eventChoice.label', default: 'EventChoice'), eventChoiceInstance.id])
                redirect eventChoiceInstance
            }
            '*' { respond eventChoiceInstance, [status: CREATED] }
        }
    }

    def edit(EventChoice eventChoiceInstance) {
        respond eventChoiceInstance
    }

    @Transactional
    def update(EventChoice eventChoiceInstance) {
        if (eventChoiceInstance == null) {
            notFound()
            return
        }

        if (eventChoiceInstance.hasErrors()) {
            respond eventChoiceInstance.errors, view:'edit'
            return
        }

        eventChoiceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EventChoice.label', default: 'EventChoice'), eventChoiceInstance.id])
                redirect eventChoiceInstance
            }
            '*'{ respond eventChoiceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EventChoice eventChoiceInstance) {

        if (eventChoiceInstance == null) {
            notFound()
            return
        }

        eventChoiceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EventChoice.label', default: 'EventChoice'), eventChoiceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventChoice.label', default: 'EventChoice'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
