import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    provider.login(email: _emailController.text.toString(), password: _passwordController.text.toString());
                  },
                  child: provider.isLoading ? const Center(child: CircularProgressIndicator(color: Colors.white,)) : Text('Login'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
