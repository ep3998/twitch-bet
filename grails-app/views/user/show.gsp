
<%@ page import="twitch.bet.bo.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.bets}">
				<li class="fieldcontain">
					<span id="bets-label" class="property-label"><g:message code="user.bets.label" default="Bets" /></span>
					
						<g:each in="${userInstance.bets}" var="b">
						<span class="property-value" aria-labelledby="bets-label"><g:link controller="bet" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.money}">
				<li class="fieldcontain">
					<span id="money-label" class="property-label"><g:message code="user.money.label" default="Money" /></span>
					
						<span class="property-value" aria-labelledby="money-label"><g:fieldValue bean="${userInstance}" field="money"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.twitchId}">
				<li class="fieldcontain">
					<span id="twitchId-label" class="property-label"><g:message code="user.twitchId.label" default="Twitch Id" /></span>
					
						<span class="property-value" aria-labelledby="twitchId-label"><g:fieldValue bean="${userInstance}" field="twitchId"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
