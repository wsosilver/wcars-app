import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wcars/app/constants/route_name.dart';
import 'package:wcars/app/modules/vitrine/vitrine_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wcars/app/utils/ui_helper.dart';
import 'package:wcars/app/widgets/empty/empty.dart';
import 'package:wcars/app/widgets/page_error/page_error.dart';
import 'package:wcars/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:wcars/domain/utils/status.dart';

class VitrinePage extends StatefulWidget {
  const VitrinePage({Key? key}) : super(key: key);

  @override
  State<VitrinePage> createState() => VitrinePageState();
}

class VitrinePageState extends State<VitrinePage> {
  final controller = VitrineController();
  TextEditingController searchController = TextEditingController();
  int page = 1;
  Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.cover,
    );
  }

  checkGetListPlus(int index) async {
    if (index >= controller.listCarrosAux.length - 2) {
      page += 1;
      if (page <= controller.config!.data!.lastPage!) {
        await controller.getListPaginacao(page);
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    controller.ini();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeContainerHeight = (MediaQuery.of(context).size.height);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, RouteName.login)
                    .then((value) => controller.ini()),
                icon: Icon(Icons.person_3))
          ],
          title: Text(
            'WCars - Sua melhor opção',
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          centerTitle: true,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: sizeContainerHeight * .1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => controller.filterCarros(value),
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
                    return CircularProgressCustom();
                  case Status.success:
                    return controller.listCarrosAux.isEmpty
                        ? Center(
                            child: EmptyWidget(
                              descricao: 'Nenhum carro cadastrado',
                            ),
                          )
                        : Expanded(
                            child: GridView.builder(
                            itemCount: controller.listCarrosAux.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 4 / 4.5,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              checkGetListPlus(index);

                              return Card(
                                child: Container(
                                  height: 160,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.bottomStart,
                                          children: [
                                            SizedBox(
                                                height: 120,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: imageFromBase64String(
                                                    controller
                                                        .listCarrosAux[index]
                                                        .img!)),
                                          ],
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        softWrap: false,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption),
                                                    Text(' - '),
                                                    Text(
                                                        controller
                                                            .listCarrosAux[
                                                                index]
                                                            .marca,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        softWrap: false,
                                                        style: Theme.of(context)
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        softWrap: false,
                                                        style: Theme.of(context)
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
                                                            TextOverflow.clip,
                                                        softWrap: false,
                                                        style: Theme.of(context)
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
                              );
                            },
                          ));
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
