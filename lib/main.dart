import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_assignment2/create_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

enum Menu {dog, cat, ascending, descending}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Query query = FirebaseFirestore.instance.collection('profile');

  Query getQuery(Menu item){
    if(item == Menu.dog){
      return FirebaseFirestore.instance.collection('profile').where('species', isEqualTo: 'dog');
    }else if(item == Menu.cat){
      return FirebaseFirestore.instance.collection('profile').where('species', isEqualTo: 'cat');
    }else if(item == Menu.ascending) {
      return FirebaseFirestore.instance.collection('profile').orderBy('age', descending: false);
    }else if(item == Menu.descending){
      return FirebaseFirestore.instance.collection('profile').orderBy('age', descending: true);
    }else{
      return FirebaseFirestore.instance.collection('profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<Menu>(
            onSelected: (value) => setState(() => query = getQuery(value)),
            icon: const Icon(Icons.sort),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: Menu.dog,
                  child: Text('犬のみ'),
                ),
                const PopupMenuItem(
                  value: Menu.cat,
                  child: Text('猫のみ'),
                ),
                const PopupMenuItem(
                  value: Menu.ascending,
                  child: Text('年齢：昇順'),
                ),
                const PopupMenuItem(
                  value: Menu.descending,
                  child: Text('年齢：降順'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: query.snapshots(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    List<DocumentSnapshot> postsData = snapshot.data!.docs;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: postsData.length,
                          itemBuilder: (context, index){
                            Map<String, dynamic> data = postsData[index].data() as Map<String, dynamic>;
                            return Card(
                              child: Text('名前:${data['name']}　品種:${data['breed']}　性別:${data['sex']}　年齢:${data['age']}', style: const TextStyle(fontSize: 20),)
                            );
                          }
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator(),);
                }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){return const CreateProfileScreen();}));
        },
        tooltip: 'add profile',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.doc}) : super(key: key);
  final Map<String, dynamic> doc;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

