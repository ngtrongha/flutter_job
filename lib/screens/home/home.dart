import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_job/screens/add_edit/add_edit_trip.dart';
import 'package:flutter_job/screens/utils/extensions/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String get path => '/home';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(const Started()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<HomeBloc>(context);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: 'All Trips'.bodyMedium(color: Colors.white),
              actions: [
                if (state.trips.isNotEmpty)
                  IconButton(
                    onPressed: () => bloc.add(const DeleteAll()),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ).marginOnly(right: 10)
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Get.toNamed(AddEditTripScreen.path);
                bloc.add(const Started());
              },
              backgroundColor: Colors.red.shade800,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
            body: SafeArea(
              child: state.trips.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: state.trips
                            .map((e) => InkWell(
                                  onTap: () async {
                                    await Get.toNamed(AddEditTripScreen.path,
                                        arguments: e);
                                    bloc.add(const Started());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.flight_takeoff,
                                          size: 25.sp,
                                          color: Colors.black,
                                        ).marginOnly(right: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              e.name.bodyMedium(),
                                              SizedBox(
                                                height: 10.sp,
                                              ),
                                              e.destionation.bodyMedium(),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              DateFormat('MMM dd, yyyy')
                                                  .format(
                                                      e.date ?? DateTime.now())
                                                  .bodyMedium(),
                                              SizedBox(
                                                height: 10.sp,
                                              ),
                                              'Require Assessment: ${e.require}'
                                                  .bodyMedium(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ).paddingAll(10),
                    )
                  : Container(
                      alignment: Alignment.center,
                      child: 'No trips yet'.bodyLarge(),
                    ),
            ),
          );
        },
      ),
    );
  }
}
