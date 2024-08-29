import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/signin_screen.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;

  const CustomScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('English mastery'),
        actions:  [
          PopupMenuButton<Menuaction>(
              onSelected: (value) async {
                switch (value){
                  case Menuaction.logout:
                    final ShouldOut = await ShowlogOutDialog(context);
                    if(ShouldOut){
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );

                    }
                  default:
                    break;
                }
              },
              itemBuilder: (context) {
                return const [
                  PopupMenuItem<Menuaction>(value: Menuaction.logout,child:  Text('Logout')),
                ];
              }
          )
        ],),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}
enum Menuaction {logout}
Future<bool>ShowlogOutDialog(BuildContext context){
  return showDialog<bool>(context: context, builder: (context){
    return AlertDialog(
      title: const Text('SignOut'),
      content: const Text('are u sure to sign out'),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop(false);
        }, child: const Text('cancel')),
        TextButton(onPressed: (){
          Navigator.of(context).pop(true);
        }, child: const Text('log out')),
      ],
    );
  }
  ).then((value)=> value ?? false);
}

