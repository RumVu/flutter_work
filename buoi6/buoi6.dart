import 'dart:io';

void main(List<String> args) {
  //Bài 1: Tính tổng số nguyên

  stdout.write("Nhập số nguyên dương n: ");
  int number = int.parse(stdin.readLineSync()!);
  int sum = 0;
  for (var i = 0; i < number; i++) {
    sum += i;
  }
}
