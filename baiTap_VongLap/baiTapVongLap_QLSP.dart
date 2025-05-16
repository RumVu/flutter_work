import 'dart:io';

class SanPham {
  String tenSanPham;
  double giaTien;
  int soLuongTrongKho;

  SanPham(this.tenSanPham, this.giaTien, this.soLuongTrongKho);

  void hienThiThongTin() {
    print(
        'Tên: ${tenSanPham.toString()}, Giá: ${giaTien.toStringAsFixed(0)} VNĐ, Số lượng: ${soLuongTrongKho.toString()}');
  }
}

List<SanPham> danhSachSanPham = [];

void themSanPhamVaoDanhSach() {
  print('Nhập tên sản phẩm:');
  String? ten;
  while (ten == null || ten.isEmpty) {
    ten = stdin.readLineSync();
    if (ten == null || ten.isEmpty) {
      print('Tên sản phẩm không được để trống. Vui lòng nhập lại.');
    }
  }
  double? gia;
  while (gia == null) {
    print('Nhập giá tiền:');
    String? chuoiGia = stdin.readLineSync();
    if (chuoiGia != null && double.tryParse(chuoiGia) != null) {
      gia = double.parse(chuoiGia);
    } else {
      print('Giá tiền không hợp lệ. Vui lòng nhập lại.');
    }
  }
  int? soLuong;
  while (soLuong == null) {
    print('Nhập số lượng trong kho:');
    String? chuoiSoLuong = stdin.readLineSync();
    if (chuoiSoLuong != null && int.tryParse(chuoiSoLuong) != null) {
      soLuong = int.parse(chuoiSoLuong);
    } else {
      print('Số lượng không hợp lệ. Vui lòng nhập lại.');
    }
  }
  SanPham sp = SanPham(ten, gia, soLuong);
  danhSachSanPham.add(sp);
  print('${ten.toString()} đã được thêm vào danh sách.');
}

void hienThiDanhSachSanPham() {
  if (danhSachSanPham.isEmpty) {
    print('Danh sách sản phẩm trống.');
    return;
  }
  print('\n--- Danh sách sản phẩm ---');
  for (var sp in danhSachSanPham) {
    sp.hienThiThongTin();
  }
  print('---------------------------\n');
}

void timKiemSanPhamTheoTen() {
  print('Nhập tên sản phẩm cần tìm:');
  String? tenTimKiem;
  while (tenTimKiem == null || tenTimKiem.isEmpty) {
    tenTimKiem = stdin.readLineSync();
    if (tenTimKiem == null || tenTimKiem.isEmpty) {
      print('Tên sản phẩm không được để trống. Vui lòng nhập lại.');
    }
  }
  bool timThay = false;
  for (var sp in danhSachSanPham) {
    if (sp.tenSanPham.toLowerCase() == tenTimKiem.toLowerCase()) {
      print('Thông tin sản phẩm:');
      sp.hienThiThongTin();
      timThay = true;
      break;
    }
  }
  if (!timThay) {
    print('Không tìm thấy sản phẩm có tên "${tenTimKiem.toString()}".');
  }
}

void banSanPham() {
  print('Nhập tên sản phẩm cần bán:');
  String? tenBan;
  while (tenBan == null || tenBan.isEmpty) {
    tenBan = stdin.readLineSync();
    if (tenBan == null || tenBan.isEmpty) {
      print('Tên sản phẩm không được để trống. Vui lòng nhập lại.');
    }
  }
  int? soLuongBan;
  while (soLuongBan == null) {
    print('Nhập số lượng cần bán:');
    String? chuoiSoLuongBan = stdin.readLineSync();
    if (chuoiSoLuongBan != null && int.tryParse(chuoiSoLuongBan) != null) {
      soLuongBan = int.parse(chuoiSoLuongBan);
    } else {
      print('Số lượng không hợp lệ. Vui lòng nhập lại.');
    }
  }

  bool timThay = false;
  for (var sp in danhSachSanPham) {
    if (sp.tenSanPham.toLowerCase() == tenBan.toLowerCase()) {
      timThay = true;
      if (sp.soLuongTrongKho >= soLuongBan) {
        sp.soLuongTrongKho -= soLuongBan;
        print(
            'Đã bán ${soLuongBan.toString()} sản phẩm "${sp.tenSanPham.toString()}". Số lượng còn lại: ${sp.soLuongTrongKho.toString()}.');
      } else {
        print(
            'Không đủ số lượng sản phẩm "${sp.tenSanPham.toString()}" trong kho. Chỉ còn ${sp.soLuongTrongKho.toString()}.');
      }
      break;
    }
  }
  if (!timThay) {
    print('Không tìm thấy sản phẩm có tên "${tenBan.toString()}".');
  }
}

void main() {
  int luaChon = -1;
  while (luaChon != 0) {
    print('\n--- CHƯƠNG TRÌNH QUẢN LÝ SẢN PHẨM ---');
    print('1. Thêm sản phẩm vào danh sách');
    print('2. Hiển thị danh sách sản phẩm');
    print('3. Tìm kiếm sản phẩm theo tên');
    print('4. Bán sản phẩm');
    print('0. Thoát');
    print('Chọn chức năng:');
    String? chuoiLuaChon = stdin.readLineSync();
    if (chuoiLuaChon != null && int.tryParse(chuoiLuaChon) != null) {
      luaChon = int.parse(chuoiLuaChon);
      switch (luaChon) {
        case 1:
          themSanPhamVaoDanhSach();
          break;
        case 2:
          hienThiDanhSachSanPham();
          break;
        case 3:
          timKiemSanPhamTheoTen();
          break;
        case 4:
          banSanPham();
          break;
        case 0:
          print('Đã thoát chương trình. Chào anh yêu!');
          break;
        default:
          print('Lựa chọn không hợp lệ. Vui lòng thử lại.');
      }
    } else {
      print('Lựa chọn không hợp lệ. Vui lòng nhập số.');
    }
  }
}
