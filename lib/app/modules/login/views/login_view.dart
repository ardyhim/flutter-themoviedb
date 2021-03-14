import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hypemovies/app/views/button_widgets.dart';

import '../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  LoginController loginController = Get.find<LoginController>();
  TextEditingController username = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    Size size = context.mediaQuery.size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Form(
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          "https://source.unsplash.com/500x900/?movies",
                        ),
                      ),
                    ),
                  ),
                  ClipRect(
                    child: new BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                      child: new Container(
                        width: size.width,
                        height: size.height,
                        decoration: new BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height: size.height / 100 * 60,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "“It's funny how the colors of the real world only seem really real when you watch them on a screen.”",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 35),
                          ),
                          Text(
                            "anthony burgess",
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: (size.height / 100 * 20) + 40,
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: username,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Username",
                          focusColor: Colors.redAccent,
                          fillColor: Colors.white70,
                          suffixIcon: IconButton(
                            color: Colors.redAccent,
                            icon: Icon(Icons.person),
                            onPressed: () {},
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.redAccent, width: 2),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: (size.height / 100 * 10) + 40,
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: password,
                        textInputAction: TextInputAction.send,
                        decoration: InputDecoration(
                          hintText: "Password",
                          focusColor: Colors.redAccent,
                          fillColor: Colors.white70,
                          suffixIcon: IconButton(
                            color: Colors.redAccent,
                            icon: Icon(Icons.lock),
                            onPressed: () {},
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.redAccent, width: 2),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: size.height / 100 * 5,
                    child: Container(
                      width: size.width,
                      child: CustomButton(
                        height: 50,
                        firstColor: Colors.red,
                        secondColor: Colors.redAccent,
                        onTap: () async {
                          try {
                            if (username.text != "" || password.text != "") await loginController.login(username: username.text, password: password.text);
                            loginController.isLoading.value = false;
                            // Get.snackbar("Login", "Success Login!");
                            Get.offNamed("/tabs");
                          } catch (e) {
                            print(e);
                            loginController.isLoading.value = false;
                            Get.snackbar("Login", e);
                          }
                        },
                        text: "LOGIN",
                      ),
                    ),
                  ),
                  Obx(
                    () => controller.isLoading.value
                        ? Container(
                            height: size.height,
                            width: size.width,
                            color: Colors.black87,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
