import 'dart:io';

void main() {
  stdout.write('Nhập họ và tên: ');
  String ten = stdin.readLineSync().toString();
  stdout.write('Nhập điểm Toán: ');
  double toan = double.parse(stdin.readLineSync().toString());
  stdout.write('Nhập điểm Lý: ');
  double ly = double.parse(stdin.readLineSync().toString());
  stdout.write('Nhập điểm Hóa: ');
  double hoa = double.parse(stdin.readLineSync().toString());

  double dtb = (toan + ly + hoa) / 3;
  String xepLoai;

  if (toan < 4.0 || ly < 4.0 || hoa < 4.0) {
    xepLoai = "Trượt môn";
  } else if (dtb >= 8.0) {
    xepLoai = "Giỏi";
  } else if (dtb >= 6.5) {
    xepLoai = "Khá";
  } else if (dtb >= 5.0) {
    xepLoai = "Trung bình";
  } else {
    xepLoai = "Yếu";
  }

  print('\n--- Thông tin sinh viên ---');
  print('Họ tên: $ten');
  print('Toán: $toan');
  print('Lý: $ly');
  print('Hóa: $hoa');
  print('Điểm trung bình: ${dtb.toStringAsFixed(1)}');
  print('Xếp loại: $xepLoai');
}
