import 'dart:io';

void main(List<String> args) {
  //Bài 1: Tính tổng số nguyên

  stdout.write("Nhập số nguyên dương n: ");
  int number = int.parse(stdin.readLineSync()!);
  int sum = 0;
  for (var i = 1; i < number; i++) {
    sum += i;
  }
  print("Tổng các số nguyên dương từ 0 đến $number là: $sum");

  //Bài 2: Bảng cửu chương
  stdout.write("Nhập số nguyên dương n: ");
  int number2 = int.parse(stdin.readLineSync()!);
  print("bang cuu chuong cua $number2 la: ");
  for (var i = 1; i <= 10; i++) {
    print("$number2 x $i = ${number2 * i}");
  }
//   Bài 3: Đếm số chẵn và lẻ
  stdout.write("Nhập số nguyên dương n: ");
  int number4 = int.parse(stdin.readLineSync()!);
  int countChan = 0;
  int countLe = 0;
  for (var i = 1; i <= number4; i++) {
    if (i % 2 == 0) {
      countChan++;
    } else {
      countLe++;
    }
  }
  print("Có $countChan số chẵn và $countLe số lẻ từ 1 đến $number4");
//   //Bài 4: Tính giai thừa
  stdout.write("Nhập số nguyên dương n: ");
  int number3 = int.parse(stdin.readLineSync()!);
  int giaiThua = 1;
  for (var i = 1; i <= number3; i++) {
    giaiThua *= i;
  }
  print("Giai thua cua $number3 la: $giaiThua");

//   Bài 5: Đảo ngược số
  stdout.write("Nhập số nguyên dương n cần đảo ngược: ");
  int number5 = int.parse(stdin.readLineSync()!);
  int soDao = 0;
  while (number5 > 0) {
    int digit = number5 % 10;
    soDao = soDao * 10 + digit;
    number5 ~/= 10;
  }
  print("Số được đảo ngược là: $soDao");
}
