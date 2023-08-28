import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/core/helpers/page_routes.dart';
import 'package:flutter_sensor/features/crud_data/pages/list_page.dart';
import 'package:flutter_sensor/features/home/pages/home_page.dart';
import 'package:flutter_sensor/features/device_info/pages/device_info_page.dart';
import 'package:flutter_sensor/features/qr_generator/pages/qr_generator_page.dart';

import 'menu_cubit.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuCubit menuCubit = context.read<MenuCubit>();

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const ListTile(
                title: Text("Menu"),
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                leading: const Icon(Icons.home_filled),
                title: const Text("Home"),
                selected: menuCubit.state == 0,
                onTap: () {
                  menuCubit.setActiveMenu(0);

                  PageRoutes.pushReplacement(() => const HomePage());
                },
                selectedTileColor: Theme.of(context).colorScheme.onSecondary,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                leading: const Icon(Icons.phone_android_rounded),
                title: const Text("Device Info"),
                selected: menuCubit.state == 1,
                onTap: () {
                  menuCubit.setActiveMenu(1);
                  PageRoutes.pushReplacement(() => const DeviceInfoPage());
                },
                selectedTileColor: Theme.of(context).colorScheme.onSecondary,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                leading: const Icon(Icons.data_array_rounded),
                title: const Text("CRUD"),
                selected: menuCubit.state == 2,
                onTap: () {
                  menuCubit.setActiveMenu(2);
                  PageRoutes.pushReplacement(() => const ListPages());
                },
                selectedTileColor: Theme.of(context).colorScheme.onSecondary,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                leading: const Icon(Icons.qr_code),
                title: const Text("Qr Code Generator"),
                selected: menuCubit.state == 3,
                onTap: () {
                  menuCubit.setActiveMenu(3);
                  PageRoutes.pushReplacement(() => const QrGeneratorPage());
                },
                selectedTileColor: Theme.of(context).colorScheme.onSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
