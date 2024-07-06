import 'package:coba_crud/add-blog.dart';
import 'package:coba_crud/model.dart';
import 'package:coba_crud/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD FLUTTER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => MyHomePage(title: 'Flutter crud'),
        '/add-blog': (context) => AddBlog(),
      },
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter crud'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Blog> listblog = [];

  Repository repository = Repository();

  getData() async {
    listblog = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.of(context).popAndPushNamed('/add-blog'),
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listblog[index].title,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(listblog[index].content),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: listblog.length),
    );
  }
}
