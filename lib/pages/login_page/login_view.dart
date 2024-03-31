import 'package:cengden/data/repositories/user_repository.dart';
import 'package:cengden/pages/login_page/login_controller.dart';
import 'package:cengden/widgets/primary_button.dart';
import 'package:cengden/widgets/text_field.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginView extends View {
  LoginView();

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _LoginViewState(
      LoginController(
        DataUserRepository(),
      ),
    );
  }
}

class _LoginViewState extends ViewState<LoginView, LoginController> {
  _LoginViewState(LoginController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffd6faf1),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ControlledWidgetBuilder<LoginController>(
          builder: ((context, controller) {
            return Column(
              children: [
                Container(
                  width: size.width,
                  height: 70,
                  color: const Color(0xff17cda0),
                  child: Text(
                    "CENGDEN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 50,
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 25,
                  color: const Color(0xff17cda0).withOpacity(0.5),
                  child: Text(
                    "Login Page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 200),
                SizedBox(
                  width: size.width / 3,
                  child: Column(
                    children: [
                      CengdenTextField(
                        size: size / 2,
                        title: 'E-Mail',
                        hintText: "E-Mail here",
                        isObscure: false,
                        onChanged: controller.setEmail,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 50),
                      CengdenTextField(
                        size: size / 2,
                        title: 'Password',
                        hintText: "Password here",
                        isObscure: false,
                        onChanged: controller.setPassword,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                controller.isNotFound
                    ? const Text(
                        "Email is not found",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    : const SizedBox(),
                !controller.arePasswordsMatch
                    ? const Text(
                        "Password is incorrect",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 20),
                PrimaryButton(
                  text: "LOG IN",
                  isEnabled: true,
                  onPressed: () => controller.login(context),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
