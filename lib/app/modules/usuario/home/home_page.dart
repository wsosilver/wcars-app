import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wcars/app/constants/route_name.dart';
import 'package:wcars/app/modules/usuario/home/home_controller.dart';
import 'package:wcars/app/styles/app_images.dart';
import 'package:wcars/app/utils/ui_helper.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController searchController = TextEditingController();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, RouteName.carro),
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Painel Administrativo'),
          centerTitle: true,
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
                    onChanged: (value) => controller.filterCarros(value),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Busque por nome, marca, modelo ',
                    ),
                  ),
                ),
              ),
              Expanded(child: Observer(builder: (_) {
                return SizedBox(
                    width: size.height,
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(controller.listCarrosAux.length,
                          (index) {
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, RouteName.carro,
                              arguments: controller.listCarrosAux[index]),
                          child: Card(
                            child: Container(
                              height: 150,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                            .listCarrosAux[
                                                                index]
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
