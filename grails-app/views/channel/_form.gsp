<%@ page import="twitch.bet.bo.Channel" %>



<div class="fieldcontain ${hasErrors(bean: channelInstance, field: 'events', 'error')} ">
	<label for="events">
		<g:message code="channel.events.label" default="Events" />
		
	</label>
	<g:select name="events" from="${twitch.bet.bo.Event.list()}" multiple="multiple" optionKey="id" size="5" value="${channelInstance?.events*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: channelInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="channel.users.label" default="Users" />
		
	</label>
	<g:select name="users" from="${twitch.bet.bo.User.list()}" multiple="multiple" optionKey="id" size="5" value="${channelInstance?.users*.id}" class="many-to-many"/>

</div>

