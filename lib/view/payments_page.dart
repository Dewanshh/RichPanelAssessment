import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:richpanel/controller/controller.dart';
import 'package:richpanel/model/package_model.dart';
import 'package:richpanel/utils/themes.dart';
import 'package:richpanel/view/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;

import 'order_confirmed.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key? key, required this.pack}) : super(key: key);
  final PackageModel pack;
  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  final card = TextEditingController();
  final month = TextEditingController();
  final year = TextEditingController();
  final cvv = TextEditingController();
  final controller = Get.put(RichPanelController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RichPanelTheme.primaryColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: Get.size.height / 5, horizontal: Get.size.width / 5),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              CardWidget(
                  card: card,
                  month: month,
                  year: year,
                  cvv: cvv,
                  pack: widget.pack),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: RichPanelTheme.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Order Summary",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Plan Name",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Billing Cycle",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Plan Price",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                )
                              ],
                            )),
                            const Spacer(),
                            Expanded(
                                child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.pack.packageType,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    controller.package.value == 0
                                        ? "Monthly"
                                        : "Yearly",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    controller.package.value == 0
                                        ? "₹ " +
                                            widget.pack.monthlyPrice +
                                            "/mo"
                                        : "₹ " +
                                            widget.pack.yearlyPrice +
                                            "/yr",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ))
                          ],
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.card,
    required this.month,
    required this.year,
    required this.cvv,
    required this.pack,
  });

  final TextEditingController card;
  final TextEditingController month;
  final TextEditingController year;
  final TextEditingController cvv;
  final PackageModel pack;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  final controller = Get.find<RichPanelController>();

  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Compelte Payments",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              "Enter your credit or debit card details below",
              style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey, width: 2)),
                child: CustomCardInputTextField(
                  widget.card,
                  "Card",
                  prefixIco: Icons.credit_card,
                  prefixIcon: true,
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomCardInputTextField(
                    widget.month,
                    "Month",
                  )),
                  Expanded(
                    child: CustomCardInputTextField(widget.year, "Year"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: CustomCardInputTextField(
                widget.cvv,
                "CVV",
                password: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                createPaymentIntent();
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: RichPanelTheme.primaryColor,
                ),
                child: const Text(
                  "Confirm Payment",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createPaymentIntent() async {
    try {
      double amount = (controller.package.value == 0
          ? int.parse(widget.pack.monthlyPrice.toString()).toDouble()
          : int.parse(widget.pack.yearlyPrice.toString()).toDouble());
      amount *= 100;

      Map<String, dynamic> body = {
        'amount': amount.toString(),
        'currency': 'INR',
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51NdXqbSDIJbu3QFGPxZlNOnR4ZdqJtijZgsJ0TOZZnmwr779ZYoXJO4e86roIqCXNVlBSYKzMkc97EEjfd7Ae3UF00nOooja9D',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print(json.decode(response.body));
      // return json.decode(response.body);
      if (response.statusCode == 200) {
        Get.to(() => OrderConfirmed(pack: widget.pack));
      }
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
