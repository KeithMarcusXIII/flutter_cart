import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String? name;
  final double? price;

  const CartItem({this.name, this.price});

  factory CartItem.fromMap(Map<String, dynamic> data) => CartItem(
        name: data['name'] as String?,
        price: data['price'] as double?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'price': price,
      };

  CartItem copyWith({
    String? name,
    double? price,
  }) {
    return CartItem(
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props => [name, price];
}
