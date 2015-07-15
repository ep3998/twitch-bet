<g:each in="${choices}" status="i" var="choice">
	<li id="choice_${choice.id}" role="presentation"><a role="menuitem" tabindex="-1" href="#">${fieldValue(bean: choice, field: "name")}</a>
</g:each>
