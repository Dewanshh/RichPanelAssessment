import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:richpanel/controller/controller.dart';
import 'package:richpanel/model/package_model.dart';
import 'package:richpanel/utils/themes.dart';
import 'package:richpanel/view/widgets/animated_toggle.dart';

import '../payments_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PackageModel> packageList = [];
  final controller = Get.put(RichPanelController());
  Future<void> fetchData() async {
    controller.isLoading.value = true;
    var collection = FirebaseFirestore.instance.collection('productDetails');
    collection.snapshots().listen((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();
        var planType = data['type'];
        var monthlyPrice = data['Monthly Price'];
        var resolution = data['Resolution'];
        var videoQuality = data['Video Quality'];
        var yearlyPrice = data['Yearly Price'];
        var devices = [""];
        PackageModel p = PackageModel(
            packageType: planType,
            devices: devices,
            quality: videoQuality,
            resoulution: resolution,
            yearlyPrice: yearlyPrice,
            monthlyPrice: monthlyPrice);
        // <-- Retrieving the value.
        packageList.add(p);
      }
    });
    await Future.delayed(const Duration(seconds: 2));
    controller.isLoading.value = false;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
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
                height: Get.size.height / 2,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                        child: Text(
                      "Choose the right project for you",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              constraints: const BoxConstraints(
                                  maxHeight:
                                      300), // Adjust the max height as needed

                              child: PackStruct()),
                          // Spacer(),
                          Container(
                            constraints: const BoxConstraints(
                                maxHeight:
                                    300), // Adjust the max height as needed

                            child: Obx(
                              () => controller.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: packageList.length,
                                      itemBuilder: (_, int index) {
                                        return InkWell(
                                          onTap: () {
                                            controller.index.value = index;
                                            print(index);
                                          },
                                          child: PackDetails(
                                              pack: packageList[index],
                                              index: index),
                                        );
                                      },
                                      separatorBuilder: (_, __) {
                                        return const SizedBox(
                                          width: 40,
                                        );
                                      },
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Stripe.publishableKey =
                            "pk_test_51NdXqbSDIJbu3QFGyll907RhyyaqQEfSWupe2B6yMHZuCjPBJtEpoAHSFjInwmSJAJ7BKmGcxzR2Pb8fcbnd0xC600GRzAbZAg";
                        Get.to(PaymentsPage(
                            pack: packageList[controller.index.value]));
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: RichPanelTheme.primaryColor,
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class PackDetails extends StatefulWidget {
  const PackDetails({Key? key, required this.pack, required this.index})
      : super(key: key);
  final PackageModel pack;
  final int index;

  @override
  State<PackDetails> createState() => _PackDetailsState();
}

class _PackDetailsState extends State<PackDetails> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RichPanelController>();
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: controller.index.value == widget.index
                      ? RichPanelTheme.primaryColor
                      : RichPanelTheme.primaryLightColor),
              child: Center(
                child: Text(widget.pack.packageType,
                    style: TextStyle(
                        color: controller.index.value == widget.index
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            controller.package.value == 0
                ? "₹ " + widget.pack.monthlyPrice
                : "₹ " + widget.pack.yearlyPrice,
            style: TextStyle(
                color: controller.index.value == widget.index
                    ? RichPanelTheme.primaryColor
                    : Colors.grey,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(widget.pack.quality,
              style: TextStyle(
                  color: controller.index.value == widget.index
                      ? RichPanelTheme.primaryColor
                      : Colors.grey,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text(widget.pack.resoulution,
              style: TextStyle(
                  color: controller.index.value == widget.index
                      ? RichPanelTheme.primaryColor
                      : Colors.grey,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text(widget.pack.devices.toString(),
              style: TextStyle(
                  color: controller.index.value == widget.index
                      ? RichPanelTheme.primaryColor
                      : Colors.grey,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class PackStruct extends StatelessWidget {
  const PackStruct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RichPanelController>();

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: AnimatedButton()),
          const SizedBox(
            height: 20,
          ),
          Text(
            controller.package.value == 0 ? "Monthly Price" : "Yearly Price",
            style: TextStyle(color: RichPanelTheme.primaryColor),
          ),
          const SizedBox(height: 20),
          Text("Quality", style: TextStyle(color: RichPanelTheme.primaryColor)),
          const SizedBox(height: 20),
          Text("Resolution",
              style: TextStyle(color: RichPanelTheme.primaryColor)),
          const SizedBox(height: 20),
          Text("Device Type: ",
              style: TextStyle(color: RichPanelTheme.primaryColor)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
