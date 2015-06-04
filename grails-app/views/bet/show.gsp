
<%@ page import="twitch.bet.bo.Bet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bet.label', default: 'Bet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bet">
			
				<g:if test="${betInstance?.choice}">
				<li class="fieldcontain">
					<span id="choice-label" class="property-label"><g:message code="bet.choice.label" default="Choice" /></span>
					
						<span class="property-value" aria-labelledby="choice-label"><g:link controller="eventChoice" action="show" id="${betInstance?.choice?.id}">${betInstance?.choice?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${betInstance?.dollarAmt}">
				<li class="fieldcontain">
					<span id="dollarAmt-label" class="property-label"><g:message code="bet.dollarAmt.label" default="Dollar Amt" /></span>
					
						<span class="property-value" aria-labelledby="dollarAmt-label"><g:fieldValue bean="${betInstance}" field="dollarAmt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${betInstance?.event}">
				<li class="fieldcontain">
					<span id="event-label" class="property-label"><g:message code="bet.event.label" default="Event" /></span>
					
						<span class="property-value" aria-labelledby="event-label"><g:link controller="event" action="show" id="${betInstance?.event?.id}">${betInstance?.event?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${betInstance?.isWin}">
				<li class="fieldcontain">
					<span id="isWin-label" class="property-label"><g:message code="bet.isWin.label" default="Is Win" /></span>
					
						<span class="property-value" aria-labelledby="isWin-label"><g:formatBoolean boolean="${betInstance?.isWin}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:betInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${betInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
