import 'package:flutter/material.dart';
import 'package:wcars/app/constants/route_name.dart';
import 'package:wcars/app/modules/vitrine/vitrine_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wcars/app/styles/app_images.dart';
import 'package:wcars/app/utils/ui_helper.dart';

class VitrinePage extends StatefulWidget {
  const VitrinePage({Key? key}) : super(key: key);

  @override
  State<VitrinePage> createState() => VitrinePageState();
}

class VitrinePageState extends State<VitrinePage> {
  final controller = VitrineController();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    controller.ini();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeContainerHeight = (MediaQuery.of(context).size.height);
    final sizeContainerWidth = (MediaQuery.of(context).size.width);

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, RouteName.login),
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
              Expanded(child: Observer(builder: (_) {
                return Container(
                    width: sizeContainerWidth,
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(controller.listCarrosAux.length,
                          (index) {
                        return Card(
                          child: Container(
                            height: 150,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      SizedBox(
                                          height: 120,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.asset(AppImages.carro,
                                              fit: BoxFit.cover)),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              child: Row(
                                            children: [
                                              Text(
                                                  controller
                                                      .listCarrosAux[index]
                                                      .modelo,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption),
                                              Text(' - '),
                                              Text(
                                                  controller
                                                      .listCarrosAux[index]
                                                      .marca,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption),
                                            ],
                                          )),
                                          SizedBox(
                                              child: Text(
                                                  controller
                                                      .listCarrosAux[index]
                                                      .nome,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2)),
                                          Row(
                                            children: [
                                              Text(
                                                  UIHelper.moneyFormat(
                                                      controller
                                                          .listCarrosAux[index]
                                                          .preco),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.clip,
                                                  softWrap: false,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                      }),
                    ));
              }))
            ],
          ),
        ));
  }
}
