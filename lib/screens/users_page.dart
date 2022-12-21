import 'package:flutter/material.dart';
import 'package:frontend_get_api/services/post_services.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';


import '../provider/users_provider.dart';

class UsersPage extends StatelessWidget {
  var id;

 

  
   UsersPage( {Key? key,  required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<UsersProvider>(context, listen: false).getAllUsers();
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('USERS'),
      ),
      body: Consumer<UsersProvider>(
        builder: (context, value2, child) {
          if (value2.isLoadingUsers) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final users = value2.users;
          return ListView.builder(
            itemCount: 1,
            // users.length <= posts.length ? users.length : posts.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return Card(
                elevation: 20,
                borderOnForeground: false,
                child: Column(
                  children: [
                    Text('${id.toString()}'+' POST ID'),
                    Text('${user.id.toString()}'+' USER ID')
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}


 /* class isimler{
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  }  */

/* import 'package:flutter/material.dart';
import 'package:frontend_get_api/model/user_model.dart';
import 'package:frontend_get_api/provider/post_provider.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<UsersProvider>(context, listen: false).getAllUsers();
      },
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('USERS'),
        ),
        body: ChangeNotifierProvider(
          create: (context) => UsersProvider(),
          child: Consumer<UsersProvider>(
            builder: (context, value2, child) {
              if (value2.isLoadingUsers) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final users = value2.users;

              return ListView.builder(
                itemCount: users.length,
                // users.length <= posts.length ? users.length : posts.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  return Text(user.email);
                },
              );
            },
          ),
        ));
  }
}
 */