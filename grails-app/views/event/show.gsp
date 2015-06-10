
<%@ page import="twitch.bet.bo.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-event" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list event">
			
				<g:if test="${eventInstance?.choices}">
				<li class="fieldcontain">
					<span id="choices-label" class="property-label"><g:message code="event.choices.label" default="Choices" /></span>
					
						<g:each in="${eventInstance.choices}" var="c">
						<span class="property-value" aria-labelledby="choices-label"><g:link controller="eventChoice" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="event.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${eventInstance}" field="name"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.channel}">
				<li class="fieldcontain">
					<span id="channel-label" class="property-label"><g:message code="event.channel.label" default="Channel" /></span>
					
						<span class="property-value" aria-labelledby="channel-label"><g:fieldValue bean="${eventInstance}" field="channel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.statRuns}">
				<li class="fieldcontain">
					<span id="statRuns-label" class="property-label"><g:message code="event.statRuns.label" default="Stat Runs" /></span>
					
						<span class="property-value" aria-labelledby="statRuns-label"><g:fieldValue bean="${eventInstance}" field="statRuns"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.statTotalMoney}">
				<li class="fieldcontain">
					<span id="statTotalMoney-label" class="property-label"><g:message code="event.statTotalMoney.label" default="Stat Total Money" /></span>
					
						<span class="property-value" aria-labelledby="statTotalMoney-label"><g:fieldValue bean="${eventInstance}" field="statTotalMoney"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.statUsers}">
				<li class="fieldcontain">
					<span id="statUsers-label" class="property-label"><g:message code="event.statUsers.label" default="Stat Users" /></span>
					
						<span class="property-value" aria-labelledby="statUsers-label"><g:fieldValue bean="${eventInstance}" field="statUsers"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.winner}">
				<li class="fieldcontain">
					<span id="winner-label" class="property-label"><g:message code="event.winner.label" default="Winner" /></span>
					
						<span class="property-value" aria-labelledby="winner-label"><g:link controller="eventChoice" action="show" id="${eventInstance?.winner?.id}">${eventInstance?.winner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:eventInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${eventInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
