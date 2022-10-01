import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController myControllerA = TextEditingController();
  TextEditingController myControllerB = TextEditingController();
  double result = 0;
  double a = 0;
  double b = 0;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Calculator'),
      ),
      body:  Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 40),
                child: SizedBox(
                  width: 100,
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder()),
                    controller: myControllerA,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (text) {
                      setState(() {
                        a = double.parse(text);
                      });
                    }
                  ),
                ),
              ),

               Padding(
                 padding: const EdgeInsets.only(left: 20,top: 40),
                 child: SizedBox(
                   width: 100,
                   child: TextField(decoration:
                   const InputDecoration(
                       border:  OutlineInputBorder()),
                     controller: myControllerB,
                     keyboardType: TextInputType.number,
                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                     onChanged: (text){
                     setState(() {
                       b = double.parse(text);
                     });
                     },
                   ),
                 ),
               ),
             Text('結果$result')
    ],),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: (){
                    setState((){
                      result =a+b;
              });
                },
                  child:Text('＋')),
              ElevatedButton(
                  onPressed: (){
                    setState((){
                      result =a-b;
                    });
                  },
                  child:Text('-')),
              ElevatedButton(
                  onPressed: (){
                    setState((){
                      result =a*b;
                    });
                  },
                  child:Text('×')),
              ElevatedButton(
                  onPressed: (){
                    setState((){
                       result = a/b ;


                    });
                  },
                  child:Text('÷')),
            ],),
        )],
      ),

    );
  }
}
