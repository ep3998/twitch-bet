<%@ page import="twitch.bet.bo.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'choices', 'error')} ">
	<label for="choices">
		<g:message code="event.choices.label" default="Choices" />
		
	</label>
	<g:select name="choices" from="${twitch.bet.bo.EventChoice.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.choices*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="event.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${eventInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'statRuns', 'error')} required">
	<label for="statRuns">
		<g:message code="event.statRuns.label" default="Stat Runs" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="statRuns" type="number" value="${eventInstance.statRuns}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'statTotalMoney', 'error')} required">
	<label for="statTotalMoney">
		<g:message code="event.statTotalMoney.label" default="Stat Total Money" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="statTotalMoney" value="${fieldValue(bean: eventInstance, field: 'statTotalMoney')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'statUsers', 'error')} required">
	<label for="statUsers">
		<g:message code="event.statUsers.label" default="Stat Users" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="statUsers" type="number" value="${eventInstance.statUsers}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'winner', 'error')} required">
	<label for="winner">
		<g:message code="event.winner.label" default="Winner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="winner" name="winner.id" from="${twitch.bet.bo.EventChoice.list()}" optionKey="id" required="" value="${eventInstance?.winner?.id}" class="many-to-one"/>

</div>

