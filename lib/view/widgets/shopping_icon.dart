import 'package:flutter/material.dart';

class ShoppingIcon extends StatelessWidget {
  const ShoppingIcon({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
        height: 40,
        width: 40,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            border: Border.all(color: const Color.fromARGB(255, 116, 116, 116)),
            borderRadius: BorderRadius.circular(99)),
        child: const Icon(Icons.shopping_bag_outlined),
      ),
    );
  }
}
