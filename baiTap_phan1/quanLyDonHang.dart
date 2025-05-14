import 'dart:io';

void main(List<String> args) {
  stdout.write('nhap ten san pham: ');
  String? tenSanPham = stdin.readLineSync();
  stdout.write('nhap so luong san pham: ');
  int? soLuong = int.parse(stdin.readLineSync().toString());
  stdout.write('nhap don gia san pham: ');
  double? donGia = double.parse(stdin.readLineSync().toString());

  double? thanhTien = soLuong.toDouble() * donGia!;
  double? giamGia = thanhTien > 1000000
      ? thanhTien * 0.1
      : 1000000 > thanhTien && thanhTien >= 5000000
          ? thanhTien * 0.05
          : 0;
  double? TongTien = thanhTien - giamGia;
  double? ThueVAT = TongTien * 0.08;
  double? TongTienThuc = TongTien + ThueVAT;
  print('---------------------------------------');
  print('ten san pham: $tenSanPham');
  print('so luong san pham: $soLuong');
  print('don gia san pham: $donGia');
  print('thanh tien: $thanhTien');
  print('giam gia: $giamGia');
  print('thue VAT: $ThueVAT');
  print('tong tien: $TongTienThuc');
}
