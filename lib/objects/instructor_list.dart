import 'package:tma_instructors/objects/instructor.dart';

class InstructorList {
  late List<Instructor> list;

  void addInstructor(Instructor instructor) {
    list.add(instructor);
  } // adds an instructor

  void removeInstructorAt(int index) {
    list.removeAt(index);
  } // removes an instructor from index

  void removeInstructor(Instructor instructor) {
    list.remove(instructor);
  } // removes an instructor from object

  Instructor retriveInstructor(String firstName, String lastName, String password) {
    for (Instructor instructorInList in list) {
      if (instructorInList.checkName([firstName, lastName].join(" "))) {
        return instructorInList;
      }
    }

    return Instructor(firstName, lastName, password);
  } // returns instructor object
}
