/*
 * File: scr006.dart
 * Project: CVideo
 * File Created: Thursday, 16th July 2020 9:57:39 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Thursday, 16th July 2020 9:57:42 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:cvideo_employer_mobile/src/screens/scr006/update_button.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SCR006 extends StatefulWidget {
  @override
  _SCR006State createState() => _SCR006State();
}

class _SCR006State extends State<SCR006> {
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
    final SCR006Arguments args = ModalRoute.of(context).settings.arguments;

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
        return RecruitmentDetailBloc(postRepository: PostRepository())
          ..add(RecruitmentDetailRequest(args.postId, lang));
      },
      child: BlocBuilder<RecruitmentDetailBloc, RecruitmentDetailState>(
          builder: (context, state) {
        if (state is RecruitmentDetailFetchedSuccess) {
          if (!_checkMajor) {
            recruitmentPostInfor.postId = state.recruitmentDetailPost.postId;
            recruitmentPostInfor.title = state.recruitmentDetailPost.title;
            recruitmentPostInfor.location =
                state.recruitmentDetailPost.location;
            recruitmentPostInfor.expectedNumber =
                state.recruitmentDetailPost.expectedNumber;
            recruitmentPostInfor.dueDate = DateFormat("yyyy-MM-dd")
                .parse(state.recruitmentDetailPost.duteDate);
            recruitmentPostInfor.minSalary =
                state.recruitmentDetailPost.minSalary;
            recruitmentPostInfor.maxSalary =
                state.recruitmentDetailPost.maxSalary;
            recruitmentPostInfor.jobDescription =
                state.recruitmentDetailPost.jobDescription;
            recruitmentPostInfor.jobRequirement =
                state.recruitmentDetailPost.jobDescription;
            recruitmentPostInfor.jobBenefit =
                state.recruitmentDetailPost.jobBenefit;
            recruitmentPostInfor.majorId =
                state.recruitmentDetailPost.major.majorId;
            dropdownValue =
                dropdownValue ?? state.recruitmentDetailPost.major.majorId;
            for (Major major in state.listMajor) {
              _dropdownMenuItem.add(DropdownMenuItem<int>(
                value: major.majorId,
                child: Text(major.majorName),
              ));
            }
            _checkMajor = true;
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
                            controller: new TextEditingController.fromValue(
                                new TextEditingValue(
                                    text: state.recruitmentDetailPost.title,
                                    selection: new TextSelection.collapsed(
                                        offset: state.recruitmentDetailPost
                                            .title.length))),
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
                            autofocus: true,
                            //validation
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _validatePostTitle = true;
                              }
                              if (value.isNotEmpty) {
                                _validatePostTitle = false;
                                state.recruitmentDetailPost.title = value;
                                recruitmentPostInfor.title =
                                    state.recruitmentDetailPost.title;
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
                                    text: state.recruitmentDetailPost.location,
                                    selection: new TextSelection.collapsed(
                                        offset: state.recruitmentDetailPost
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
                            autofocus: true,
                            maxLines: null,
                            //validation
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _validateLocation = true;
                              }
                              if (value.isNotEmpty) {
                                _validateLocation = false;
                                state.recruitmentDetailPost.location = value;
                                recruitmentPostInfor.location =
                                    state.recruitmentDetailPost.location;
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
                            autofocus: true,
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
                            controller: new TextEditingController.fromValue(
                                new TextEditingValue(
                                    text: state
                                        .recruitmentDetailPost.expectedNumber
                                        .toString(),
                                    selection: new TextSelection.collapsed(
                                        offset: state.recruitmentDetailPost
                                            .expectedNumber
                                            .toString()
                                            .length))),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if (int.parse(value) <= 0) {
                                _validateExpected = true;
                              }
                              if (int.parse(value) > 0) {
                                _validateExpected = false;
                              }
                              state.recruitmentDetailPost.expectedNumber =
                                  int.parse(value);
                              recruitmentPostInfor.expectedNumber =
                                  state.recruitmentDetailPost.expectedNumber;
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
                                state.recruitmentDetailPost.duteDate =
                                    DateFormat("yyyy-MM-dd").format(value);
                                recruitmentPostInfor.dueDate =
                                    DateFormat("yyyy-MM-dd").parse(
                                        state.recruitmentDetailPost.duteDate);
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
                            selectedDate: DateFormat("yyyy-MM-dd")
                                .parse(state.recruitmentDetailPost.duteDate),
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
                                  autofocus: true,
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
                                  controller:
                                      new TextEditingController.fromValue(
                                          new TextEditingValue(
                                              text:
                                                  state.recruitmentDetailPost
                                                      .minSalary
                                                      .toString(),
                                              selection:
                                                  new TextSelection.collapsed(
                                                      offset: state
                                                          .recruitmentDetailPost
                                                          .minSalary
                                                          .toString()
                                                          .length))),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly,
                                  ],
                                  onChanged: (value) {
                                    if (int.parse(value) <
                                        state.recruitmentDetailPost.maxSalary) {
                                      _validateMinSalary = false;
                                    }
                                    state.recruitmentDetailPost.minSalary =
                                        int.parse(value);
                                    recruitmentPostInfor.minSalary =
                                        state.recruitmentDetailPost.minSalary;
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
                                  autofocus: true,
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
                                  controller:
                                      new TextEditingController.fromValue(
                                          new TextEditingValue(
                                              text:
                                                  state.recruitmentDetailPost
                                                      .maxSalary
                                                      .toString(),
                                              selection:
                                                  new TextSelection.collapsed(
                                                      offset: state
                                                          .recruitmentDetailPost
                                                          .maxSalary
                                                          .toString()
                                                          .length))),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly,
                                  ],
                                  onChanged: (value) {
                                    if ((state.recruitmentDetailPost.minSalary >
                                        int.parse(value))) {
                                      _validateMaxSalary = true;
                                    } else {
                                      _validateMaxSalary = false;
                                    }
                                    state.recruitmentDetailPost.maxSalary =
                                        int.parse(value);
                                    recruitmentPostInfor.maxSalary =
                                        state.recruitmentDetailPost.maxSalary;
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
                            autofocus: true,
                            controller: new TextEditingController.fromValue(
                                new TextEditingValue(
                                    text: state
                                        .recruitmentDetailPost.jobDescription,
                                    selection: new TextSelection.collapsed(
                                        offset: state.recruitmentDetailPost
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
                                state.recruitmentDetailPost.jobDescription =
                                    value;
                                recruitmentPostInfor.jobDescription =
                                    state.recruitmentDetailPost.jobDescription;
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
                            autofocus: true,
                            controller: new TextEditingController.fromValue(
                                new TextEditingValue(
                                    text: state
                                        .recruitmentDetailPost.jobRequirement,
                                    selection: new TextSelection.collapsed(
                                        offset: state.recruitmentDetailPost
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
                                state.recruitmentDetailPost.jobRequirement =
                                    value;
                                recruitmentPostInfor.jobRequirement =
                                    state.recruitmentDetailPost.jobRequirement;
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
                            autofocus: true,
                            controller: new TextEditingController.fromValue(
                                new TextEditingValue(
                                    text:
                                        state.recruitmentDetailPost.jobBenefit,
                                    selection: new TextSelection.collapsed(
                                        offset: state.recruitmentDetailPost
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
                                state.recruitmentDetailPost.jobBenefit = value;
                                recruitmentPostInfor.jobBenefit =
                                    state.recruitmentDetailPost.jobBenefit;
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
                return RecruitmentPostUpdateBloc(
                    postRepository: PostRepository());
              },
              child: BlocBuilder<RecruitmentPostUpdateBloc,
                  RecruitmentPostUpdateState>(builder: (context, state) {
                if (state is RecruitmentPostUpdateInitial) {
                  return UpdateButton(onPressed: () {
                    _check = checkLast(recruitmentPostInfor);
                    if (_check) {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      showAlertDialog(context, recruitmentPostInfor,
                          recruitmentPostInfor.postId);
                    } else {
                      showAlertInvalidDialog(context);
                    }
                  });
                }
                if (state is RecruitmentPostUpdateProcessing) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation(AppColors.primaryDarkColor),
                      ),
                    ),
                  );
                }
                if (state is RecruitmentPostUpdateSuccess) {
                  SchedulerBinding.instance.addPostFrameCallback((_) async {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.SCR003_SCREEN, (route) => false);
                  });
                }
                if (state is RecruitmentPostUpdateFailure) {
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
      RecruitmentPostInfor recruitmentPostInfor, int postId) {
    // Create button
    Widget yesButton = FlatButton(
      child: Text(
        AppLocalizations.of(context).translate("scr006.yes"),
        style: TextStyle(color: AppColors.primaryDarkColor, fontSize: 20),
      ),
      onPressed: () {
        Navigator.pop(context);
        BlocProvider.of<RecruitmentPostUpdateBloc>(context)
          ..add(RecruitmentPostUpdateRequest(
              postId: postId, recruitmentPostInfo: recruitmentPostInfor));
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
        AppLocalizations.of(context).translate("scr006.confirmUpdate"),
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
    if (recruitmentPostInfor.expectedNumber == 0) {
      return false;
    }
    if (recruitmentPostInfor.minSalary > recruitmentPostInfor.maxSalary) {
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

class SCR006Arguments {
  int postId;
  SCR006Arguments({this.postId});
}
