import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/src/domain/cart.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cart_tile_group.dart';

class CartPage extends HookConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectAllValue = useState(false);
    final isSelectAll = isSelectAllValue.value;

    return BreakpointBuilder(builder: (context, breakpoint) {
      return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Cart'),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text('Select'),
                ),
              ],
            ),
            ...List.generate(
              5,
              (index) {
                return SliverToBoxAdapter(
                  child: CartTileGroup(
                    cartItems: List.generate(
                        20,
                        (index) => CartItem(
                              name: 'Item $index',
                              price: 0.0,
                            )),
                  ),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IntrinsicWidth(
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Select ${isSelectAll ? 'None' : 'All'}'),
                  value: isSelectAllValue.value,
                  onChanged: (value) {
                    if (value != null) {
                      isSelectAllValue.value = value;
                    }
                  },
                ),
              ),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Total: '),
                      TextSpan(text: 'RM 0'),
                    ],
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size.fromWidth(breakpoint.gutters),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
