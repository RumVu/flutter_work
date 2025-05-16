import 'dart:io';

class SinhVien {
  String hoTen;
  double diemToan;
  double diemLy;
  double diemHoa;

  SinhVien(this.hoTen, this.diemToan, this.diemLy, this.diemHoa);

  double tinhDTB() => (diemToan + diemLy + diemHoa) / 3;

  String xepLoai() {
    double dtb = tinhDTB();
    if (dtb < 5) return 'Kém';
    if (dtb < 7) return 'Khá';
    if (dtb < 9) return 'Giỏi';
    return 'Xuất sắc';
  }

  void hienThiThongTin() {
    print(
        'Họ tên: $hoTen, Toán: $diemToan, Lý: $diemLy, Hóa: $diemHoa, ĐTB: ${tinhDTB().toStringAsFixed(2)}, Xếp loại: ${xepLoai()}');
  }
}

List<SinhVien> danhSachSinhVien = [];

void themSinhVien() {
  print('Nhập họ tên:');
  String? hoTen = stdin.readLineSync();
  print('Nhập điểm Toán:');
  double diemToan = double.parse(stdin.readLineSync()!);
  print('Nhập điểm Lý:');
  double diemLy = double.parse(stdin.readLineSync()!);
  print('Nhập điểm Hóa:');
  double diemHoa = double.parse(stdin.readLineSync()!);
  SinhVien sv = SinhVien(hoTen!, diemToan, diemLy, diemHoa);
  danhSachSinhVien.add(sv);
  print('Đã thêm $hoTen.');
}

void hienThiDanhSach() {
  if (danhSachSinhVien.isEmpty) {
    print('Danh sách trống.');
    return;
  }
  for (var sv in danhSachSinhVien) {
    sv.hienThiThongTin();
  }
}

void timSinhVienCaoNhat() {
  if (danhSachSinhVien.isEmpty) {
    print('Danh sách trống.');
    return;
  }
  SinhVien? bestStudent;
  double maxDTB = -1;
  for (var sv in danhSachSinhVien) {
    if (sv.tinhDTB() > maxDTB) {
      maxDTB = sv.tinhDTB();
      bestStudent = sv;
    }
  }
  if (bestStudent != null) {
    print('Sinh viên có ĐTB cao nhất là:');
    bestStudent.hienThiThongTin();
  }
}

void main() {
  int choice = -1;
  while (choice != 0) {
    print('\n--- MENU ---');
    print('1. Thêm sinh viên');
    print('2. Hiển thị danh sách');
    print('3. Tìm sinh viên ĐTB cao nhất');
    print('0. Thoát');
    print('Chọn:');
    choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        themSinhVien();
        break;
      case 2:
        hienThiDanhSach();
        break;
      case 3:
        timSinhVienCaoNhat();
        break;
      case 0:
        print('Thoát.');
        break;
      default:
        print('Lựa chọn không hợp lệ.');
    }
  }
}
