import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {

  bool _isLoading =  false;

  bool get isLoading => _isLoading;

  setLoading (bool value){
    _isLoading = value;
    notifyListeners();
  }

  void login({required String email, required String password}) async {
    try {
      setLoading(true);
      Response response = await http.post(Uri.parse('https://reqres.in/api/login'), body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        print('Login Success');
        setLoading(false);
      } else {
        print('Login Failed');
        setLoading(false);
      }
    } catch (e) {
      print('API is not working');
      setLoading(false);
    }
  }
}
