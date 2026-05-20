class Product {
  String id;
  String name;
  String image;
  double price;

  // Constructor
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  // Factory – map từ JSON sang Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'].toDouble(),
    );
  }

  // In thông tin sản phẩm
  void display() {
    print('ID: $id | Tên: $name | Ảnh: $image | Giá: ${price.toStringAsFixed(0)} đ');
  }
}


// ============================================================
//  CÁC PHƯƠNG THỨC THAO TÁC VỚI DANH SÁCH
// ============================================================

// ADD – Thêm sản phẩm
void addProduct(List<Product> ds, Product p) {
  ds.add(p);
  print('✅ Đã thêm: ${p.name}');
}

// EDIT – Sửa sản phẩm theo id
void editProduct(List<Product> ds, String id, String tenMoi, String anhMoi, double giaMoi) {
  for (int i = 0; i < ds.length; i++) {
    if (ds[i].id == id) {
      ds[i].name  = tenMoi;
      ds[i].image = anhMoi;
      ds[i].price = giaMoi;
      print('Đã sửa sản phẩm id=$id');
      return;
    }
  }
  print(' Không tìm thấy sản phẩm id=$id');
}

// DELETE – Xoá sản phẩm theo id
void deleteProduct(List<Product> ds, String id) {
  ds.removeWhere((p) => p.id == id);
  print('Đã xoá sản phẩm id=$id');
}

// FIND – Tìm theo id
Product? findById(List<Product> ds, String id) {
  for (Product p in ds) {
    if (p.id == id) return p;
  }
  return null;
}

// SEARCH – Tìm theo tên
List<Product> searchByName(List<Product> ds, String tuKhoa) {
  List<Product> ketQua = [];
  for (Product p in ds) {
    if (p.name.toLowerCase().contains(tuKhoa.toLowerCase())) {
      ketQua.add(p);
    }
  }
  return ketQua;
}

// SEARCH – Tìm theo khoảng giá
List<Product> searchByPrice(List<Product> ds, double giaTu, double giaDen) {
  List<Product> ketQua = [];
  for (Product p in ds) {
    if (p.price >= giaTu && p.price <= giaDen) {
      ketQua.add(p);
    }
  }
  return ketQua;
}

// INCREASE PRICE – Tăng giá 10% bằng map (declarative)
List<Product> increasePrice(List<Product> ds) {
  ds = ds.map((p) {
    p.price = p.price * 1.1;
    return p;
  }).toList();
  print('Đã tăng giá tất cả sản phẩm lên 10%');
  return ds;
}

// IN TẤT CẢ
void printAll(List<Product> ds) {
  print('───────────────────────────────────────────────────');
  for (Product p in ds) {
    p.display();
  }
  print('───────────────────────────────────────────────────');
}