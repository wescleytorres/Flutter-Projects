
      appBar: AppBar(
        title: Text('alo'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context, index) {
              var name = data[index]['name'];
              var email = data[index]['email'];
              var idade = data[index]['idade'];

              return Column(
                children: [
                  ListTile(
                    title: Text('Nome: $name'),
                    subtitle: Text('Email: $email'),
                    trailing: Text('Idade: $idade'),
                  ),
                  Divider(),
                ],
              );
            },
          ))
        ],
      ),
    
      List data;

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/data.json');
    setState(() => data = json.decode(jsonText));
    return 'success';
  }

  @override
  void initState() {
    super.initState();

    this.loadJsonData();
  }

  import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';