class Instructor {
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late bool admin;
  late bool registered;

  Instructor(this.firstName, this.lastName, this.password) {
    admin = false;
    registered = false;
  }

  set setFirstName(String firstName) {
    this.firstName = firstName;
  }

  set setLastName(String lastName) {
    this.lastName = lastName;
  }

  set setPassword(String password) {
    this.password = password;
  }

  bool checkPassword(String password) {
    if (this.password == password) return true;
    return false;
  } // returns true if password is correct

  bool checkName(String username) {
    List name = username.split(" ");
    if (name[0].toLowerCase() == firstName.toLowerCase() &&
        name[1].toLowerCase() == lastName.toLowerCase()) return true;
    return false;
  } // returns true if the name inputted (full name with space) is identical
}
