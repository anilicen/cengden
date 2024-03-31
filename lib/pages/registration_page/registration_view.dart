import 'package:cengden/data/repositories/user_repository.dart';
import 'package:cengden/pages/registration_page/registration_controller.dart';
import 'package:cengden/widgets/primary_button.dart';
import 'package:cengden/widgets/text_field.dart';
import 'package:cengden/widgets/text_field_without_text.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RegistrationView extends View {
  RegistrationView();

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _RegistrationViewState(
      RegistrationController(
        DataUserRepository(),
      ),
    );
  }
}

class _RegistrationViewState extends ViewState<RegistrationView, RegistrationController> {
  _RegistrationViewState(RegistrationController controller) : super(controller);

  @override
  // TODO: implement view
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffd6faf1),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ControlledWidgetBuilder<RegistrationController>(
          builder: (context, controller) {
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
                    "Register Page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width / 2,
                        child: ListView(
                          children: [
                            CengdenTextFieldWithoutText(
                              size: size / 2,
                              title: 'E-Mail',
                              hintText: "E-Mail here",
                              isObscure: false,
                              onChanged: controller.setEmail,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 50),
                            CengdenTextFieldWithoutText(
                              size: size / 2,
                              title: 'Name',
                              hintText: "Name here",
                              isObscure: false,
                              onChanged: controller.setName,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 50),
                            CengdenTextFieldWithoutText(
                              size: size / 2,
                              title: 'Phone Number',
                              hintText: "Phone Number here",
                              isObscure: false,
                              onChanged: controller.setPhoneNumber,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 50),
                            CengdenTextFieldWithoutText(
                              size: size / 2,
                              title: 'Password',
                              hintText: "Password here",
                              isObscure: true,
                              onChanged: controller.setPassword,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 50),
                            CengdenTextFieldWithoutText(
                              size: size / 2,
                              title: 'Password Again',
                              hintText: "Password here",
                              isObscure: true,
                              onChanged: controller.setPasswordAgain,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          controller.displayErrors
                              ? controller.isPasswordsSame!
                                  ? const Text(
                                      'E-mail is not a CENG E-mail',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    )
                                  : const Text(
                                      "Passwords are not the same",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    )
                              : SizedBox(),
                          SizedBox(height: 20),
                          PrimaryButton(
                            isEnabled: controller.isEnabled,
                            text: "REGISTER",
                            height: 60,
                            width: 240,
                            onPressed: () => controller.register(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
