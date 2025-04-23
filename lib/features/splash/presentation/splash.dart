import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gemchat/core/config/route/app_routes.dart';
import 'package:gemchat/core/utils/constants/app_const.dart';
import 'package:gemchat/core/utils/extentions/context_extention.dart';
import 'package:gemchat/core/utils/services/local_db.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Timer(Duration(seconds: 2), () {
      if (LocalDb.getBool(AppConstants.isUserLoggedIn)) {
        context.pushNamed(AppRoutes.chatScreen);
      } else {
        context.pushNamed(AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Chat Gem',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
