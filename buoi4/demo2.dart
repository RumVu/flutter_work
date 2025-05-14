import 'dart:io';
import 'dart:math';

void main() {
  print('nhap 2 so nguyen');
  stdout.write('nhap so a:');
  int a = int.parse(stdin.readLineSync().toString());
  stdout.write('nhap so b:');
  int b = int.parse(stdin.readLineSync().toString());
  if (a == b) {
    print('so nguyen a: $a == so nguyen b: $b');
  } else {
    print('so nguyen a: $a != so nguyen b: $b');
  }

  print('nhap 2 so nguyen');
  stdout.write('nhap so x:');
  int x = int.parse(stdin.readLineSync().toString());
  stdout.write('nhap so y:');
  int y = int.parse(stdin.readLineSync().toString());
  if (x > y) {
    print('so nguyen x: $x > so nguyen y: $y');
  }
  if (x < y) {
    print('so nguyen x: $x < so nguyen y: $y');
  }

  print('nhap 2 so thuc');
  stdout.write('nhap so p:');
  double p = double.parse(stdin.readLineSync().toString());
  stdout.write('nhap so q:');
  double q = double.parse(stdin.readLineSync().toString());
  if (p >= q) {
    print('so thuc p: $p >= so thuc q: $q');
  }
  if (p <= q) {
    print('so thuc p: $p <= so thuc q: $q');
  }
}
