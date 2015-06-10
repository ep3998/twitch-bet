class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
		
		"/twitch/$stream?/$action?"(controller: "twitch")

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
