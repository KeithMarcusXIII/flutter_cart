import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cart/src/domain/cart.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartTile extends HookConsumerWidget {
  const CartTile({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectedValue = useState(false);
    final isSelected = isSelectedValue.value;

    return ListTile(
      leading: IntrinsicWidth(
        child: Row(
          children: [
            Checkbox(
              value: isSelected,
              onChanged: (value) {
                if (value != null) {
                  isSelectedValue.value = value;
                }
              },
            ),
            AspectRatio(
              aspectRatio: 1.0,
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/200/300',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(cartItem.name ?? ''),
          Row(
            children: [Text('RM ${cartItem.price?.toStringAsFixed(2) ?? 0}')],
          ),
        ],
      ),
    );
  }
}
