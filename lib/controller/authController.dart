import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rms_mgmt/exchange.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  Future<void> login() async {

       
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Username and password are required', colorText: Colors.red);
      return;
    }else{
     
     Get.snackbar('Success', 'Login successful!' , colorText: Colors.green);
     Get.offAll(DynamicBankSchemaPage());
    }
    
   

  //   isLoading.value = true;

  //   try {
  //     final response = await http.post(
  //       Uri.parse('https://your-api-url.com/login'), // 🔁 Replace this URL
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'username': usernameController.text,
  //         'password': passwordController.text,
  //       }),
  //     );

  //     final responseData = jsonDecode(response.body);

  //     if (response.statusCode == 200) {
  //       String accessToken = responseData['access_token'];
  //       String refreshToken = responseData['refresh_token'];

  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('access_token', accessToken);
  //       await prefs.setString('refresh_token', refreshToken);

  //       Get.snackbar('Success', 'Login successful!');
  //       // Navigate to home or dashboard
  //       // Get.offAll(() => HomePage());
  //       Get.off(() => ExchangePage());
  //     } else {
  //       Get.snackbar(
  //         'Login Failed',
  //         responseData['message'] ?? 'Invalid credentials',
  //       );
  //     }
  //   } catch (e) {
     
  //    Get.to(ExchangePage());
  //     // ScaffoldMessenger.of(
  //     //   Get.context!,
  //     // ).showSnackBar(SnackBar(content: Text('Login successful!')));
  //     // Get.snackbar('Error', 'Something went wrong: $e');
  //   }
    
  //   isLoading.value = true;
  }
}
