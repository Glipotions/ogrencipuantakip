class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  // String status;

  Student.withId(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.grade});

  String get getStatus {
    String message = "";
    if (grade >= 50) {
      message = "Geçti.";
    } else if (grade >= 40) {
      message = "Bütünlemeye Kaldı.";
    } else {
      message = "Kaldı.";
    }
    // status = message;
    return message;
  }
}
