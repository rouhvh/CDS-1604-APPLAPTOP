import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (_) => Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(height: 30),
                  const Icon(
                    Icons.laptop_mac,
                    size: 200,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: SizedBox(
                      width: 120,
                      child: LinearProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
