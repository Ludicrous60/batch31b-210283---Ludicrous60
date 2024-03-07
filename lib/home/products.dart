import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Products_View extends ConsumerStatefulWidget {
  const Products_View({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Products_ViewState();
}

class _Products_ViewState extends ConsumerState<Products_View> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'Helmets',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Products'),
          )
        ],
      ),
    );
  }
}