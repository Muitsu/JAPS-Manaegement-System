import 'package:flutter/material.dart';
import 'package:japs/constants/color_constants.dart';
import 'package:japs/pages/user_provider.dart';
import 'package:provider/provider.dart';

import '../home_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: size.width * 0.28,
                      width: size.width * 0.28,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AssetsColor.darkGreen),
                      child: const Center(
                          child: Text(
                        'JAPS.',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(child: Text('Job Allocation Palm System')),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: userCtrl,
                      decoration: const InputDecoration(hintText: 'Username'),
                      textCapitalization: TextCapitalization.characters,
                      validator: (name) => name != null && name.isEmpty
                          ? 'Please Enter Name'
                          : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final form = formKey.currentState!;
                        if (!form.validate()) return;

                        context
                            .read<UserProvider>()
                            .setUser(name: userCtrl.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeView()));
                      },
                      child: const Text('Login'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
