<g:each in="${choiceList} status="i" var="choice">
	<li id="choice_${choice.id}" role="presentation"><a role="menuitem" tabindex="-1" href="#">${choice.name}</a>
</g:each>
