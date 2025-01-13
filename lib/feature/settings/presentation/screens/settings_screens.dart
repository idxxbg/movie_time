import 'package:film_time/feature/settings/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        centerTitle: true,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 28,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                spacing: 10,
                children: [
                  BlocBuilder<ThemeCubit, ThemeMode>(
                    builder: (context, state) {
                      final themeCubit = context.read<ThemeCubit>();
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Theme mode'),
                        trailing: CupertinoSlidingSegmentedControl(
                            groupValue: _themeMode(state),
                            children: const <int, Widget>{
                              0: Text('System'),
                              1: Text('Dark'),
                              2: Text('light'),
                            },
                            onValueChanged: (value) {
                              themeCubit.changeTheme(value!);
                            }),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  int _themeMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 0;
      case ThemeMode.dark:
        return 1;
      case ThemeMode.light:
        return 2;
    }
  }
}
