// class CartItem {
//   int id;
//   String title;
//   int price;
//   int quantity;
//   String image;
//
//   CartItem({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.quantity,
//     required this.image,
//   });
//
//   // Method to calculate total price for a specific item
//   int get getTotalPrice => price * quantity;
//
//
//
//   factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
//     id: json["id"],
//     title: json["title"],
//     price: json["price"]?.toDouble(),
//     image: json["image"],
//     quantity: json["quantity"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "price": price,
//     "image": image,
//     "quantity": quantity,
//   };
// }
