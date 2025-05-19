import 'dart:io';

class Student {
  String id;
  String name;
  int age;
  double grade;

  Student(this.id, this.name, this.age, this.grade);

  void display() {
    print("ID: $id | Name: $name | Age: $age | Grade: $grade");
  }
}

void main() {
  List<Student> studentList = [];

  print("=== CHƯƠNG TRÌNH QUẢN LÝ SINH VIÊN ===");
  print("1. Thêm sinh viên");
  print("2. Hiển thị danh sách sinh viên");
  print("3. Tìm sinh viên theo ID");
  print("Nhập lựa chọn của bạn: ");
  String? choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      print("==> Nhập thông tin sinh viên:");
      stdout.write("ID: ");
      String? id = stdin.readLineSync();

      stdout.write("Tên: ");
      String? name = stdin.readLineSync();

      stdout.write("Tuổi: ");
      int age = int.parse(stdin.readLineSync()!);

      stdout.write("Điểm: ");
      double grade = double.parse(stdin.readLineSync()!);

      Student newStudent = Student(id!, name!, age, grade);
      studentList.add(newStudent);
      print("=> Đã thêm sinh viên thành công!");
      break;

    case '2':
      if (studentList.isEmpty) {
        print("Danh sách sinh viên trống.");
      } else {
        print("==> Danh sách sinh viên:");
        for (var s in studentList) {
          s.display();
        }
      }
      break;

    case '3':
      stdout.write("Nhập ID cần tìm: ");
      String? searchId = stdin.readLineSync();

      Student? found = studentList.firstWhere((s) => s.id == searchId,
          orElse: () => Student("null", "Không tìm thấy", 0, 0));

      if (found.id == "null") {
        print("Không tìm thấy sinh viên!");
      } else {
        found.display();
      }
      break;

    default:
      print("Lựa chọn không hợp lệ nha!");
  }
}
