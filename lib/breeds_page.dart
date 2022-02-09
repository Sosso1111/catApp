import 'dart:convert';

import 'package:flutter/material.dart';
import 'api.dart';
import 'breed_page.dart';
import 'models/breed.dart';
import 'package:http/http.dart' as http;

import 'models/palette.dart';

class BreedsPage extends StatefulWidget {
  const BreedsPage ({Key? key}) : super(key: key);

  @override
  State<BreedsPage> createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> {
  List<Breed> _breeds = [];

  Future<List<Breed>> fetchBreeds() async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds'),
      headers: {"x-api-key": API.key, "Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      List<Breed> breeds = [];
      var body = jsonDecode(response.body) as List<dynamic>;
      for (var value in body){
        breeds.add(Breed.fromJson(value));
      }
      return breeds;
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  @override
  void initState() {
    fetchBreeds().then((breeds){
      setState((){
        _breeds = breeds;
      });
    });
    super.initState();
  }

  Widget buildListView(){
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        color: Color(0xFF355855),
            thickness:0.5,
        height:15,
      ),
        itemCount: _breeds.length,
        itemBuilder: (BuildContext context, int index) {

          return ListTile(
              title: Text(_breeds[index].name,),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BreedPage(_breeds[index])),
                );
              });
        }).build(context);

  }

  @override
  Widget build(BuildContext context){
    return Scaffold (
      appBar: AppBar(
        title: const Text("Breeds"),

      ),
      body: buildListView(),
    );
  }
}