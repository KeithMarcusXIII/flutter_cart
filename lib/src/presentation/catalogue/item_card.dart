import 'package:breakpoint/breakpoint.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BreakpointBuilder(builder: (context, breakpoint) {
      return Card.outlined(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/200/300',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(breakpoint.gutters),
              child: ListBody(
                children: [
                  Text('Item Name'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('RM 0'), Text('location')],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
