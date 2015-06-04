<%@ page import="twitch.bet.bo.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'bets', 'error')} ">
	<label for="bets">
		<g:message code="user.bets.label" default="Bets" />
		
	</label>
	<g:select name="bets" from="${twitch.bet.bo.Bet.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.bets*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'money', 'error')} required">
	<label for="money">
		<g:message code="user.money.label" default="Money" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="money" value="${fieldValue(bean: userInstance, field: 'money')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'twitchId', 'error')} required">
	<label for="twitchId">
		<g:message code="user.twitchId.label" default="Twitch Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="twitchId" required="" value="${userInstance?.twitchId}"/>

</div>

