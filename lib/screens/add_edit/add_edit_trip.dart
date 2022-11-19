import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_job/screens/utils/extensions/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'bloc/add_edit_bloc.dart';

class AddEditTripScreen extends StatelessWidget {
  const AddEditTripScreen({super.key});

  static String get path => '/add_edit_trip';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddEditBloc()..add(const Started()),
      child: BlocBuilder<AddEditBloc, AddEditState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<AddEditBloc>(context);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: '${state.trip == null ? 'Add' : 'Edit'} Trip'
                  .bodyMedium(color: Colors.white),
              actions: [
                if (state.trip != null)
                  IconButton(
                    onPressed: () => bloc.add(const Delete()),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ).marginOnly(right: 10)
              ],
            ),
            body: SafeArea(
                child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Form(
                    key: bloc.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'Name'.bodyMediumRed(),
                        TextFormField(
                          controller: bloc.nameControl,
                          validator: (value) {
                            if (bloc.nameControl.text.isEmpty) {
                              return 'You have not entered name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Name of the Trip'),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        'Destination'.bodyMediumRed(),
                        TextFormField(
                          controller: bloc.destionationControl,
                          validator: (value) {
                            if (bloc.destionationControl.text.isEmpty) {
                              return 'You have not entered Destination';
                            }
                            return null;
                          },
                          decoration:
                              const InputDecoration(hintText: 'Destination'),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        'Date of the Trip'.bodyMediumRed(),
                        TextFormField(
                          readOnly: true,
                          onTap: () => bloc.add(const ChooseDate()),
                          validator: (value) {
                            if (state.date == null) {
                              return 'You have not entered Date of the Trip';
                            }
                            return null;
                          },
                          controller: TextEditingController(
                              text: state.date == null
                                  ? ''
                                  : DateFormat('dd/MM/yyyy')
                                      .format(state.date!)),
                          decoration:
                              const InputDecoration(hintText: 'dd/MM/yyyy'),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        'Require Risks Assessment'.bodyMediumRed(),
                        Row(
                          children: ['Yes', 'No']
                              .map((e) => Expanded(
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: e,
                                            groupValue: state.require,
                                            onChanged: (value) => bloc
                                                .add(ChooseRequire(value!))),
                                        e.bodyMedium(),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                        'Destination'.bodyMedium(),
                        TextFormField(
                          controller: bloc.desControl,
                          minLines: 4,
                          maxLines: 4,
                          decoration:
                              const InputDecoration(hintText: 'Destination'),
                        ),
                      ],
                    ),
                  ).paddingAll(10),
                )),
                TextButton(
                        onPressed: () {
                          if (bloc.formKey.currentState!.validate()) {
                            if (state.trip == null) {
                              bloc.add(const AddNew());
                            } else {
                              bloc.add(const Update());
                            }
                          }
                        },
                        style: TextButton.styleFrom(
                            minimumSize: Size(double.infinity, 50.sp),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            backgroundColor: Colors.blue),
                        child:
                            'Add To Database'.bodyMedium(color: Colors.white))
                    .marginAll(10)
              ],
            )),
          );
        },
      ),
    );
  }
}
