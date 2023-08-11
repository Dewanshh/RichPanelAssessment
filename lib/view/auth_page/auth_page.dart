import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:richpanel/controller/controller.dart';
import 'package:richpanel/utils/themes.dart';
import 'package:richpanel/view/home_page/home_page.dart';
import 'package:richpanel/view/widgets/custom_text_field.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final controller = Get.put(RichPanelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RichPanelTheme.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => controller.isSignUp.value ? signUp() : signIn()),
        ],
      ),
    );
  }

  Widget signUp() {
    return Center(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                "Create an Account",
                style: RichPanelTextStyle.h2,
              )),
              const SizedBox(
                height: 20,
              ),
              const Text("Name"),
              const SizedBox(
                height: 2,
              ),
              CustomInputTextField(nameController, ""),
              const SizedBox(
                height: 10,
              ),
              const Text("Email"),
              const SizedBox(
                height: 5,
              ),
              CustomInputTextField(emailController, ""),
              const SizedBox(
                height: 10,
              ),
              const Text("Password"),
              const SizedBox(
                height: 5,
              ),
              CustomInputTextField(
                passwordController,
                "",
                password: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                        value: controller.checkValue.value,
                        activeColor: RichPanelTheme.primaryColor,
                        onChanged: (value) {
                          controller.checkValue.value =
                              !controller.checkValue.value;
                        }),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("Remember Me?"),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.off(() => HomePage());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: RichPanelTheme.primaryColor,
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account?",
                    style: RichPanelTextStyle.h5,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.isSignUp.value = !controller.isSignUp.value;
                      Get.off(() => HomePage());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget signIn() {
    return Center(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                "Login to your account",
                style: RichPanelTextStyle.h2,
              )),
              const SizedBox(
                height: 20,
              ),
              const Text("Email"),
              const SizedBox(
                height: 2,
              ),
              CustomInputTextField(emailController, ""),
              const SizedBox(
                height: 10,
              ),
              const Text("Password"),
              const SizedBox(
                height: 5,
              ),
              CustomInputTextField(
                passwordController,
                "",
                password: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                        value: controller.checkValue.value,
                        activeColor: RichPanelTheme.primaryColor,
                        onChanged: (value) {
                          controller.checkValue.value =
                              !controller.checkValue.value;
                        }),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("Remember Me?"),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: RichPanelTheme.primaryColor,
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New to MyApp?",
                    style: RichPanelTextStyle.h5,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.isSignUp.value = !controller.isSignUp.value;
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
