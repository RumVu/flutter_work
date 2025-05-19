import 'dart:io';

class BankAccount {
  String accountNumber;
  String ownerName;
  double balance;

  BankAccount(this.accountNumber, this.ownerName, this.balance);

  void deposit(double amount) {
    balance += amount;
    print("Đã gửi tiền thành công. Số dư mới: \$${balance}");
  }

  void withdraw(double amount) {
    if (amount > balance) {
      print("Số dư không đủ để rút.");
    } else {
      balance -= amount;
      print("Đã rút tiền thành công. Số dư còn lại: \$${balance}");
    }
  }

  void display() {
    print(
        "Tài khoản: $accountNumber | Chủ sở hữu: $ownerName | Số dư: \$${balance}");
  }
}

void main() {
  print("=== TẠO TÀI KHOẢN NGÂN HÀNG ===");
  stdout.write("Nhập số tài khoản: ");
  String? accNum = stdin.readLineSync();

  stdout.write("Nhập tên chủ tài khoản: ");
  String? owner = stdin.readLineSync();

  stdout.write("Nhập số dư ban đầu: ");
  double initialBalance = double.parse(stdin.readLineSync()!);

  BankAccount acc = BankAccount(accNum!, owner!, initialBalance);

  print("\n1. Gửi tiền");
  print("2. Rút tiền");
  print("3. Hiển thị số dư");
  stdout.write("Chọn chức năng: ");
  String? choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      stdout.write("Nhập số tiền muốn gửi: ");
      double amount = double.parse(stdin.readLineSync()!);
      acc.deposit(amount);
      break;
    case '2':
      stdout.write("Nhập số tiền muốn rút: ");
      double amount = double.parse(stdin.readLineSync()!);
      acc.withdraw(amount);
      break;
    case '3':
      acc.display();
      break;
    default:
      print("Lựa chọn không hợp lệ!");
  }
}
