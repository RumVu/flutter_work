import 'dart:io';

void main() {
  stdout.write('nhap thong tin nhan vien: ');
  String? nhanVien = stdin.readLineSync();
  stdout.write('nhap so gio lam viec: ');
  int? soGioLamViec = int.parse(stdin.readLineSync().toString());
  stdout.write('nhap Luong moi gio: ');
  double? luongMoiGio = double.parse(stdin.readLineSync().toString());
  double? Tongluong = soGioLamViec.toDouble() * luongMoiGio!;

//   if (soGioLamViec > 40)
  var PhuCap = soGioLamViec > 40 ? 0.2 * Tongluong : 0;
  var TongTien = Tongluong + PhuCap;
//   ThueThuNhap
  var ThueThuNhap = Tongluong > 10000000
      ? Tongluong * 0.1
      : 10000000 > Tongluong && Tongluong >= 7000000
          ? Tongluong * 0.05
          : 0;
  var TongTienThuc = TongTien - ThueThuNhap;
//  var ThueThuNhap = Tongluong > 10000000 ? Tongluong * 0.1 : 0;
  print('---------------------------------------');
  print('nhan vien: $nhanVien');
  print('so gio lam viec: $soGioLamViec');
  print('luong moi gio: $luongMoiGio');
  print('tong luong truoc thue: $Tongluong');
  print('thue thu nhap: $ThueThuNhap');
  print('tong tien thuc: $TongTienThuc');
  print('---------------------------------------');
}
