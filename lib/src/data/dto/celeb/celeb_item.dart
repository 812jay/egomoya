class CelebItem {
  CelebItem({
    required this.imgPath,
    required this.brand,
    required this.itemName,
    required this.price,
    required this.currency,
  });

  final String imgPath;
  final String brand;
  final String itemName;
  final double price;
  final String currency;
  @override
  String toString() {
    return 'CelebItem(imgPath: $imgPath, name: $brand, desc: $itemName, price: $price, currency: $currency)';
  }
}
