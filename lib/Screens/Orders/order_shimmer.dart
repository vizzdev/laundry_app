import 'package:flutter/material.dart';

import '../../Widgets/shimmer_card.dart';

class OrdersShimmer extends StatefulWidget {
  final double height;
  const OrdersShimmer({super.key, this.height = 400});

  @override
  State<OrdersShimmer> createState() => _OrdersShimmerState();
}

class _OrdersShimmerState extends State<OrdersShimmer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      itemBuilder: (context, index) {
        return Column(
          children: [
            ShimmerCard(height: widget.height, widht: double.infinity),
            SizedBox(height: 20)
          ],
        );
      },
    );
  }
}
