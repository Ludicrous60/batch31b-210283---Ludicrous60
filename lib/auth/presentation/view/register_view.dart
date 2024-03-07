import 'package:e_commerce/auth/domain/entity/auth_entity.dart';
import 'package:e_commerce/auth/presentation/view/login_view.dart';
import 'package:e_commerce/auth/presentation/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterView extends ConsumerStatefulWidget {
  RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  bool _obsecuretext = true;

  final _key = GlobalKey<FormState>();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 228, 223, 237),
          body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Form(
              key: _key,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                        'Welcome to  \n             Helmet Store',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(child: Icon(Icons.verified),),
                       SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.text_increase_outlined,
                              color: Colors.black,
                            ),
                            labelText: 'FirstName',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your FirstName';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.text_increase_outlined,
                              color: Colors.black,
                            ),
                            labelText: 'LastName',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your LastName';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            labelText: 'Email',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Email';
                          } else if (!value.contains('@')) {
                            return '@ is missing';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: password,
                        obscureText: _obsecuretext,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.black,
                            ),
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obsecuretext = !_obsecuretext;
                                });
                              },
                              child: Icon(
                                _obsecuretext
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Password';
                          } else if (value.length < 6) {
                            return 'Password must containe 6 letters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              minimumSize: Size(200, 60)),
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              final userData = AuthEntity(
                                  firstName: firstNameController.text.trim(),
                                  lastName: lastNameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: password.text.trim());
                              ref
                                  .read(authViewModelProvider.notifier)
                                  .signUpFreelancer(userData, context);
                            }
                          },
                          child: Text(
                            'Register',
                            style: TextStyle( color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => LoginView()));
                          },
                          child: Text(
                            'Already have an account?? Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
