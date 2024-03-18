import 'package:cengden/data/ItemRepository.dart';
import 'package:cengden/pages/main_page/main_controller.dart';
import 'package:cengden/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainController controller = MainController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 70,
                color: Colors.black.withOpacity(0.1),
                child: Text(
                  "CENGDEN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 50,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  children: [
                    for (int index = 0; index < 10; index++)
                      Column(
                        children: [
                          Container(
                            height: 150,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ItemRepository.itemList.length < 2
                                ? PrimaryButton(
                                    text: "HEy",
                                    onPressed: () {
                                      print(ItemRepository.itemList.length);
                                    },
                                  )
                                : Row(
                                    children: [
                                      Column(
                                        children: [Text(ItemRepository.itemList[0].itemType)],
                                      ),
                                    ],
                                  ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
