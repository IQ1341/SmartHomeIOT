// HomePage.dart

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Lampu1.dart';
import 'Lampu2.dart';
import 'Lampu3.dart';
import 'Suhu.dart';
import 'Kelembaban.dart';
import 'Cahaya.dart';

class HomePage extends StatelessWidget {
  final List<String> containerNames = [
    'Lampu 1',
    'Lampu 2',
    'Lampu 3',
    'Kelembaban',
    'Suhu',
    'Cahaya',
  ];

  final List<String> partNames = [
    "Pin 12",
    "Pin 13",
    "Pin 26",
    "80%",
    "34°C",
    "259lx",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              print('profile diklik');
            },
            child: Container(
              margin: EdgeInsets.only(left: 9, right: 9, top: 30),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Datang',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 24.0,
                                color: Color.fromARGB(0xFF, 0x22, 0x25, 0x38),
                              ),
                            ),
                            Text(
                              'mirai.world Smart IoT',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                height: 0.8,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                color: Color.fromARGB(0xFF, 0x22, 0x25, 0x38),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      width: 46.0,
                      height: 46.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 237, 239, 242),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        'assets/user.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/air.png',
                  width: 62.0,
                  height: 62.0,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '80%',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 40.0,
                            color: const Color.fromARGB(255, 34, 37, 56),
                          ),
                        ),
                        Text(
                          'Kelembaban',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            height: 0.7,
                            color: const Color.fromARGB(255, 34, 37, 56),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  'assets/suhu2.png',
                  width: 62.0,
                  height: 62.0,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '34°C',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 40.0,
                            color: const Color.fromARGB(255, 34, 37, 56),
                          ),
                        ),
                        Text(
                          'Suhu',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            height: 0.7,
                            color: const Color.fromARGB(255, 34, 37, 56),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerGrid(containerNames, partNames),
          ),
        ],
      ),
    );
  }
}

class ContainerGrid extends StatefulWidget {
  final List<String> containerNames;
  final List<String> partNames;

  ContainerGrid(this.containerNames, this.partNames);

  @override
  _ContainerGridState createState() => _ContainerGridState();
}

class _ContainerGridState extends State<ContainerGrid> {
  List<bool> switchValues = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 0.0,
      children: List.generate(6, (index) {
        return GestureDetector(
          onTap: () {
            print('${widget.containerNames[index]} diklik!');
            navigateToContainerPage(context, index);
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 237, 239, 242),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index < 3)
                    Row(
                      children: [
                        Image.asset(
                          switchValues[index]
                              ? 'assets/light-on.png'
                              : 'assets/light-off.png',
                          width: 50.0,
                          height: 50.0,
                        ),
                        SizedBox(width: 30.0),
                        CupertinoSwitch(
                          activeColor: const Color.fromARGB(255, 34, 37, 56),
                          thumbColor: const Color.fromARGB(255, 255, 255, 255),
                          trackColor: const Color.fromARGB(255, 162, 169, 184),
                          value: switchValues[index],
                          onChanged: (value) {
                            setState(() {
                              switchValues[index] = value;
                            });
                            int ledVirtualPin =
                                index == 0 ? 1 : (index == 1 ? 5 : 6);
                            // BlynkApi.toggleLed(value, ledVirtualPin);
                          },
                        ),
                      ],
                    ),
                  if (index >= 3)
                    Image.asset(
                      'assets/${widget.containerNames[index].toLowerCase()}.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  SizedBox(height: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          widget.containerNames[index],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 34, 37, 56),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          widget.partNames[index],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 165, 170, 177),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  void navigateToContainerPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Lampu1Page()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Lampu2Page()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Lampu3Page()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KelembabanPage()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SuhuPage()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CahayaPage()),
        );
        break;
      default:
        break;
    }
  }
}
