import 'package:big_winner_yay/core/data/repositories/shared_preferences_repository.dart';
import 'package:big_winner_yay/ui/shared/colors.dart';
import 'package:big_winner_yay/ui/views/main_view/main_view.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
    this.drawerBackgroundColor,
    required this.drawerWidth,
    this.drawerheight,
  });
  final double? drawerWidth;
  final double? drawerheight;
  final Color? drawerBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: drawerheight,
      width: drawerWidth,
      color: drawerBackgroundColor ?? AppColors.mainWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                // SharedPreferencesRepository.clearTokenInfo();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainView();
                    },
                  ),
                );
              },
              icon: Icon(Icons.logout),
            ),
            Text('Options 1'),
            Text('Options 2'),
          ],
        ),
      ),
    );
  }
}
