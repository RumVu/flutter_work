import 'dart:math';

void giaiPhuongTrinhBac1(double a, double b) {
  if (a == 0) {
    if (b == 0) {
      print('Phương trình vô số nghiệm.');
    } else {
      print('Phương trình vô nghiệm.');
    }
  } else {
    double x = -b / a;
    print('Nghiệm của phương trình là x = $x');
  }
}

void giaiPhuongTrinhBac2(double a, double b, double c) {
  if (a == 0) {
    // Trường hợp đặc biệt: trở thành phương trình bậc 1
    giaiPhuongTrinhBac1(b, c);
    return;
  }

  double delta = b * b - 4 * a * c;

  if (delta > 0) {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print('Phương trình có 2 nghiệm phân biệt: x1 = $x1, x2 = $x2');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('Phương trình có nghiệm kép: x = $x');
  } else {
    print('Phương trình vô nghiệm (delta < 0)');
  }
}

void main() {
  print('Giải phương trình bậc 1: 2x + 3 = 0');
  giaiPhuongTrinhBac1(2, 3);

  print('\nGiải phương trình bậc 2: x^2 - 3x + 2 = 0');
  giaiPhuongTrinhBac2(1, -3, 2);
}
