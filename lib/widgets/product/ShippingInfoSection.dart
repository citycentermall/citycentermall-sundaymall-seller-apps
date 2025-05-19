import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShippingInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text('Shipping to pune 411001', style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Text('Change', style: TextStyle(color: Colors.blue, fontSize: 12)),
            ],
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text('Available for Sizes: ONESIZE', style: TextStyle(color: Colors.grey, fontSize: 12)),
                SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.local_shipping_outlined, size: 16),
                    SizedBox(width: 8),
                    Text('Enjoy Free Shipping on order above \$100', style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.store_mall_directory_outlined, size: 16),
                    SizedBox(width: 8),
                    Text('Free pickup for easy 7-days exchange/No Returns', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
