import 'dart:io';

void main(List<String> args) {
  // Map dùng để lưu trữ dữ liệu sản phẩm trong List
  List<Map<String, dynamic>> products = [];

  // Menu chính
  while (true) {
    print("Chương trình quản lý sản phẩm");
    print("1. Thêm sản phẩm");
    print("2. Hiển thị danh sách sản phẩm");
    print("3. Sửa thông tin sản phẩm");
    print("4. Xóa sản phẩm");
    print("5. Tính tổng giá trị sản phẩm");
    print("6. Thoát");
    print("-------------------------");
    stdout.write("Chọn chức năng: ");

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addProduct(products);
        break;
      case 2:
        displayProducts(products);
        break;
      case 3:
        editProduct(products);
        break;
      case 4:
        deleteProduct(products);
        break;
      case 5:
        double totalValue = calculateTotalValue(products);
        if (totalValue == 0) {
          print("Danh sách sản phẩm rỗng.");
          break;
        }
        print("-------------------------");
        print("Danh sách sản phẩm:");
        for (int i = 0; i < products.length; i++) {
          print("Sản phẩm ${i + 1}:");
          print("Tên: ${products[i]["name"]}");
          print("Giá: ${products[i]["price"]}");
          print("Số lượng: ${products[i]["quantity"]}");
          print("-------------------------");
        }
        print("Tổng giá trị sản phẩm: $totalValue");
        break;
      case 6:
        print("thoát chương trình");
        exit(0);
      default:
        print("Lựa chọn không hợp lệ.");
    }
  }
}

// Hàm thêm sản phẩm vào danh sách
void addProduct(List<Map<String, dynamic>> products) {
  Map<String, dynamic> product = {};
  stdout.write("Nhập tên sản phẩm: ");
  product["name"] = stdin.readLineSync();
  stdout.write("Nhập giá sản phẩm: ");
  product["price"] = double.parse(stdin.readLineSync()!);
  stdout.write("Nhập số lượng sản phẩm: ");
  product["quantity"] = int.parse(stdin.readLineSync()!);
  products.add(product);
  print("Sản phẩm đã được thêm vào danh sách.");
  print("-------------------------");
}

// Hàm hiển thị danh sách sản phẩm
void displayProducts(List<Map<String, dynamic>> products) {
  print("-------------------------");
  print("Danh sách sản phẩm:");
  for (int i = 0; i < products.length; i++) {
    print("Sản phẩm ${i + 1}:");
    print("Tên: ${products[i]["name"]}");
    print("Giá: ${products[i]["price"]}");
    print("Số lượng: ${products[i]["quantity"]}");
    print("-------------------------");
  }
}

// Hàm sửa thông tin sản phẩm
void editProduct(List<Map<String, dynamic>> products) {
  stdout.write("Nhập số thứ tự sản phẩm cần sửa: ");
  int index = int.parse(stdin.readLineSync()!) - 1;
  if (index < 0 || index >= products.length) {
    print("Sản phẩm không tồn tại.");
    return;
  }
  Map<String, dynamic> product = products[index];
  stdout.write("Nhập tên sản phẩm mới (hiện tại: ${product["name"]}): ");
  product["name"] = stdin.readLineSync();
  stdout.write("Nhập giá sản phẩm mới (hiện tại: ${product["price"]}): ");
  product["price"] = double.parse(stdin.readLineSync()!);
  stdout
      .write("Nhập số lượng sản phẩm mới (hiện tại: ${product["quantity"]}): ");
  product["quantity"] = int.parse(stdin.readLineSync()!);
  print("Thông tin sản phẩm đã được cập nhật.");
  print("-------------------------");
}

// Hàm xóa sản phẩm
void deleteProduct(List<Map<String, dynamic>> products) {
  stdout.write("Nhập số thứ tự sản phẩm cần xóa: ");
  int index = int.parse(stdin.readLineSync()!) - 1;
  if (index < 0 || index >= products.length) {
    print("Sản phẩm không tồn tại.");
    return;
  }
  products.removeAt(index);
  print("Sản phẩm đã được xóa.");
  print("-------------------------");
  print("Danh sách sản phẩm sau khi xóa:");
  displayProducts(products);
  print("-------------------------");
}

// Hàm tính tổng giá trị sản phẩm
double calculateTotalValue(List<Map<String, dynamic>> products) {
  double totalValue = 0;
  for (var product in products) {
    totalValue += product["price"] * product["quantity"];
  }
  return totalValue;
}
