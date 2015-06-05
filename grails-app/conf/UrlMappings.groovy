class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
		
		"/twitch/$stream?"(controller: "twitch", view:"/twitch/index")

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
