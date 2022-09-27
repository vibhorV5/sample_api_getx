class CartItem {
  String? title;
  int? quantity;

  CartItem({this.title = '', this.quantity = 1});

  CartItem.fromJson(Map<String, dynamic> json)
      : quantity = json['quantity'] as int?,
        title = json['title'] as String?;

  Map<String, dynamic> toJson() => {
        'quantity': quantity,
        'title': title,
      };
}
