import 'package:flutter/material.dart';
import 'package:frontend_get_api/provider/post_provider.dart';
import 'package:frontend_get_api/screens/users_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<PostProvider>(context, listen: false).getAllPosts();
        //  Provider.of<UsersProvider>(context, listen: false).getAllUsers();
      },
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider API'),
        ),
        body: Consumer<PostProvider>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final posts = value.posts;

            // final users = value2.users;
            return ListView.builder(
              itemCount: posts.length,
              // users.length <= posts.length ? users.length : posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                //final user = users[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(child: Text(post.id.toString())),
                      title: Text(
                        post.body.toString(),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "title:${post.title}",
                            textAlign: TextAlign.center,
                          ),
                          Text("post id:${post.id}",
                              textAlign: TextAlign.center),
                          ElevatedButton(
                              onPressed: () {

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const UsersPage()));
                              },
                              child: Text('User'))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
userschoose (){
  
}
