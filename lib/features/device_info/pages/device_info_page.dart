import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sensor/core/widgets/menu/nav_drawer.dart';
import 'package:flutter_sensor/features/device_info/bloc/device_info_bloc.dart';

class DeviceInfoPage extends StatelessWidget {
  const DeviceInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeviceInfoBloc()..add(FetchDeviceInfo()),
      child: Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          title: const Text("Device Info"),
        ),
        body: BlocBuilder<DeviceInfoBloc, DeviceInfoState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                CardInfoWidget(
                  text:
                      "Manufacturer : ${state.androidDeviceInfo?.manufacturer}",
                ),
                CardInfoWidget(
                  text: "Model : ${state.androidDeviceInfo?.model}",
                ),
                CardInfoWidget(
                  text:
                      "SdkVersion : ${state.androidDeviceInfo?.version.sdkInt}",
                ),
                CardInfoWidget(
                  text:
                      "VersionCode : ${state.androidDeviceInfo?.version.codename}",
                ),
                CardInfoWidget(
                  text:
                      "BuildNumber : ${state.androidDeviceInfo?.version.release}",
                ),
                CardInfoWidget(
                  text:
                      "Security Patch : ${state.androidDeviceInfo?.version.securityPatch}",
                ),
                CardInfoWidget(
                  text: "Brand : ${state.androidDeviceInfo?.brand}",
                ),
                CardInfoWidget(
                  text: "Display : ${state.androidDeviceInfo?.display}",
                ),
                CardInfoWidget(
                  text: "Board : ${state.androidDeviceInfo?.board}",
                ),
                CardInfoWidget(
                  text: "Hardware : ${state.androidDeviceInfo?.hardware}",
                ),
                CardInfoWidget(
                  text: "Product : ${state.androidDeviceInfo?.product}",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CardInfoWidget extends StatelessWidget {
  final String text;
  const CardInfoWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
