import 'package:ai_project/helper/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


  PreferredSizeWidget customAppBar(BuildContext context, title) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(

      title:  Text(
        title,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w500),
      ),

      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
              themeProvider.changeTheme();
          },
          icon: const Icon(Icons.brightness_6, color: Colors.blueGrey),
        ),
      ],
      // elevation: 1,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.12),
    );
  }

