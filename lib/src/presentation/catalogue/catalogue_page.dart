import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/src/presentation/widgets.dart';

import 'item_card.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BreakpointBuilder(builder: (context, breakpoint) {
      final gutters = breakpoint.gutters;
      final columns = breakpoint.columns ~/ 2;

      return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SectionHeader(
                  title: 'Section Header',
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: gutters),
                sliver: SliverAnimatedGrid(
                  initialItemCount: 20,
                  itemBuilder: (context, index, animation) {
                    return ItemCard();
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    childAspectRatio: 0.7,
                    // mainAxisSpacing: gutters,
                    // crossAxisSpacing: gutters,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
