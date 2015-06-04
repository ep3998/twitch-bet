package twitch.bet.bo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChannelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Channel.list(params), model:[channelInstanceCount: Channel.count()]
    }

    def show(Channel channelInstance) {
        respond channelInstance
    }

    def create() {
        respond new Channel(params)
    }

    @Transactional
    def save(Channel channelInstance) {
        if (channelInstance == null) {
            notFound()
            return
        }

        if (channelInstance.hasErrors()) {
            respond channelInstance.errors, view:'create'
            return
        }

        channelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'channel.label', default: 'Channel'), channelInstance.id])
                redirect channelInstance
            }
            '*' { respond channelInstance, [status: CREATED] }
        }
    }

    def edit(Channel channelInstance) {
        respond channelInstance
    }

    @Transactional
    def update(Channel channelInstance) {
        if (channelInstance == null) {
            notFound()
            return
        }

        if (channelInstance.hasErrors()) {
            respond channelInstance.errors, view:'edit'
            return
        }

        channelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Channel.label', default: 'Channel'), channelInstance.id])
                redirect channelInstance
            }
            '*'{ respond channelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Channel channelInstance) {

        if (channelInstance == null) {
            notFound()
            return
        }

        channelInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Channel.label', default: 'Channel'), channelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'channel.label', default: 'Channel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
