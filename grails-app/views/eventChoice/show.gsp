
<%@ page import="twitch.bet.bo.EventChoice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'eventChoice.label', default: 'EventChoice')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-eventChoice" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-eventChoice" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list eventChoice">
			
				<g:if test="${eventChoiceInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="eventChoice.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${eventChoiceInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventChoiceInstance?.isActive}">
				<li class="fieldcontain">
					<span id="isActive-label" class="property-label"><g:message code="eventChoice.isActive.label" default="Is Active" /></span>
					
						<span class="property-value" aria-labelledby="isActive-label"><g:formatBoolean boolean="${eventChoiceInstance?.isActive}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventChoiceInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="eventChoice.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${eventChoiceInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventChoiceInstance?.odds}">
				<li class="fieldcontain">
					<span id="odds-label" class="property-label"><g:message code="eventChoice.odds.label" default="Odds" /></span>
					
						<span class="property-value" aria-labelledby="odds-label"><g:fieldValue bean="${eventChoiceInstance}" field="odds"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventChoiceInstance?.statLoss}">
				<li class="fieldcontain">
					<span id="statLoss-label" class="property-label"><g:message code="eventChoice.statLoss.label" default="Stat Loss" /></span>
					
						<span class="property-value" aria-labelledby="statLoss-label"><g:fieldValue bean="${eventChoiceInstance}" field="statLoss"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventChoiceInstance?.statLossDollar}">
				<li class="fieldcontain">
					<span id="statLossDollar-label" class="property-label"><g:message code="eventChoice.statLossDollar.label" default="Stat Loss Dollar" /></span>
					
						<span class="property-value" aria-labelledby="statLossDollar-label"><g:fieldValue bean="${eventChoiceInstance}" field="statLossDollar"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventChoiceInstance?.statWin}">
				<li class="fieldcontain">
					<span id="statWin-label" class="property-label"><g:message code="eventChoice.statWin.label" default="Stat Win" /></span>
					
						<span class="property-value" aria-labelledby="statWin-label"><g:fieldValue bean="${eventChoiceInstance}" field="statWin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventChoiceInstance?.statWinDollar}">
				<li class="fieldcontain">
					<span id="statWinDollar-label" class="property-label"><g:message code="eventChoice.statWinDollar.label" default="Stat Win Dollar" /></span>
					
						<span class="property-value" aria-labelledby="statWinDollar-label"><g:fieldValue bean="${eventChoiceInstance}" field="statWinDollar"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:eventChoiceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${eventChoiceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
