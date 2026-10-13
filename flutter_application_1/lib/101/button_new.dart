import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.green;
                }
                return Colors.white;
              }),
            ),
            onPressed: () {},
            child: Text('data', style: Theme.of(context).textTheme.titleSmall),
          ),
          ElevatedButton(onPressed: null, child: Text('data')),
          IconButton(onPressed: () {}, icon: Icon(Icons.abc_rounded)),
          FloatingActionButton(
            onPressed: () {
              //Servise istek at
              //sayfanın rengini düzenle
            },
            child: Icon(Icons.add),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.all(10),
              //shape:CircleBorder()
            ),
            onPressed: () {},
            child: SizedBox(width: 200, child: Text('asd')),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.abc),
            label: Text('data'),
          ),
          InkWell(onTap: () {}, child: const Text('custom')),
          Container(height: 200, color: Colors.green),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(40)),
              ), // 'primary' yerine bunu kullanın
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                right: 40,
                left: 40,
              ),
              child: Text(
                'Button',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
