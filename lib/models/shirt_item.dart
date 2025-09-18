// model/shirt_item.dart

enum ShirtType {
  polo,
  shortSleeve,
  longSleeve,
}

enum ShirtSize {
  ss,
  s,
  m,
  l,
  xl,
  xxl,
  xxxl,
}

extension ShirtTypeExtension on ShirtType {
  String get name {
    switch (this) {
      case ShirtType.polo:
        return 'Polo';
      case ShirtType.shortSleeve:
        return 'Short Sleeve';
      case ShirtType.longSleeve:
        return 'Long Sleeve';
    }
  }
}

extension ShirtSizeExtension on ShirtSize {
  String get name {
    return toString().split('.').last;
  }

  double get chestSize {
    switch (this) {
      case ShirtSize.ss:
        return 32;
      case ShirtSize.s:
        return 34;
      case ShirtSize.m:
        return 36;
      case ShirtSize.l:
        return 38;
      case ShirtSize.xl:
        return 40;
      case ShirtSize.xxl:
        return 42;
      case ShirtSize.xxxl:
        return 44;
    }
  }
}

class ShirtItem {
  final String imageName;    // เช่น shirt1.png
  final String brand;
  final ShirtType type;
  final ShirtSize size;
  final double price;
  final String storeName;
  final String logo;         // เช่น cetfashion.png

  ShirtItem({
    required this.imageName,
    required this.brand,
    required this.type,
    required this.size,
    required this.price,
    required this.storeName,
    required this.logo,
  });

  double get chestSize => size.chestSize;
}
