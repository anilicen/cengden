import 'package:cengden/constants.dart';
import 'package:cengden/data/repositories/user_repository.dart';
import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/pages/profile_page/profile_controller.dart';
import 'package:cengden/widgets/primary_button.dart';
import 'package:cengden/widgets/text_field.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

// ignore: must_be_immutable
class ProfileView extends View {
  User user;
  ProfileView(this.user);

  State<StatefulWidget> createState() {
    return _ProfileViewState(
      ProfileController(
        DataUserRepository(),
        user,
      ),
    );
  }
}

class _ProfileViewState extends ViewState<ProfileView, ProfileController> {
  _ProfileViewState(ProfileController controller) : super(controller);

  @override
  // TODO: implement view
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffd6faf1),
      body: SizedBox(
        child: ControlledWidgetBuilder<ProfileController>(
          builder: (context, controller) {
            return controller.isUpdating == 0
                ? Column(
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () => controller.switchToUpdating(),
                            child: const Text("Update Profile"),
                          ),
                          TextButton(
                            onPressed: () => controller.switchToChangePassword(),
                            child: const Text("Change Password"),
                          ),
                        ],
                      ),
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
                          "Profile Page",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Email: ${controller.user.email}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Name: ${controller.user.name}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Phone Number: ${controller.user.phoneNumber}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "User Type: ${controller.user.userType.toString()}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      controller.user.userType == UserType.ADMIN
                          ? Column(
                              children: [
                                SizedBox(
                                  width: size.width / 3,
                                  child: CengdenTextField(
                                    size: size,
                                    title: "Delete User",
                                    hintText: "Enter the email of the user",
                                    isObscure: false,
                                    onChanged: controller.setUserEmail,
                                  ),
                                ),
                                PrimaryButton(
                                  text: 'Delete User',
                                  isEnabled: true,
                                  onPressed: controller.deleteUser,
                                ),
                              ],
                            )
                          : const SizedBox()
                    ],
                  )
                : controller.isUpdating == 1
                    ? SizedBox(
                        width: size.width / 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CengdenTextField(
                              size: size,
                              title: "Name",
                              hintText: "Name",
                              isObscure: false,
                              onChanged: controller.updateName,
                              text: controller.user.name,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CengdenTextField(
                              size: size,
                              title: "Phone Number",
                              hintText: "Phone Number",
                              isObscure: false,
                              onChanged: controller.updatePhoneNumber,
                              text: controller.user.phoneNumber,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            PrimaryButton(
                              text: "Update User",
                              isEnabled: true,
                              onPressed: controller.updateUser,
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        width: size.width / 3,
                        child: Column(
                          children: [
                            CengdenTextField(
                              size: size,
                              title: "Password",
                              hintText: "Password",
                              isObscure: false,
                              onChanged: controller.setOldPassword,
                            ),
                            CengdenTextField(
                              size: size,
                              title: "New Password",
                              hintText: "New Password",
                              isObscure: false,
                              onChanged: controller.setNewPassword,
                            ),
                            controller.isError
                                ? const Text(
                                    "Old Password is incorrect",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  )
                                : SizedBox(),
                            PrimaryButton(
                              text: "Update Password",
                              isEnabled: true,
                              onPressed: controller.updatePassword,
                            ),
                          ],
                        ),
                      );
          },
        ),
      ),
    );
  }
}
