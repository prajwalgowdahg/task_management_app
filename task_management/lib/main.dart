import 'package:flutter/material.dart';
import 'models/task_list.dart'; // Import TaskListPage
import 'models/signup.dart'; // Import SignUpPage
import 'models/login.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

// void main() {
//   runApp(const TaskManagementApp());
// }

// class TaskManagementApp extends StatelessWidget {
//   const TaskManagementApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/signup', // Set the initial page
//       routes: {
//         '/signup': (context) => SignUpPage(), // Map to SignUpPage
//         '/home': (context) => TaskListPage(), // Map to TaskListPage
//       },
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Fetch the environment variables from the .env file
  const keyApplicationId = 'LpIZBjMOk6FTA1Khuu4zQUKURhmQBtJ4NMW4KYel';
  const keyClientKey = 'KXXmZMt3oY4HZSAK9cK5x5qhrYDeKEntOlTZ4qXP';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login/Signup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/signup': (context) => SignUpPage(),
        '/tasks': (context) => TaskListPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
