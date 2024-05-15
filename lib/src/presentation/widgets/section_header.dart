import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BreakpointBuilder(builder: (context, breakpoint) {
      return Padding(
        padding: EdgeInsets.all(breakpoint.gutters),
        child: Text(title),
      );
    });
  }
}
