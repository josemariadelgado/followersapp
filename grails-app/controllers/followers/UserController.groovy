package followers

class UserController {
    User currentUser
    User searchedUser
    static int signUpFailed = 0
    static int logInFailed = 0
    static int searchedFailed = 0
    static int registered = 0

    def index() {
        logInFailed = 0
        registered = 0
        signUpFailed = 0
        redirect(uri: "/")
    }

    def signUpView() {
        logInFailed = 0
        registered = 0
        redirect(uri: "/signup")
    }

    def signUp() {

        def u = User.findByUsername(params.username)

        if (!u) {

            if (params.password == params.repeatPassword) {

                def newUser = new User(username: params.username, date: new Date(), password:
                        params.password, followers: 0, following: 0)
                newUser.save()

                if (newUser.save()) {
                    signUpFailed = 0
                    registered = 1
                    render(view: "/logIn", model: [user: newUser])
                    println "New user saved"

                } else {
                    render "There has been an error while registering you, please try again later."
                }

            } else {
                signUpFailed = 1
                render(view: "/signUp", model: [username: params.username])
                println "Password fields do not match"
            }

        } else {
            signUpFailed = 2
            render(view: "/signUp")
            println "Username already taken."
        }
    }

    def logIn() {

        def u = User.findByUsernameAndPassword(params.username, params.password)

        if (u) {
            println "Log In succes"
            logInFailed = 0
            registered = 0
            session.user = u
            currentUser = u
            redirect(action: "home")

        } else {
            logInFailed = 1
            render(view: "/logIn", model: [username: params.username])
            println "Log In failed"
        }
    }

    def logOut() {

        if (session.user) {
            session.invalidate()
            redirect(uri: "/")
            currentUser = null
            searchedFailed = 0
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

            if (!u) {
                searchedFailed = 2
                redirect(action: "home")
                println "User not found."

            } else if(u && u.username == currentUser.username) {
                searchedFailed = 1
                redirect(action: "home")
                println "You have searched yourself."

            } else if (u) {
                searchedFailed = 0
                searchedUser = u
                def following = Following.findByFollowerAndFollowed(currentUser, u)
                render(view: "/userProfile", model: [user: u, following: following])
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
    
    def unfollowUser() {

        def u = User.find(currentUser)
        def searchedUser = User.find(searchedUser)
        def following = Following.findByFollowerAndFollowed(u, searchedUser)
        following.delete()

        u.following -= 1
        searchedUser.followers -=1
        u.save(flush: true)
        searchedUser.save(flush: true)

        currentUser = u
        redirect(action: "home")
        println "You have unfollowed @${searchedUser.username}"
    }
}
