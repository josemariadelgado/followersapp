package followers

class Following {
    Date date

    static belongsTo = [follower: User, followed: User]

    static constraints = {
    }
}
