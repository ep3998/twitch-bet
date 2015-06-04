<%@ page import="twitch.bet.bo.EventChoice" %>



<div class="fieldcontain ${hasErrors(bean: eventChoiceInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="eventChoice.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${eventChoiceInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventChoiceInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="eventChoice.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${eventChoiceInstance?.isActive}" />

</div>

<div class="fieldcontain ${hasErrors(bean: eventChoiceInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="eventChoice.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${eventChoiceInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventChoiceInstance, field: 'odds', 'error')} required">
	<label for="odds">
		<g:message code="eventChoice.odds.label" default="Odds" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="odds" value="${fieldValue(bean: eventChoiceInstance, field: 'odds')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventChoiceInstance, field: 'statLoss', 'error')} required">
	<label for="statLoss">
		<g:message code="eventChoice.statLoss.label" default="Stat Loss" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="statLoss" type="number" value="${eventChoiceInstance.statLoss}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventChoiceInstance, field: 'statLossDollar', 'error')} required">
	<label for="statLossDollar">
		<g:message code="eventChoice.statLossDollar.label" default="Stat Loss Dollar" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="statLossDollar" value="${fieldValue(bean: eventChoiceInstance, field: 'statLossDollar')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventChoiceInstance, field: 'statWin', 'error')} required">
	<label for="statWin">
		<g:message code="eventChoice.statWin.label" default="Stat Win" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="statWin" type="number" value="${eventChoiceInstance.statWin}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventChoiceInstance, field: 'statWinDollar', 'error')} required">
	<label for="statWinDollar">
		<g:message code="eventChoice.statWinDollar.label" default="Stat Win Dollar" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="statWinDollar" value="${fieldValue(bean: eventChoiceInstance, field: 'statWinDollar')}" required=""/>

</div>

