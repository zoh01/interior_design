import 'package:flutter/material.dart';
import 'package:interior_design/common/widgets/appbar/appbar.dart';
import 'package:interior_design/features/personalization/screens/orders/widgets/order_item.dart';
import 'package:interior_design/features/personalization/screens/orders/widgets/processing_order.dart';
import 'package:interior_design/utils/constants/sizes.dart';
import 'package:interior_design/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  List<OrderItem> orderItem = [
    OrderItem('Processing', '22 Jun 2024', '[#76132]', '25 Jun, 2024', () {}),
    OrderItem('Processing', '17 Feb 2024', '[#76132]', '20 Feb, 2024', () {}),
    OrderItem('Processing', '05 Apr 2024', '[#76132]', '25 Jun, 2024', () {}),
    OrderItem('Processing', '22 Jun 2024', '[#76132]', '25 Jun, 2024', () {}),
    OrderItem('Processing', '22 Jun 2024', '[#76132]', '25 Jun, 2024', () {}),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const ZAppBar(
        title: Text(
          'My Orders',
          style: TextStyle(color: Colors.black),
        ),
        showBackArrow: true,
      ),
      backgroundColor:
      dark ? ZColors.darkerGrey : Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(ZSizes.defaultSpace),
            child: Column(
              children: [
                SizedBox(
                  height: ZHelperFunctions.screenHeight(),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: _buildOrderItem,
                      separatorBuilder: (context, index) =>
                      const SizedBox(height: ZSizes.spaceBtwItems,),
                      itemCount: orderItem.length),
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget _buildOrderItem(BuildContext context, int index) {
    OrderItem item = orderItem[index];
    return ProcessingOrder(
      title: item.title,
      date: item.date,
      order: item.order,
      shipping: item.shipping,
      ontap: item.ontap,
    );
  }
}
