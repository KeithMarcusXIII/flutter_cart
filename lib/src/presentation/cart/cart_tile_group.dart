import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/src/domain/cart.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cart_tile.dart';

class CartTileGroup extends HookConsumerWidget {
  const CartTileGroup({super.key, required this.cartItems});

  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsValue = useState(BuiltList(cartItems));
    final items = itemsValue.value.toList();

    return Card.outlined(
      child: ListBody(
        children: items.map((item) => CartTile(cartItem: item)).toList(),
      ),
    );
  }
}
