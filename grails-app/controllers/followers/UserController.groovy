package followers

class UserController {
    User currentUser
    User searchedUser

    def index() { }

    def signUp() {

        def u = User.findByUsername(params.username)

        if (!u) {

            if (params.password == params.repeatPassword) {

                def newUser = new User(username: params.username, password: params.password, followers: 0, following: 0)
                newUser.save()

                if (newUser.save()) {
                    render "New user saved"

                } else {
                    render "failed"
                }

            } else {
                render "Password fields do not match"
            }

        } else {
            render "Username already taken"
        }
    }

    def logIn() {

        def u = User.findByUsernameAndPassword(params.username, params.password)

        if (u) {
            println "Log In succes"
            session.user = u
            currentUser = u
            redirect(action: "home")

        } else {
            render "Log In failed"
        }
    }

    def logOut() {

        if (session.user) {
            session.invalidate()
            redirect(uri: "/")
            currentUser = null
        }
    }

    def home() {

        if (session.user) {

            def u = User.find(currentUser)
            def mostFollowedUsers = User.list(max: 5, sort: "followers", order: "desc")
            render(view: "/home", model: [user: u, mostFollowedUsers: mostFollowedUsers])

        } else {
            redirect(uri: "/")
        }
    }

    def searchUser() {

        if (session.user) {

            def u = User.findByUsername(params.searchUser)

            if (u) {
                searchedUser = u
                render(view: "/userProfile", model: [user: u])

            } else {
                render "User not found"
            }

        } else {
            redirect(uri: "/")
        }
    }

    def followUser() {

        def u = User.find(currentUser)
        def searchedUser = User.find(searchedUser)
        def following = new Following(date: new Date(), follower: u, followed: searchedUser)
        following.save()

        u.following += 1
        searchedUser.followers += 1
        u.save(flush: true)
        searchedUser.save(flush: true)

        if (following.save()) {
            currentUser = u
            redirect(action: "home")
            println "You are now following @${searchedUser.username}"

        } else {
            println "Error while following user"
        }
    }
}
