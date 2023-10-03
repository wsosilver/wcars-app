import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wcars/app/constants/route_name.dart';
import 'package:wcars/app/modules/usuario/home/home_controller.dart';
import 'package:wcars/app/styles/app_images.dart';
import 'package:wcars/app/utils/ui_helper.dart';

import '../../../../domain/utils/status.dart';
import '../../../widgets/empty/empty.dart';
import '../../../widgets/page_error/page_error.dart';
import '../../../widgets/progress/circuclar_progress_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

final controller = HomeController();

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    controller.ini();
    super.initState();
  }

  Widget imageFromBase64String(String base64String) {
    return base64String.isNotEmpty
        ? Image.memory(
            base64Decode(base64String),
            fit: BoxFit.cover,
          )
        : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController searchController = TextEditingController();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, RouteName.carro)
              .then((value) => controller.ini()),
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Painel Administrativo'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () =>
                  Navigator.popAndPushNamed(context, RouteName.vitrine),
              icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => print(''),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Busque por nome, marca, modelo ',
                    ),
                  ),
                ),
              ),
              Observer(builder: (_) {
                switch (controller.carros.status) {
                  case Status.loading:
                    return Center(child: CircularProgressCustom());
                  case Status.success:
                    return controller.listCarrosAux.isEmpty
                        ? Center(
                            child: EmptyWidget(
                              descricao: 'Nenhum carro cadastrado',
                            ),
                          )
                        : Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              children: List.generate(
                                  controller.listCarrosAux.length, (index) {
                                return GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                          context, RouteName.carro,
                                          arguments:
                                              controller.listCarrosAux[index])
                                      .then((value) => controller.ini()),
                                  child: Card(
                                    child: Container(
                                      height: 150,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional
                                                  .bottomStart,
                                              children: [
                                                SizedBox(
                                                    height: 120,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child:
                                                        imageFromBase64String(
                                                            controller
                                                                .listCarrosAux[
                                                                    index]
                                                                .img!)),
                                              ],
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        child: Row(
                                                      children: [
                                                        Text(
                                                            controller
                                                                .listCarrosAux[
                                                                    index]
                                                                .modelo,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            softWrap: false,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                        Text(' - '),
                                                        Text(
                                                            controller
                                                                .listCarrosAux[
                                                                    index]
                                                                .marca,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            softWrap: false,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                      ],
                                                    )),
                                                    SizedBox(
                                                        child: Text(
                                                            controller
                                                                .listCarrosAux[
                                                                    index]
                                                                .nome,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            softWrap: false,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText2)),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            UIHelper.moneyFormat(
                                                                controller
                                                                    .listCarrosAux[
                                                                        index]
                                                                    .preco),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            softWrap: false,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText2
                                                                ?.copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );

                  default:
                    return PageError(
                      onPressed: () => print(''),
                      messageError: 'Erro ao carregar a listagem de carros',
                    );
                }
              })
            ],
          ),
        ));
  }
}
