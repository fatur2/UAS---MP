import 'package:flutter/material.dart';
import 'package:coba_crud/repository.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  Repository repository = Repository();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Blog'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(hintText: 'Content'),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool response = await repository.postData(
                      _titleController.text, _contentController.text);
                  if (response) {
                    Navigator.of(context).popAndPushNamed('/home');
                  } else {
                    print('post data gagal');
                  }
                },
                child: Text('submit'))
          ],
        ),
      ),
    );
  }
}
