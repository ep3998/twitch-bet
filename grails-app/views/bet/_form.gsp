<%@ page import="twitch.bet.bo.Bet" %>



<div class="fieldcontain ${hasErrors(bean: betInstance, field: 'choice', 'error')} required">
	<label for="choice">
		<g:message code="bet.choice.label" default="Choice" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="choice" name="choice.id" from="${twitch.bet.bo.EventChoice.list()}" optionKey="id" required="" value="${betInstance?.choice?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: betInstance, field: 'dollarAmt', 'error')} required">
	<label for="dollarAmt">
		<g:message code="bet.dollarAmt.label" default="Dollar Amt" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dollarAmt" value="${fieldValue(bean: betInstance, field: 'dollarAmt')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: betInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="bet.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${twitch.bet.bo.Event.list()}" optionKey="id" required="" value="${betInstance?.event?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: betInstance, field: 'isWin', 'error')} ">
	<label for="isWin">
		<g:message code="bet.isWin.label" default="Is Win" />
		
	</label>
	<g:checkBox name="isWin" value="${betInstance?.isWin}" />

</div>

