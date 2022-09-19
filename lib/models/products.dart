class Product {
  final String? title;
  final String? color;
  final String? material;
  final String? imgUrl;
  final List<String>? size;

  Product({
    this.imgUrl,
    this.color,
    this.material,
    this.size,
    this.title,
  });

  static final List<Product> productList = [
    Product(
        title: 'Product 1',
        color: 'Blue',
        material: 'Cotton',
        size: ['S', 'M', 'L', 'XL'],
        imgUrl: 'assets/images/tshirt1.jpg'),
    Product(
        title: 'Product 2',
        color: 'Red',
        material: 'Cotton 10%',
        size: ['S', 'M', 'L', 'XL'],
        imgUrl: 'assets/images/tshirt1.jpg'),
    Product(
        title: 'Product 3',
        color: 'Green',
        material: 'Cotton 20%',
        size: ['S', 'M', 'L', 'XL'],
        imgUrl: 'assets/images/tshirt1.jpg'),
    Product(
        title: 'Product 4',
        color: 'Yellow',
        material: 'Cotton 30%',
        size: ['S', 'M', 'L', 'XL'],
        imgUrl: 'assets/images/tshirt1.jpg'),
    Product(
        title: 'Product 5',
        color: 'Purple',
        material: 'Cotton 40%',
        size: ['S', 'M', 'L', 'XL'],
        imgUrl: 'assets/images/tshirt1.jpg'),
    Product(
        title: 'Product 6',
        color: 'Orange',
        material: 'Cotton 50%',
        size: ['S', 'M', 'L', 'XL'],
        imgUrl: 'assets/images/tshirt1.jpg'),
    Product(
        title: 'Product 7',
        color: 'White',
        material: 'Cotton 60%',
        size: ['S', 'M', 'L', 'XL'],
        imgUrl: 'assets/images/tshirt1.jpg'),
    Product(
        title: 'Product 8',
        color: 'Grey',
        material: 'Cotton 70%',
        size: ['S', 'M', 'L', 'XL'],
        imgUrl: 'assets/images/tshirt1.jpg'),
    Product(
        title: 'Product 9',
        color: 'Pink',
        material: 'Cotton 80%',
        size: ['S', 'M', 'L', 'XL'],
        imgUrl: 'assets/images/tshirt1.jpg'),
    Product(
        title: 'Product 10',
        color: 'Deep Purple',
        material: 'Cotton 90%',
        size: ['S', 'M', 'L', 'XL'],
        imgUrl: 'assets/images/tshirt1.jpg'),
  ];
}
