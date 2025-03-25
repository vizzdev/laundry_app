import 'package:flutter/material.dart';

import '../Widgets/background.dart';
import '../Widgets/notification_card.dart';
import '../Widgets/screen_background.dart';

class Notifications extends StatefulWidget {
  final bool showLeftIcon;
  const Notifications({super.key, this.showLeftIcon = false});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Background(
        body: ScreenBackground(
          showLeftIcon: widget.showLeftIcon,
      text: "Updates",
      child: Column(
        children: [
      SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 50, bottom: 70),
              itemCount: 8,
              itemBuilder: (context, index) {
                return UpdatesCard(
                  
                );
              }
            ),
          ),
    
        
        ],
      ),
    ));
  }
}