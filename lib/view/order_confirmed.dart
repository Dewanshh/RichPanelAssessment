import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:richpanel/controller/controller.dart';
import 'package:richpanel/model/package_model.dart';
import 'package:richpanel/utils/themes.dart';
import 'package:richpanel/view/home_page/home_page.dart';

class OrderConfirmed extends StatefulWidget {
  const OrderConfirmed({Key? key, required this.pack}) : super(key: key);
  final PackageModel pack;
  @override
  State<OrderConfirmed> createState() => _OrderConfirmedState();
}

class _OrderConfirmedState extends State<OrderConfirmed> {
  final controller = Get.put(RichPanelController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String s = "";
    int n = widget.pack.devices.length;
    for (int i = 0; i < n; i++) {
      s += "${widget.pack.devices[i]} ${i == n - 1 ? " " : " +"}";
    }
    return Scaffold(
        backgroundColor: RichPanelTheme.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.size.width / 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Current Pack Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade300,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            "Active",
                            style:
                                TextStyle(color: RichPanelTheme.primaryColor),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Get.to(() => Cancel(
                                  pack: widget.pack,
                                ));
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                color: RichPanelTheme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.pack.packageType,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      s,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.package.value == 0
                          ? "₹ ${widget.pack.monthlyPrice}/mo"
                          : "₹ ${widget.pack.yearlyPrice}/yr",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offAll(() => const HomePage());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1)),
                        child: const Text(
                          "Change Plan",
                          style: TextStyle(
                              color: RichPanelTheme.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                                "Your Subscription has started on Aug 11, 2023 and will auto renew on Sept 11, 2023."),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Cancel extends StatefulWidget {
  const Cancel({Key? key, required this.pack}) : super(key: key);
  final PackageModel pack;
  @override
  State<Cancel> createState() => _CancelState();
}

class _CancelState extends State<Cancel> {
  final controller = Get.put(RichPanelController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String s = "";
    int n = widget.pack.devices.length;
    for (int i = 0; i < n; i++) {
      s += "${widget.pack.devices[i]} ${i == n - 1 ? " " : " +"}";
    }
    return Scaffold(
        backgroundColor: RichPanelTheme.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.size.width / 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Current Pack Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(192, 182, 182, 0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Cancel",
                            style:
                                TextStyle(color: Colors.red.withOpacity(0.8)),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Get.off(() => Cancel(
                                  pack: widget.pack,
                                ));
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                color: RichPanelTheme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.pack.packageType,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      s,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.package.value == 0
                          ? "₹ ${widget.pack.monthlyPrice}/mo"
                          : "₹ ${widget.pack.yearlyPrice}/yr",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offAll(() => const HomePage());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1)),
                        child: const Text(
                          "Change Plan",
                          style: TextStyle(
                              color: RichPanelTheme.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                                "Your Subscription was cancelled and you and you will loose access to services on Sept, 11th 2023"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
