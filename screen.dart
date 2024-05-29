import 'package:flutter/material.dart';
import 'button.dart';
import 'main_screen.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Door Status',
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'Zakirah',
              color: Color.fromARGB(255, 36, 33, 33),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 33, 211, 122),
                ],
              ),
            ),
          ),
          Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 60, bottom: 100, left: 31),
                    child: Button(
                        forIcons: const Icon(
                          Icons.tap_and_play_rounded,
                          size: 300,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(),
                                  ));
                            },
                          );
                        },
                        color: Colors.white60),
                  ),
                ),
              ],
            ),
          ),
          // Button(
          //     forIcons: const Icon(
          //       Icons.tap_and_play,
          //       size: 200,
          //     ),
          //     onPressed: () {
          //       setState(
          //         () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => MainScreen(),
          //               ));
          //         },
          //       );
          //     },
          //     color: Colors.red),
        ],
      ),
    );
  }
}
