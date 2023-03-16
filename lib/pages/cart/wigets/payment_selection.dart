import 'package:add/provider/payment_provider/payment_selector_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constant_colors.dart';

class PaymentMethodSelection extends StatelessWidget {
  const PaymentMethodSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentSelectionProvider>(
      builder: (context, value1, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Payment Method:',
            style: TextStyle(
              fontSize: 15,
              color: kPrimaryTextcolor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Radio<String>(
                  value: 'Cash on Delivery',
                  groupValue: value1.selectedPaymentMedthod,
                  onChanged: (value) => value1.onPaymentChanger(value)),
              const Text(
                'Cash on Delivery',
                style: TextStyle(
                  color: Color(0xff9098b1),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                value: 'Net Banking',
                groupValue: value1.selectedPaymentMedthod,
                onChanged: (value) => value1.onPaymentChanger(value),
              ),
              const Text(
                'Net Banking',
                style: TextStyle(
                  color: Color(0xff9098b1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
