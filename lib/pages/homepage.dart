import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=e6303fea";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conversor de Moedas',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.bedtime_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return const Center(
                child: Text(
                  "Dados 1",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25.0,
                  ),
                ),
              );
            case ConnectionState.active:
              return const Center(
                child: Text(
                  "Dados 2",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25.0,
                  ),
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Erro!!!",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 25.0,
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    "Carregando...",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25.0,
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}
