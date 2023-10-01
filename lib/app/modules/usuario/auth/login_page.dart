import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wcars/app/constants/route_name.dart';
import 'package:wcars/app/modules/usuario/usuario_controller.dart';
import 'package:wcars/app/styles/app_images.dart';
import 'package:wcars/app/utils/ui_helper.dart';

import '../../../../domain/utils/status.dart';
import '../../../utils/validators.dart';
import '../../../widgets/buttons/elevated_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool hidePass = true;
  final controller = UsuarioController();

  login() async {
    final statusLogin =
        await controller.login(usuarioController.text, senhaController.text);
    if (statusLogin.status == Status.failed) {
      UIHelper.showInSnackBar('Login ou senha incorreta', context);
    } else if (statusLogin.status == Status.success) {
      Navigator.popAndPushNamed(context, RouteName.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 120,
                      width: 160,
                      child: Image.asset(
                        AppImages.wcars,
                        fit: BoxFit.cover,
                      )),
                  Text(
                    'Painel administrativo',
                    style: Theme.of(context).textTheme.titleLarge!,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Faça o login para continuar',
                    style: Theme.of(context).textTheme.bodyLarge!,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: usuarioController,
                          validator: (value) => Validators.empty(value!),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            hintText: 'Usuario',
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          children: [
                            TextFormField(
                              controller: senhaController,
                              validator: (value) => Validators.password(value!),
                              obscureText: hidePass,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: 'SENHA',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: hidePass
                                      ? const Icon(
                                          Icons.visibility_outlined,
                                        )
                                      : Icon(Icons.visibility_off_outlined),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = !hidePass;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Observer(builder: (_) {
                          return ElevatedButtonWidget(
                            text: 'Login',
                            loading:
                                controller.statusLogin.status == Status.loading,
                            onPressed: () => {
                              if (_formKey.currentState!.validate()) {login()}
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
