import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wcars/app/constants/route_name.dart';
import 'package:wcars/app/modules/usuario/carro/carro_controller.dart';
import 'package:wcars/app/styles/app_color_scheme.dart';
import 'package:wcars/app/utils/ui_helper.dart';
import 'package:wcars/app/widgets/buttons/elevated_button_widget.dart';
import 'package:wcars/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:wcars/domain/entities/carro/carro_entity.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'dart:convert';
import '../../../../domain/utils/status.dart';
import '../../../utils/validators.dart';

class CarroPage extends StatefulWidget {
  const CarroPage({Key? key, this.carro}) : super(key: key);

  @override
  State<CarroPage> createState() => CarroPageState();
  final CarroEntity? carro;
}

final controller = CarroController();

class CarroPageState extends State<CarroPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController marcaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  XFile? image;
  File? file;
  @override
  void initState() {
    widget.carro != null ? preencherFormulario() : null;
    super.initState();
  }

  preencherFormulario() {
    nomeController.text = widget.carro!.nome;
    marcaController.text = widget.carro!.marca;
    modeloController.text = widget.carro!.modelo;
    precoController.text = '${widget.carro!.preco}';
  }

  cadastrar() async {
    if (image != null) {
      CarroEntity carro = CarroEntity(
          nome: nomeController.text,
          marca: marcaController.text,
          modelo: modeloController.text,
          preco:
              UtilBrasilFields.converterMoedaParaDouble(precoController.text),
          foto: image?.path);
      await controller.adicionar(carro);
      Navigator.pop(context);
    } else {
      UIHelper.showInSnackBar(
          'É necessario anexar uma foto para cadastrar o produto', context);
    }
  }

  excluir() async {
    await controller.excluir(widget.carro!.id!);
    Navigator.pop(context);
  }

  alterar() async {
    CarroEntity carro = CarroEntity(
        id: widget.carro?.id,
        nome: nomeController.text,
        marca: marcaController.text,
        modelo: modeloController.text,
        preco: UtilBrasilFields.converterMoedaParaDouble(precoController.text),
        foto: image?.path);
    await controller.alterar(carro);
    Navigator.pop(context);
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  getImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      file = image != null ? File(image!.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool is_alteracao = widget.carro != null;
    return Scaffold(
        appBar: AppBar(
          title: is_alteracao ? Text('Alterar') : Text('Cadastro'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: EdgeInsets.all(12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: GestureDetector(
                      onTap: () => getImage(),
                      child: Container(
                        height: 120,
                        width: 120,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 180,
                              width: 180,
                              child: image != null
                                  ? Image.file(
                                      file!,
                                      fit: BoxFit.cover,
                                    )
                                  : widget.carro != null
                                      ? imageFromBase64String(
                                          widget.carro!.img!)
                                      : Icon(Icons.image),
                            ),
                            Icon(
                              Icons.collections,
                              color: AppColorScheme.white.withOpacity(0.8),
                              size: 40,
                            )
                          ],
                        ),
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
                    return Row(
                      children: [
                        if (is_alteracao)
                          Container(
                            height: 52,
                            width: size.width * 0.45,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.red[400]),
                                ),
                                onPressed: () => excluir(),
                                child: controller.statusExcluir.status ==
                                        Status.loading
                                    ? CircularProgressCustom()
                                    : Text('Excluir')),
                          ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: ElevatedButtonWidget(
                            text: 'Salvar',
                            loading: controller.statusAdicionar.status ==
                                Status.loading,
                            onPressed: () => {
                              if (_formKey.currentState!.validate())
                                {is_alteracao ? alterar() : cadastrar()}
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                ]),
          ),
        ));
  }
}
