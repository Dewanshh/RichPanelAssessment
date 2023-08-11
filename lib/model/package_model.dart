class PackageModel {
  final String packageType;
  final String quality;
  final String resoulution;
  final String yearlyPrice;
  final String monthlyPrice;
  final List<String> devices;

  PackageModel(
      {required this.packageType,
      required this.devices,
      required this.quality,
      required this.resoulution,
      required this.yearlyPrice,
      required this.monthlyPrice});
}
