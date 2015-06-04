
<%@ page import="twitch.bet.bo.EventChoice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'eventChoice.label', default: 'EventChoice')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-eventChoice" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-eventChoice" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'eventChoice.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="isActive" title="${message(code: 'eventChoice.isActive.label', default: 'Is Active')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'eventChoice.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="odds" title="${message(code: 'eventChoice.odds.label', default: 'Odds')}" />
					
						<g:sortableColumn property="statLoss" title="${message(code: 'eventChoice.statLoss.label', default: 'Stat Loss')}" />
					
						<g:sortableColumn property="statLossDollar" title="${message(code: 'eventChoice.statLossDollar.label', default: 'Stat Loss Dollar')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventChoiceInstanceList}" status="i" var="eventChoiceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventChoiceInstance.id}">${fieldValue(bean: eventChoiceInstance, field: "description")}</g:link></td>
					
						<td><g:formatBoolean boolean="${eventChoiceInstance.isActive}" /></td>
					
						<td>${fieldValue(bean: eventChoiceInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: eventChoiceInstance, field: "odds")}</td>
					
						<td>${fieldValue(bean: eventChoiceInstance, field: "statLoss")}</td>
					
						<td>${fieldValue(bean: eventChoiceInstance, field: "statLossDollar")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${eventChoiceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
