import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spe/loading_screen.dart';

class MainScreen extends StatelessWidget {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('ESP32_Cam').snapshots();

// final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DOOR'), //DOORLOCK
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'WHO OPENED THE DOOR',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange), 
              ),
            ),
            Container(
              height: 250,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: StreamBuilder<QuerySnapshot>(
                stream: users,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return Text('There is an Error');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingScreen();
                  }
                  final data = snapshot.requireData;

                  return ListView.builder(
                    //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      var timestamp = data.docs[index]['myTimestamp'];
                      var name = data.docs[index]['name'];
                      var date = timestamp.toDate();
                      return Text(
                        name + ' just unlocked at ' + date.toIso8601String(),
                        style: const TextStyle(
                            fontSize: 20, color: Colors.lightBlue),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection('users');

//     return Scaffold(
//       appBar: AppBar(),
//       body: Stack(
//         children: [
//           ListView(children: [], 
//             ),
//         ],
//       ),
//       // Padding(
//       //   padding: const EdgeInsets.fromLTRB(10, 200, 10, 200),
//       //   child: Column(
//       //     children: [
//       //       Center(
//       //         child: Text(
//       //           'User Name: ${FirebaseAuth.instance.currentUser!.email}',
//       //           style: const TextStyle(fontSize: 28, fontFamily: 'Zakirah'),
//       //         ),
//       //       ),
//       //       Padding(
//       //         padding: const EdgeInsets.all(20.0),
//       //         child: ElevatedButton(
//       //           onPressed: () {
//       //             FirebaseAuth.instance.signOut();
//       //             Navigator.pop(context);
//       //           },
//       //           child: const Text(
//       //             'Access Time',
//       //             style: TextStyle(
//       //               fontSize: 30,
//       //             ),
//       //           ),
//       //         ),
//       //       )
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }
