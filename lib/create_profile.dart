import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum Species { dog, cat }
enum Sex {male, female}

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController breedEditingController = TextEditingController();
  TextEditingController ageEditingController = TextEditingController();

  Species? species = Species.dog;
  Sex? sex = Sex.male;

  void addProfile()async{
    await FirebaseFirestore.instance.collection('profile').add({
      'name': nameEditingController.text,
      'species': (species==Species.dog)?'dog':'cat',
      'breed': breedEditingController.text,
      'sex': (sex==Sex.male)?'オス':'メス',
      'age': ageEditingController.text
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: nameEditingController,
                decoration: const InputDecoration(labelText: '名前', border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Spacer(),
                Radio<Species>(
                  value: Species.dog,
                  groupValue: species,
                  onChanged: (Species? value) {
                    setState(() {
                      species = value;
                    });
                  },
                ),
                const Text('犬'),
                const Spacer(),
                Radio<Species>(
                  value: Species.cat,
                  groupValue: species,
                  onChanged: (Species? value) {
                    setState(() {
                      species = value;
                    });
                  },
                ),
                const Text('猫'),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: breedEditingController,
                decoration: const InputDecoration(labelText: '品種', border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Spacer(),
                Radio<Sex>(
                  value: Sex.male,
                  groupValue: sex,
                  onChanged: (Sex? value) {
                    setState(() {
                      sex = value;
                    });
                  },
                ),
                const Text('オス'),
                const Spacer(),
                Radio<Sex>(
                  value: Sex.female,
                  groupValue: sex,
                  onChanged: (Sex? value) {
                    setState(() {
                      sex = value;
                    });
                  },
                ),
                const Text('メス'),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: ageEditingController,
                decoration: const InputDecoration(labelText: '年齢', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: addProfile,
              child: const Text('登録'),
            )
          ],
        ),
      ),
    );
  }
}

