import 'dart:convert';
import 'package:catapp/models/breed.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api.dart';
import 'models/vote.dart';

class BreedPage extends StatelessWidget {
  final Breed _breed;

  BreedPage(this._breed);

  void downvote() {
    if (_breed.image == null) return;

    var vote = Vote(_breed.image!.id, 0);
    http
        .post(Uri.parse('https://api.thecatapi.com/v1/votes'),
            headers: {"x-api-key": API.key, "Content-Type": "application/json"},
            body: jsonEncode(vote.toJson()))
        .then((response) => print(response.body));
  }

  void upvote() {
    if (_breed.image == null) return;

    var vote = Vote(_breed.image!.id, 1);
    http
        .post(Uri.parse('https://api.thecatapi.com/v1/votes'),
            headers: {"x-api-key": API.key, "Content-Type": "application/json"},
            body: jsonEncode(vote.toJson()))
        .then((response) => print(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_breed.name),
        ),
        body: Center(
          child: ListView(children: [
            Row(children: [
              Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: _breed.image != null
                          ? Image.network(
                              _breed.image!.url,
                              fit: BoxFit.cover,
                            )
                          : Image.asset('placeholder.jpg', fit: BoxFit.cover)))
            ]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color(0xFF9CAC75),
                  child: IconButton(
                    onPressed: upvote,
                    color: Colors.black54,
                    padding: const EdgeInsets.all(20),
                    iconSize: 30,
                    icon: const Icon(Icons.thumb_up),
                  )),
              const SizedBox(width: 70),
              CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color(0xFF8B5358),
                  child: IconButton(
                    onPressed: downvote,
                    color: Colors.black54,
                    padding: const EdgeInsets.all(20),
                    iconSize: 30,
                    icon: const Icon(Icons.thumb_down),
                  ))
            ]),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                    child: Card(
                        child: DataTable(
                            headingRowColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.blueGrey.shade600,
                            ),
                            columns: [
                      DataColumn(label: Text('Property')),
                      DataColumn(label: Text('Value')),
                    ],
                            rows: [
                      DataRow(cells: [
                        DataCell(Text('ID')),
                        DataCell(Text(_breed.id))
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Name')),
                        DataCell(Text(_breed.name))
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Temperamant')),
                        DataCell(Text(_breed.temperament))
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Life Span')),
                        DataCell(Text(_breed.life_span ?? "N/A"))
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Alt Names')),
                        DataCell(Text(_breed.alt_names ?? "N/A"))
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Wikipedia')),
                        DataCell(Text(_breed.wikipedia_url ?? "N/A"))
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Origin')),
                        DataCell(Text(_breed.origin ?? "N/A"))
                      ]),
                    ])))
              ],
            )
          ]),
        ));
  }
}
