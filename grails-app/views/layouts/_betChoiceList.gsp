<g:each in="${choices}" status="i" var="choice">
	<a id="choice_${i}" href="#" class="list-group-item">${fieldValue(bean: choice, field: "name")}</a>
</g:each>
