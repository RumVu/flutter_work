import 'dart:io';

class Person {
  String id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}

// ===============================

class Student extends Person {
  String grade;
  double score;

  Student(
      String id, String name, int age, String gender, this.grade, this.score)
      : super(id, name, age, gender);

  void showInfo() {
    print('Student: $name | Grade: $grade | Score: $score');
  }
}

// ===============================

class Teacher extends Person {
  String subject;
  double salary;

  Teacher(
      String id, String name, int age, String gender, this.subject, this.salary)
      : super(id, name, age, gender);

  void showInfo() {
    print(
        'Teacher: $name | Subject: $subject | Salary: \$${salary.toStringAsFixed(2)}');
  }
}

// ===============================

class Classroom {
  String id;
  String name;
  List<Student> students = [];
  Teacher? teacher;

  Classroom(this.id, this.name);

  void addStudent(Student student) {
    students.add(student);
  }

  void assignTeacher(Teacher teacher) {
    this.teacher = teacher;
  }

  void showClassInfo() {
    print('Classroom: $name (ID: $id)');
    print('Teacher: ${teacher?.name ?? "Chưa gán giáo viên"}');
    print('--- Students ---');
    for (var student in students) {
      student.showInfo();
    }
  }

  double getAverageScore() {
    if (students.isEmpty) return 0;
    double total = students.fold(0, (sum, s) => sum + s.score);
    return total / students.length;
  }
}

// ====================== Menu Người Dùng ======================

void main() {
  Classroom classroom = Classroom("C001", "10A1");

  while (true) {
    print('\n🎓 MENU QUẢN LÝ TRƯỜNG HỌC 🎓');
    print('1. Thêm học sinh');
    print('2. Gán giáo viên cho lớp');
    print('3. Hiển thị thông tin lớp học');
    print('4. Thoát');
    stdout.write(' Nhập lựa chọn: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addStudentFlow(classroom);
        break;
      case '2':
        assignTeacherFlow(classroom);
        break;
      case '3':
        classroom.showClassInfo();
        break;
      case '4':
        print(' Tạm biệt bé!');
        return;
      default:
        print(' Lựa chọn không hợp lệ!');
    }
  }
}

// ====================== Các Hàm Thêm Học Sinh và Gán Giáo Viên ======================
void addStudentFlow(Classroom classroom) {
  stdout.write('Nhập ID học sinh: ');
  String id = stdin.readLineSync() ?? '';
  stdout.write('Tên học sinh: ');
  String name = stdin.readLineSync() ?? '';
  stdout.write('Tuổi: ');
  int age = int.parse(stdin.readLineSync() ?? '0');
  stdout.write('Giới tính: ');
  String gender = stdin.readLineSync() ?? '';
  stdout.write('Lớp (VD: 10A1): ');
  String grade = stdin.readLineSync() ?? '';
  stdout.write('Điểm số: ');
  double score = double.parse(stdin.readLineSync() ?? '0');

  var student = Student(id, name, age, gender, grade, score);
  classroom.addStudent(student);
  print(' Đã thêm học sinh!');
}

void assignTeacherFlow(Classroom classroom) {
  stdout.write('Nhập ID giáo viên: ');
  String id = stdin.readLineSync() ?? '';
  stdout.write('Tên giáo viên: ');
  String name = stdin.readLineSync() ?? '';
  stdout.write('Tuổi: ');
  int age = int.parse(stdin.readLineSync() ?? '0');
  stdout.write('Giới tính: ');
  String gender = stdin.readLineSync() ?? '';
  stdout.write('Môn dạy: ');
  String subject = stdin.readLineSync() ?? '';
  stdout.write('Lương: ');
  double salary = double.parse(stdin.readLineSync() ?? '0');

  var teacher = Teacher(id, name, age, gender, subject, salary);
  classroom.assignTeacher(teacher);
  print(' Đã gán giáo viên!');
}
