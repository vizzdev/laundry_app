import 'package:flutter/material.dart';

import '../../Widgets/shimmer_card.dart';

class OrdersShimmer extends StatefulWidget {
  final double height;
  final bool shrinkWrap;
  final int? itemCount;
  final ScrollPhysics? scrollPhysics;
  const OrdersShimmer({super.key, this.height = 400, this.scrollPhysics, this.shrinkWrap = false, this.itemCount});

  @override
  State<OrdersShimmer> createState() => _OrdersShimmerState();
}

class _OrdersShimmerState extends State<OrdersShimmer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemCount,
      shrinkWrap: widget.shrinkWrap,
      physics: widget.scrollPhysics,
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
