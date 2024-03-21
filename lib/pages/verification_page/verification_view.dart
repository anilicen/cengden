import 'package:cengden/data/repositories/user_repository.dart';
import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/pages/verification_page/verification_controller.dart';
import 'package:cengden/widgets/primary_button.dart';
import 'package:cengden/widgets/text_field.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

// ignore: must_be_immutable
class VerificationView extends View {
  User user;
  String verificationCode;
  VerificationView(this.user, this.verificationCode, {super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _VerificationViewState(
      VerificationController(
        DataUserRepository(),
        user,
        verificationCode,
      ),
    );
  }
}

class _VerificationViewState extends ViewState<VerificationView, VerificationController> {
  _VerificationViewState(VerificationController controller) : super(controller);

  @override
  // TODO: implement view
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ControlledWidgetBuilder<VerificationController>(
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
                    "Verification Page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                CengdenTextField(
                  size: size,
                  title: "Verification Code",
                  hintText: "Verification Code",
                  isObscure: false,
                  onChanged: controller.setVerificationCode,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Enter the verification Code you received",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                PrimaryButton(
                  text: "Verify",
                  isEnabled: controller.isEnabled,
                  onPressed: () {
                    controller.verify(context);
                  },
                ),
                controller.isError == true
                    ? const Text(
                        "Your code is incorrect",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    : const SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
