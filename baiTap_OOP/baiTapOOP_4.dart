import 'dart:io';

class Product {
  String id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

class Order {
  List<Product> items = [];

  void addProduct(Product product) {
    items.add(product);
    print("Đã thêm sản phẩm ${product.name}");
  }

  double totalPrice() {
    double total = 0;
    for (var p in items) {
      total += p.price;
    }
    return total;
  }

  void displayOrder() {
    if (items.isEmpty) {
      print("Đơn hàng trống.");
    } else {
      print("==> Danh sách sản phẩm trong đơn hàng:");
      for (var item in items) {
        print("${item.name} - \$${item.price}");
      }
      print("Tổng đơn hàng: \$${totalPrice()}");
    }
  }
}

void main() {
  Order order = Order();

  stdout.write("Nhập số lượng sản phẩm muốn thêm: ");
  int count = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < count; i++) {
    print("\nNhập thông tin sản phẩm ${i + 1}:");
    stdout.write("ID: ");
    String? id = stdin.readLineSync();
    // String id = stdin.readLineSync().toString();
    // String id = stdin.readLineSync()!;

    stdout.write("Tên: ");
    String? name = stdin.readLineSync();

    stdout.write("Giá: ");
    double price = double.parse(stdin.readLineSync()!);

    Product p = Product(id!, name!, price);
    order.addProduct(p);
  }

  order.displayOrder();
}
