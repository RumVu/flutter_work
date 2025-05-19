import 'dart:io';
import 'dart:math';

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b == 0) throw Exception("Không thể chia cho 0");
    return a / b;
  }

  double power(double a, double b) => pow(a, b).toDouble();
  double squareRoot(double a) => sqrt(a);
}

void main() {
  Calculator calc = Calculator();

  stdout.write("Nhập số A: ");
  double a = double.parse(stdin.readLineSync()!);

  stdout.write("Nhập số B: ");
  double b = double.parse(stdin.readLineSync()!);

  print(
      "1. Cộng\n2. Trừ\n3. Nhân\n4. Chia\n5. Lũy thừa (A^B)\n6. Căn bậc 2 của A");
  stdout.write("Chọn phép tính: ");
  String? choice = stdin.readLineSync();

  try {
    switch (choice) {
      case '1':
        print("Kết quả: ${calc.add(a, b)}");
        break;
      case '2':
        print("Kết quả: ${calc.subtract(a, b)}");
        break;
      case '3':
        print("Kết quả: ${calc.multiply(a, b)}");
        break;
      case '4':
        print("Kết quả: ${calc.divide(a, b)}");
        break;
      case '5':
        print("Kết quả: ${calc.power(a, b)}");
        break;
      case '6':
        print("Kết quả căn bậc hai: ${calc.squareRoot(a)}");
        break;
      default:
        print("Lựa chọn không hợp lệ.");
    }
  } catch (e) {
    print("Lỗi: ${e.toString()}");
  }
}
