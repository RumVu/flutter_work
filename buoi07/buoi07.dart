import 'dart:io';

void main(List<String> args) {
  stdout.write("Nhập số nguyên dương n: ");
  int number = int.parse(stdin.readLineSync()!);
  isPrime(number);
}

isPrime(int n) {
  if (n < 2) {
    print("$n không phải là số nguyên tố");
    return;
  }
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) {
      print("$n không phải là số nguyên tố");
      return;
    }
  }
  print("$n là số nguyên tố");
}
