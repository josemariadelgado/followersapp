class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/logIn")
        "/login"(view:"/logIn")
        "/signup"(view:"/signUp")
        "500"(view:'/error')
	}
}
