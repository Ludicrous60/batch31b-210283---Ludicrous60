

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard_View extends StatefulWidget {
  const Dashboard_View({super.key});

  @override
  State<Dashboard_View> createState() => _Dashboard_ViewState();
}

class _Dashboard_ViewState extends State<Dashboard_View> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Welcome to', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white
                  )),
                  subtitle: Text('Helmet Store', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white54
                  )),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user.JPG'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('Tank Helmet','https://techlekh.com/wp-content/uploads/2022/12/Tank-Knight-X-Pro.png', null, Colors.deepOrange),
                  itemDashboard('Axor', 'https://onlinesubidha.com/public/uploads/all/NflW4Q3IfZMoBOuivxnaLmuKo7AMI1CPWN5O2dbU.png', null, Colors.green),
                  itemDashboard('LS 2', 'https://img.freepik.com/free-psd/detailed-fullface-motorbike-helmet-isolated-transparent-background_191095-18148.jpg', null, Colors.purple),
                  itemDashboard('AGV', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-IJEyAILZw1XEgeStW9eC2fyADUTc2JY0BA&usqp=CAU', null, Colors.brown),
                  itemDashboard('Bell', 'https://pngfre.com/wp-content/uploads/Helmet-9-1024x893.png', null, Colors.indigo),
                  itemDashboard('HJC', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQEKfqplbGG4_Fwj65VNdxL2ALtNRIAe1WGA&usqp=CAU', null, Colors.teal),
                  itemDashboard('Schuberth', 'https://img.freepik.com/free-psd/detailed-fullface-motorbike-helmet-isolated-transparent-background_191095-18144.jpg', null, Colors.blue),
                  itemDashboard('Shark', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnw1ipv_kKAZjz65cIt16GFbGA7fAe-9DTYQ&usqp=CAU', null, Colors.pinkAccent),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  itemDashboard(String title, String imageUrl, iconData, Color background) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 5),
          color: Theme.of(context).primaryColor.withOpacity(.2),
          spreadRadius: 2,
          blurRadius: 5
        )
      ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        const SizedBox(height: 8),
        Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleMedium),

      ],
    ),
  );
}