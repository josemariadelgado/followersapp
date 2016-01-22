package followers

class User {
    String username
    String password
    Date date
    int following
    int followers

    static constraints = {

        username(blank: false, unique: true)

    }
}
