import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoexample/model/firebaseSurvices.dart';

class Todopage extends StatefulWidget {
  const Todopage({super.key});

  @override
  State<Todopage> createState() => _TodopageState();
}

class _TodopageState extends State<Todopage> {
  final title = TextEditingController();
  final subtitle = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: Text(
          "Todo",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('user').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data?.docs;
          if (docs == null || docs.isEmpty) {
            return Center(child: Text('No data available.'));
          }
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index];
              return ListTile(
                leading: Checkbox(
                  value: data['checkbox'] ?? false,
                  onChanged: (value) async {
                    await FirebaseFirestore.instance
                        .collection('user')
                        .doc(data.id)
                        .update({'checkbox': value});
                  },
                ),
                title: Text(
                  data["title"].toString(),
                  style: TextStyle(
                    decoration: data['checkbox'] == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                subtitle: Text(
                  data["subtitle"].toString(),
                  style: TextStyle(
                    decoration: data['checkbox'] == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Form(
                                  key: formkey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "My Shedules",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextFormField(
                                        controller: title,
                                        validator: (value) {},
                                        decoration: InputDecoration(
                                            hintText: "Enter TODO Title",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        validator: (value) {},
                                        controller: subtitle,
                                        decoration: InputDecoration(
                                            hintText: "Enter Dicription",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel")),
                                  ElevatedButton(
                                      onPressed: () async {
                                        await Firebasestorage().UpdateData(
                                            title.text, subtitle.text,
                                            documentId: data.id);
                                        Navigator.pop(context);
                                        title.clear();
                                        subtitle.clear();
                                      },
                                      child: Text("OK"))
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () async {
                          await Firebasestorage()
                              .deleteData(documentId: data.id);
                        },
                        icon: Icon(Icons.delete)),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
      
        splashColor: Colors.purple,
        backgroundColor: Colors.purpleAccent,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Form(
                  key: formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "My Shedules",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (title.text.isEmpty) {
                            return "Enter value";
                          }
                          return null;
                        },
                        controller: title,
                        decoration: InputDecoration(
                            hintText: "Enter TODO Title",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (subtitle.text.isEmpty) {
                            return "Enter value";
                          }
                          return null;
                        },
                        controller: subtitle,
                        decoration: InputDecoration(
                            hintText: "Enter Dicription",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),
                  ElevatedButton(
                      onPressed: () async {
                        if(formkey.currentState!.validate()){
                          await Firebasestorage().createData(
                            title.text, subtitle.text, false,
                            documentId: FirebaseAuth.instance.currentUser?.uid);
                        title.clear();
                        subtitle.clear();
                         Navigator.pop(context);
                        }
                      },
                      child: Text("OK"))
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
