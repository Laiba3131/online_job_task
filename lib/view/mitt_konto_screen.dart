import 'package:flutter/material.dart';

class MittKontoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text("Mitt Konto")),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(16.0),
              child:  const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/images/profile_picture.jpg'),  ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Name', 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'myname@gmail.com', 
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '07XXXXXXXX', 
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                 
                ],
              ),
            ),
             const SizedBox(height: 30,),
              customRow(Icons.settings,'Kontoinstallningar'),const SizedBox(height: 10,),
              customRow(Icons.settings,'Mina betalmetoder'),const SizedBox(height: 10,),
              customRow(Icons.settings,'Support'),
          ],
        ),
      ),
    );
  }

  customRow(icon, name){
    return Row(children: [
            Icon(icon),
            Text(name),
    ],);
  }
}
