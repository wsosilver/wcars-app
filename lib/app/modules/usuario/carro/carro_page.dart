import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wcars/app/modules/usuario/home/home_controller.dart';
import 'package:wcars/app/styles/app_images.dart';
import 'package:wcars/app/widgets/buttons/elevated_button_widget.dart';
import 'package:wcars/domain/entities/carro/carro_entity.dart';
import 'package:brasil_fields/brasil_fields.dart';

import '../../../utils/validators.dart';

class CarroPage extends StatefulWidget {
  const CarroPage({Key? key, this.carro}) : super(key: key);

  @override
  State<CarroPage> createState() => CarroPageState();
  final CarroEntity? carro;
}

final controller = HomeController();

class CarroPageState extends State<CarroPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController marcaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.ini();
    widget.carro != null ? preencherFormulario() : null;
    super.initState();
  }

  salvar() {}

  preencherFormulario() {
    nomeController.text = widget.carro!.nome;
    marcaController.text = widget.carro!.marca;
    modeloController.text = widget.carro!.modelo;
    precoController.text = '${widget.carro!.preco}';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: widget.carro == null ? Text('Cadastro') : Text('Alterar'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: EdgeInsets.all(12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        AppImages.carro,
                      ),
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nomeController,
                            validator: (value) => Validators.empty(value!),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Nome'),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: marcaController,
                            validator: (value) => Validators.empty(value!),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Marca'),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: modeloController,
                            validator: (value) => Validators.empty(value!),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Modelo',
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: precoController,
                            validator: (value) => Validators.empty(value!),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              RealInputFormatter()
                            ],
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              prefix: Text('R\$ '),
                              border: UnderlineInputBorder(),
                              labelText: 'Preco',
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Observer(builder: (_) {
                    return ElevatedButtonWidget(
                      text: 'Salvar',
                      onPressed: () =>
                          {if (_formKey.currentState!.validate()) {}},
                    );
                  }),
                ]),
          ),
        ));
  }
}
