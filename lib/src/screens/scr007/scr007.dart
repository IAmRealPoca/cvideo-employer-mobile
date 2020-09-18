/*
 * File: scr007.dart
 * Project: CVideo
 * File Created: Saturday, 18th July 2020 2:30:38 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Saturday, 18th July 2020 2:30:41 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/repositories/post_repository/post_repository.dart';
import 'package:cvideo_employer_mobile/src/screens/scr007/create_button.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SCR007 extends StatefulWidget {
  const SCR007({
    Key key,
  }) : super(key: key);
  @override
  _SCR007State createState() => _SCR007State();
}

class _SCR007State extends State<SCR007> {
  DateTime selectedData;
  final double _spaceBetweenTitle = 20.0;
  final double _spaceBetweenTextFormField = 15.0;
  bool _validatePostTitle = false;
  bool _validateLocation = false;
  bool _validateExpected = false;
  bool _validateMinSalary = false;
  bool _validateMaxSalary = false;
  bool _validateJobDes = false;
  bool _validateJobReq = false;
  bool _validateJobBen = false;
  bool _check = false;
  bool _checkMajor = false;
  int dropdownValue;
  List<DropdownMenuItem<int>> _dropdownMenuItem = List();
  RecruitmentPostInfor recruitmentPostInfor = RecruitmentPostInfor();

  @override
  Widget build(BuildContext context) {
    final SCR007Arguments args = ModalRoute.of(context).settings.arguments;
    String lang = AppLocalizations.of(context).locale.languageCode;

    /// Set screen rotation to only vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// Get the [size] of the screen
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) {
        return MajorListBloc(postRepository: PostRepository())
          ..add(MajorListRequest(lang: lang));
      },
      child:
          BlocBuilder<MajorListBloc, MajorListState>(builder: (context, state) {
        if (state is MajorListFetchedSuccess) {
          if (!_checkMajor) {
            recruitmentPostInfor.title = "";
            recruitmentPostInfor.location = "";
            recruitmentPostInfor.expectedNumber = 0;
            recruitmentPostInfor.dueDate = DateFormat("yyyy-MM-dd")
                .parse(DateFormat("yyyy-MM-dd").format(DateTime.now()));
            recruitmentPostInfor.minSalary = 0;
            recruitmentPostInfor.maxSalary = 0;
            recruitmentPostInfor.jobDescription = "";
            recruitmentPostInfor.jobRequirement = "";
            recruitmentPostInfor.jobBenefit = "";
            recruitmentPostInfor.majorId = 0;
            dropdownValue = dropdownValue ?? state.listMajor[0].majorId;
            for (Major major in state.listMajor) {
              _dropdownMenuItem.add(DropdownMenuItem<int>(
                value: major.majorId,
                child: Text(major.majorName),
              ));
              _checkMajor = true;
            }
          }
          return Scaffold(
            resizeToAvoidBottomInset: true,
            resizeToAvoidBottomPadding: false,
            body: SafeArea(
                top: false,
                bottom: false,
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    reverse: false,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 48),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          //show for update recruitment title
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate("scr006.postTitle"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDarkColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _spaceBetweenTextFormField,
                          ),
                          TextField(
                            decoration: new InputDecoration(
                                errorText: _validatePostTitle
                                    ? AppLocalizations.of(context)
                                        .translate("scr006.errPostTitle")
                                    : null,
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(20),
                                  ),
                                ),
                                hintText: AppLocalizations.of(context)
                                    .translate("scr006.labelTitle"),
                                labelText: AppLocalizations.of(context)
                                    .translate("scr006.title"),
                                prefixIcon: Icon(
                                  Icons.title,
                                  color: AppColors.primaryDarkColor,
                                )),
                            controller: new TextEditingController.fromValue(
                                new TextEditingValue(
                                    text: recruitmentPostInfor.title,
                                    selection: new TextSelection.collapsed(
                                        offset: recruitmentPostInfor
                                            .title.length))),
                            //validation
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _validatePostTitle = true;
                              }
                              if (value.isNotEmpty) {
                                _validatePostTitle = false;
                                recruitmentPostInfor.title = value;
                              }
                            },
                          ),
                          SizedBox(
                            height: _spaceBetweenTitle,
                          ),
                          //show for update recruitment location
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate("scr005.location"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDarkColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _spaceBetweenTextFormField,
                          ),
                          TextField(
                            controller: new TextEditingController.fromValue(
                                new TextEditingValue(
                                    text: recruitmentPostInfor.location,
                                    selection: new TextSelection.collapsed(
                                        offset: recruitmentPostInfor
                                            .location.length))),
                            decoration: new InputDecoration(
                                errorText: _validateLocation
                                    ? AppLocalizations.of(context)
                                        .translate("scr006.errorLocation")
                                    : null,
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(20),
                                  ),
                                ),
                                hintText: AppLocalizations.of(context)
                                    .translate("scr006.labelLocation"),
                                labelText: AppLocalizations.of(context)
                                    .translate("scr005.location"),
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  color: AppColors.primaryDarkColor,
                                )),
                            maxLines: null,
                            //validation
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _validateLocation = true;
                              }
                              if (value.isNotEmpty) {
                                _validateLocation = false;
                                recruitmentPostInfor.location = value;
                              }
                            },
                          ),
                          SizedBox(
                            height: _spaceBetweenTitle,
                          ),
                          //show recruitment post expected number
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate("scr005.expected"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDarkColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _spaceBetweenTextFormField,
                          ),
                          TextField(
                            controller: new TextEditingController.fromValue(
                                new TextEditingValue(
                                    text: recruitmentPostInfor.expectedNumber
                                        .toString(),
                                    selection: new TextSelection.collapsed(
                                        offset: recruitmentPostInfor
                                            .expectedNumber
                                            .toString()
                                            .length))),
                            decoration: InputDecoration(
                                errorText: _validateExpected
                                    ? AppLocalizations.of(context)
                                        .translate("scr006.errorExpected")
                                    : null,
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(20))),
                                hintText: AppLocalizations.of(context)
                                    .translate("scr006.labelExpected"),
                                labelText: AppLocalizations.of(context)
                                    .translate("scr005.expected"),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: AppColors.primaryDarkColor,
                                )),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if (value.length == 0) {
                                _validateExpected = true;
                              } else {
                                if (int.parse(value) == 0) {
                                  _validateExpected = true;
                                }
                                if (int.parse(value) > 0) {
                                  _validateExpected = false;
                                  recruitmentPostInfor.expectedNumber =
                                      int.parse(value);
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: _spaceBetweenTitle,
                          ),

                          //show recritment's due date
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate("scr005.dueDate"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDarkColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _spaceBetweenTextFormField,
                          ),
                          DateField(
                            onDateSelected: (DateTime value) {
                              setState(() {
                                recruitmentPostInfor.dueDate = value;
                                selectedData = value;
                              });
                            },
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(20),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: AppColors.primaryDarkColor,
                                )),
                            label: AppLocalizations.of(context)
                                .translate("scr005.dueDate"),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2022, 3, 20),
                            dateFormat: DateFormat("yyyy-MM-dd"),
                            selectedDate:
                                recruitmentPostInfor.dueDate ?? DateTime.now(),
                          ),
                          SizedBox(
                            height: _spaceBetweenTitle,
                          ),

                          //show range salary of recruitment post
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate("scr005.salary"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDarkColor),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate("scr006.concurrency"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDarkColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _spaceBetweenTextFormField,
                          ),
                          //show min salary
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: size.height * 0.05,
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate("scr006.min"),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryDarkColor),
                                ),
                              ),
                              Container(
                                width: size.width * 0.5,
                                child: TextField(
                                  controller:
                                      new TextEditingController.fromValue(
                                          new TextEditingValue(
                                              text: recruitmentPostInfor
                                                  .minSalary
                                                  .toString(),
                                              selection:
                                                  new TextSelection.collapsed(
                                                      offset:
                                                          recruitmentPostInfor
                                                              .minSalary
                                                              .toString()
                                                              .length))),
                                  decoration: InputDecoration(
                                      errorText: _validateMinSalary
                                          ? AppLocalizations.of(context)
                                              .translate("scr006.errorSalary")
                                          : null,
                                      border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(20))),
                                      hintText: AppLocalizations.of(context)
                                          .translate("scr006.labelSalary"),
                                      prefixIcon: Icon(
                                        Icons.attach_money,
                                        color: AppColors.primaryDarkColor,
                                      )),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly,
                                  ],
                                  onChanged: (value) {
                                    if (int.parse(value) <
                                        recruitmentPostInfor.maxSalary) {
                                      _validateMinSalary = false;
                                    }
                                    recruitmentPostInfor.minSalary =
                                        int.parse(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),

                          //show max salary
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: size.width * 0.1,
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate("scr006.max"),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryDarkColor),
                                ),
                              ),
                              Container(
                                width: size.width * 0.5,
                                child: TextField(
                                  controller:
                                      new TextEditingController.fromValue(
                                          new TextEditingValue(
                                              text: recruitmentPostInfor
                                                  .maxSalary
                                                  .toString(),
                                              selection:
                                                  new TextSelection.collapsed(
                                                      offset:
                                                          recruitmentPostInfor
                                                              .maxSalary
                                                              .toString()
                                                              .length))),
                                  decoration: InputDecoration(
                                      errorText: _validateMaxSalary
                                          ? AppLocalizations.of(context)
                                              .translate("scr006.errorSalary")
                                          : null,
                                      border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(20))),
                                      hintText: AppLocalizations.of(context)
                                          .translate("scr006.labelSalary"),
                                      prefixIcon: Icon(
                                        Icons.attach_money,
                                        color: AppColors.primaryDarkColor,
                                      )),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly,
                                  ],
                                  onChanged: (value) {
                                    if (recruitmentPostInfor.minSalary >
                                        int.parse(value)) {
                                      _validateMaxSalary = true;
                                    } else {
                                      _validateMaxSalary = false;
                                    }
                                    recruitmentPostInfor.maxSalary =
                                        int.parse(value);
                                  },
                                ),
                              )
                            ],
                          ),

                          SizedBox(
                            height: _spaceBetweenTitle,
                          ),
                          // //show list major
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate("scr005.major"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDarkColor),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: size.width * 0.40,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: DropdownButton<int>(
                                    items: _dropdownMenuItem,
                                    value: dropdownValue,
                                    isExpanded: true,
                                    elevation: 16,
                                    style: TextStyle(
                                        color: AppColors.primaryDarkColor),
                                    underline: Container(
                                      height: 2,
                                      color: AppColors.primaryDarkColor,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        dropdownValue = value;
                                        recruitmentPostInfor.majorId = value;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: _spaceBetweenTitle,
                          ),
                          //show recruitment post description
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate("scr005.jobDes"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDarkColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _spaceBetweenTextFormField,
                          ),
                          TextField(
                            controller: new TextEditingController.fromValue(
                                new TextEditingValue(
                                    text: recruitmentPostInfor.jobDescription,
                                    selection: new TextSelection.collapsed(
                                        offset: recruitmentPostInfor
                                            .jobDescription.length))),
                            decoration: new InputDecoration(
                              errorText: _validateJobDes
                                  ? AppLocalizations.of(context)
                                      .translate("scr006.errJobDes")
                                  : null,
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20),
                                ),
                              ),
                              hintText: AppLocalizations.of(context)
                                  .translate("scr006.labelJobDes"),
                              labelText: AppLocalizations.of(context)
                                  .translate("scr005.jobDes"),
                            ),
                            maxLines: null,
                            //validation
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _validateJobDes = true;
                              }
                              if (value.isNotEmpty) {
                                _validateJobDes = false;
                                recruitmentPostInfor.jobDescription = value;
                              }
                            },
                          ),
                          SizedBox(
                            height: _spaceBetweenTitle,
                          ),

                          //show recruitment post requirement
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate("scr005.jobReq"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDarkColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _spaceBetweenTextFormField,
                          ),
                          TextField(
                            controller: new TextEditingController.fromValue(
                                new TextEditingValue(
                                    text: recruitmentPostInfor.jobRequirement,
                                    selection: new TextSelection.collapsed(
                                        offset: recruitmentPostInfor
                                            .jobRequirement.length))),
                            decoration: new InputDecoration(
                              errorText: _validateJobReq
                                  ? AppLocalizations.of(context)
                                      .translate("scr006.errJobDes")
                                  : null,
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20),
                                ),
                              ),
                              hintText: AppLocalizations.of(context)
                                  .translate("scr006.labelJobReq"),
                              labelText: AppLocalizations.of(context)
                                  .translate("scr005.jobReq"),
                            ),
                            maxLines: null,
                            //validation
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _validateJobReq = true;
                              }
                              if (value.isNotEmpty) {
                                _validateJobReq = false;
                                recruitmentPostInfor.jobRequirement = value;
                              }
                            },
                          ),
                          SizedBox(
                            height: _spaceBetweenTitle,
                          ),

                          //show recruitment post benefits
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate("scr005.jobBen"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDarkColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _spaceBetweenTextFormField,
                          ),
                          TextField(
                            controller: new TextEditingController.fromValue(
                                new TextEditingValue(
                                    text: recruitmentPostInfor.jobBenefit,
                                    selection: new TextSelection.collapsed(
                                        offset: recruitmentPostInfor
                                            .jobBenefit.length))),
                            decoration: new InputDecoration(
                              errorText: _validateJobBen
                                  ? AppLocalizations.of(context)
                                      .translate("scr006.errJobDes")
                                  : null,
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20),
                                ),
                              ),
                              hintText: AppLocalizations.of(context)
                                  .translate("scr006.labelJobBen"),
                              labelText: AppLocalizations.of(context)
                                  .translate("scr005.jobBen"),
                            ),
                            maxLines: null,
                            //validation
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _validateJobBen = true;
                              }
                              if (value.isNotEmpty) {
                                _validateJobBen = false;
                                recruitmentPostInfor.jobBenefit = value;
                              }
                            },
                          ),
                          SizedBox(
                            height: _spaceBetweenTextFormField,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            bottomNavigationBar: BlocProvider(
              create: (context) {
                return RecruitmentPostCreateBloc(
                    postRepository: PostRepository());
              },
              child: BlocBuilder<RecruitmentPostCreateBloc,
                  RecruitmentPostCreateState>(builder: (context, state) {
                if (state is RecruitmentPostCreateInitial) {
                  return CreateButton(onPressed: () {
                    _check = checkLast(recruitmentPostInfor);
                    if (_check) {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      showAlertDialog(
                          context, recruitmentPostInfor, args.companyId);
                    } else {
                      showAlertInvalidDialog(context);
                    }
                  });
                }
                if (state is RecruitmentPostCreateProcessing) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation(AppColors.primaryDarkColor),
                      ),
                    ),
                  );
                }
                if (state is RecruitmentPostCreateSuccess) {
                  SchedulerBinding.instance.addPostFrameCallback((_) async {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.SCR003_SCREEN, (route) => false);
                  });
                }
                if (state is RecruitmentPostCreateFailure) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)
                              .translate("scr006.updateRecruitmentFail"),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: AppColors.primaryDarkColor),
                        ),
                      ),
                    ),
                  );
                }
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation(AppColors.primaryDarkColor),
                    ),
                  ),
                );
              }),
            ),
          );
        }
        if (state is MajorListFetchedFailure) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Text(
                AppLocalizations.of(context)
                    .translate("scr006.updateRecruitmentFail"),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: AppColors.primaryDarkColor),
              ),
            ),
          );
        }
        return Scaffold(
          body: Container(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.primaryDarkColor),
              ),
            ),
          ),
        );
      }),
    );
  }

  showAlertDialog(BuildContext context,
      RecruitmentPostInfor recruitmentPostInfor, int companyId) {
    // Create button
    Widget yesButton = FlatButton(
      child: Text(
        AppLocalizations.of(context).translate("scr006.yes"),
        style: TextStyle(color: AppColors.primaryDarkColor, fontSize: 20),
      ),
      onPressed: () {
        Navigator.pop(context);
        BlocProvider.of<RecruitmentPostCreateBloc>(context)
          ..add(RecruitmentPostCreateRequest(
              recruitmentPostInfo: recruitmentPostInfor, companyId: companyId));
      },
    );

    Widget noButton = FlatButton(
      child: Text(
        AppLocalizations.of(context).translate("scr006.no"),
        style: TextStyle(color: AppColors.primaryDarkColor, fontSize: 20),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // CHANGE BORDER RADIUS HERE
        side: BorderSide(width: 1),
      ),
      title: Text(AppLocalizations.of(context).translate("scr006.confirm")),
      content: Text(
        AppLocalizations.of(context).translate("scr007.confirmCreate"),
      ),
      actions: [noButton, yesButton],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //show dialog if something invalid with information
  showAlertInvalidDialog(BuildContext context) {
    // Create button

    Widget noButton = FlatButton(
      child: Text(
        AppLocalizations.of(context).translate("scr006.understood"),
        style: TextStyle(color: AppColors.primaryDarkColor, fontSize: 20),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // CHANGE BORDER RADIUS HERE
        side: BorderSide(width: 1),
      ),
      title: Text(AppLocalizations.of(context).translate("scr006.attention")),
      content: Text(
        AppLocalizations.of(context).translate("scr006.updateInvalidMsg"),
      ),
      actions: [noButton],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool checkLast(RecruitmentPostInfor recruitmentPostInfor) {
    if (recruitmentPostInfor.title.isEmpty) {
      return false;
    }
    if (recruitmentPostInfor.location.isEmpty) {
      return false;
    }
    if (recruitmentPostInfor.minSalary > recruitmentPostInfor.maxSalary) {
      return false;
    }
    if (recruitmentPostInfor.expectedNumber == 0) {
      return false;
    }
    if (recruitmentPostInfor.jobRequirement.isEmpty) {
      return false;
    }
    if (recruitmentPostInfor.jobDescription.isEmpty) {
      return false;
    }
    if (recruitmentPostInfor.jobBenefit.isEmpty) {
      return false;
    }

    return true;
  }
}

class SCR007Arguments {
  int companyId;
  SCR007Arguments({this.companyId});
}
