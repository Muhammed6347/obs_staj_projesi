import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FittedBox(child: Text('Merheba', style: Theme.of(context).textTheme.displayLarge, maxLines: 1)),
          Container(color: Colors.red, height: 300),
          Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.green, width: 100),
                Container(color: Colors.white, width: 100),
                Container(color: Colors.green, width: 100),
                Container(color: Colors.green, width: 100),
                Container(color: Colors.green, width: 100),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          //xx
          FittedBox(child: Text('Merheba', style: Theme.of(context).textTheme.displayLarge, maxLines: 1)),
          Container(color: Colors.red, height: 300),
          Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.green, width: 50),
                Container(color: Colors.white, width: 50),
                Container(color: Colors.green, width: 50),
                Container(color: Colors.green, width: 50),
                Container(color: Colors.green, width: 50),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          const Listdemo(),
        ],
      ),
    );
  }
}

class Listdemo extends StatefulWidget {
  const Listdemo({super.key});

  @override
  State<Listdemo> createState() => _ListdemoState();
}

class _ListdemoState extends State<Listdemo> {
  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print("hello");
  }

  @override
  void dispose() {
    super.dispose();
    // ignore: avoid_print
    print("exit");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
