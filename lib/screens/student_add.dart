import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrencipuantakip/models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  // StudentAdd(List<Student> students){
  //   this.students=students;
  // }
  StudentAdd(this.students, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  Student student =
      Student.withId(id: 5, firstName: "", lastName: "", grade: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Yeni Öğrenci Ekle"),
        ),
        body: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameBuild(),
                buildLastNameBuild(),
                buildGradeBuild(),
                buildSaveButton()
              ],
            ),
          ),
        ));
  }

  Widget buildFirstNameBuild() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: "Öğrenci Adı", hintText: "İsim"),
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }

  Widget buildLastNameBuild() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Öğrenci Soyadı", hintText: "Soyisim"),
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }

  Widget buildGradeBuild() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: "Öğrencinin Notu", hintText: "25"),
      onSaved: (String? value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSaveButton() {
    return ElevatedButton(
      child: const Text("Kaydet"),
      onPressed: () {
        formKey.currentState!.save(); //elimizdeki student oluştu
        widget.students.add(student); //ekleme işlemini yapar.
        Navigator.pop(context); // Önceki sayfaya otomatik olarak döner
      },
    );
  }
}
