import 'dart:ui';
import 'package:ceaser_cipher/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final TextController = TextEditingController();
  final EncryptedTextController = TextEditingController();
  final shift = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Ceaser's Cipher",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ceaser's Cipher"
          ),
        ),
        body: SingleChildScrollView(
          child:Column(
              children:[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Decrypted Text',
                    ),
                    controller: TextController,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        EncryptedTextController.text = encrypt(TextController.text,int.parse(shift.text));
                      },
                      child:const Icon(
                          CupertinoIcons.down_arrow,
                        color:Colors.white,
                        size: 24,
                      )
                    ),
                    SizedBox(width: 15,),
                    ElevatedButton(
                        onPressed: () {
                          TextController.text = encrypt(EncryptedTextController.text,-int.parse(shift.text));
                        },
                        child:const Icon(
                          CupertinoIcons.up_arrow,
                          color:Colors.white,
                          size: 24,
                        )
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Encrypted Text',
                    ),
                    controller: EncryptedTextController,
                  ),
                ),
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 75),
                  child: Column(
                    children: [const Text(
                      "Enter The Shift"
                    ),
                 const SizedBox(height: 20, width: 15,),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: shift,
                        decoration:const InputDecoration(
                          border: OutlineInputBorder()
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
  
}