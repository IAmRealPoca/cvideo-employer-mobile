/*
 * File: scr005.dart
 * Project: CVideo
 * File Created: Thursday, 16th July 2020 4:05:34 pm
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Thursday, 16th July 2020 8:41:26 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'dart:async';

import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';
import 'package:cvideo_employer_mobile/src/screens/scr005/post_section_detail.dart';
import 'package:cvideo_employer_mobile/src/screens/scr005/round_update_button.dart';
import 'package:cvideo_employer_mobile/src/screens/scr006/scr006.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class SCR005 extends StatelessWidget {
  static const double _widthIcon = 15.0;
  static const double _sizeText = 15.0;
  static const double _spaceBetweenTextAndIcon = 8.0;
  static const double _spaceBetweenRows = 6.0;

  Completer<void> _refreshCompleter;

  void initState() {
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    String lang = AppLocalizations.of(context).locale.languageCode;

    /// Set screen rotation to only vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// Get the [size] of the screen
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: BlocProvider(
      create: (context) {
        return RecruitmentDetailBloc(postRepository: PostRepository())
          ..add(RecruitmentDetailRequest(args.postId, lang));
      },
      child: BlocBuilder<RecruitmentDetailBloc, RecruitmentDetailState>(
          builder: (context, state) {
        if (state is RecruitmentDetailFetchedFailure) {
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
        if (state is RecruitmentDetailFetchedSuccess) {
          _refreshCompleter?.complete();
          _refreshCompleter = Completer();
          return RefreshIndicator(
              child: Container(
                width: size.width,
                height: size.height,
                child: Stack(
                  children: <Widget>[
                    //show background inmage
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        height: size.height * 0.35,
                        width: size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/screens/scr005/background.png",
                                ),
                                fit: BoxFit.fill)),
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: size.height * 0.9,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35.0),
                                      topRight: Radius.circular(35.0)),
                                  color: Colors.white,
                                ),
                                height: size.height * 0.82,
                                width: size.width,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 70.0,
                                    ),

                                    //show recruitment post title
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 1),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Expanded(
                                            child: Center(
                                              child: Tooltip(
                                                message: state
                                                    .recruitmentDetailPost
                                                    .title,
                                                decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0))),
                                                child: Text(
                                                  state.recruitmentDetailPost
                                                      .title,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors
                                                        .primaryDarkColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //show recruitment company name
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          state.recruitmentDetailPost.company
                                              .companyName,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  AppColors.primaryDarkColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    //show information recruitment post (location, salary, due date, number, skills)
                                    Container(
                                      color: AppColors.primaryColor,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, bottom: 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            SizedBox(height: _spaceBetweenRows),
                                            Row(
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                    "assets/screens/scr005/ic_location.svg",
                                                    width: 12,
                                                    color: Colors.white),
                                                SizedBox(
                                                  width:
                                                      _spaceBetweenTextAndIcon +
                                                          1,
                                                ),
                                                Expanded(
                                                  child: Tooltip(
                                                    message: state
                                                        .recruitmentDetailPost
                                                        .location,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                    child: Text(
                                                      AppLocalizations.of(
                                                                  context)
                                                              .translate(
                                                                  "scr005.location") +
                                                          state
                                                              .recruitmentDetailPost
                                                              .location,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: _sizeText,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: _spaceBetweenRows),
                                            Row(
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                    "assets/screens/scr005/ic_money.svg",
                                                    width: _widthIcon,
                                                    color: Colors.white),
                                                SizedBox(
                                                  width:
                                                      _spaceBetweenTextAndIcon,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                            .translate(
                                                                "scr005.salary") +
                                                        (((state.recruitmentDetailPost
                                                                        .maxSalary ==
                                                                    0) &&
                                                                (state
                                                                        .recruitmentDetailPost
                                                                        .maxSalary ==
                                                                    0))
                                                            ? AppLocalizations.of(context)
                                                                .translate(
                                                                    "scr005.negotiation")
                                                            : (state.recruitmentDetailPost
                                                                        .minSalary
                                                                        .toString() +
                                                                    " - " +
                                                                    state
                                                                        .recruitmentDetailPost
                                                                        .maxSalary
                                                                        .toString()) +
                                                                " " +
                                                                AppLocalizations.of(
                                                                        context)
                                                                    .translate("scr006.concurrency")),
                                                    style: TextStyle(
                                                        fontSize: _sizeText,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: _spaceBetweenRows),
                                            Row(
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                    "assets/screens/scr005/ic_clock.svg",
                                                    width: _widthIcon,
                                                    color: Colors.white),
                                                SizedBox(
                                                  width:
                                                      _spaceBetweenTextAndIcon,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                            .translate(
                                                                "scr005.dueDate") +
                                                        (DateFormat(
                                                                "yyyy-MM-dd")
                                                            .format(DateFormat(
                                                                    "yyyy-MM-dd")
                                                                .parse(state
                                                                    .recruitmentDetailPost
                                                                    .duteDate))),
                                                    style: TextStyle(
                                                        fontSize: _sizeText,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: _spaceBetweenRows),
                                            Row(
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                    "assets/screens/scr005/ic_skills.svg",
                                                    width: _widthIcon,
                                                    color: Colors.white),
                                                SizedBox(
                                                  width:
                                                      _spaceBetweenTextAndIcon,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                            .translate(
                                                                "scr005.skills") +
                                                        state
                                                            .recruitmentDetailPost
                                                            .skills
                                                            .skillsName,
                                                    style: TextStyle(
                                                        fontSize: _sizeText,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: _spaceBetweenRows),
                                            Row(
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                    "assets/screens/scr005/ic_expected.svg",
                                                    width: _widthIcon,
                                                    color: Colors.white),
                                                SizedBox(
                                                  width:
                                                      _spaceBetweenTextAndIcon,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                            .translate(
                                                                "scr005.expected") +
                                                        state
                                                            .recruitmentDetailPost
                                                            .expectedNumber
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: _sizeText,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    //show detail post
                                    Expanded(
                                      child: Container(
                                        width: size.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              children: <Widget>[
                                                PostDectionDetail(
                                                    sectionTitle:
                                                        AppLocalizations.of(
                                                                context)
                                                            .translate(
                                                                "scr005.jobDes"),
                                                    sectionDetail: state
                                                        .recruitmentDetailPost
                                                        .jobDescription),
                                                PostDectionDetail(
                                                    sectionTitle:
                                                        AppLocalizations.of(
                                                                context)
                                                            .translate(
                                                                "scr005.jobReq"),
                                                    sectionDetail: state
                                                        .recruitmentDetailPost
                                                        .jobRequirement),
                                                PostDectionDetail(
                                                    sectionTitle:
                                                        AppLocalizations.of(
                                                                context)
                                                            .translate(
                                                                "scr005.jobBen"),
                                                    sectionDetail: state
                                                        .recruitmentDetailPost
                                                        .jobBenefit),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  height: 70,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: (size.width / 2) - 58,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: state.recruitmentDetailPost.company
                                              .img.isNotEmpty
                                          ? NetworkImage(state
                                              .recruitmentDetailPost
                                              .company
                                              .img)
                                          : AssetImage(
                                              "assets/screens/scr005/user.png"),
                                      fit: BoxFit.cover),
                                ),
                                height: 120,
                                width: 120,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //show button update
                    Positioned(
                      top: size.height * 0.92,
                      left: (size.width / 2) - 70,
                      child: Container(child: RoundUpdateButton(
                        onPressed: () {
                          SchedulerBinding.instance
                              .addPostFrameCallback((_) async {
                            Navigator.of(context).pushNamed(
                                AppRoutes.SCR006_SCREEN,
                                arguments: SCR006Arguments(
                                    postId:
                                        state.recruitmentDetailPost.postId));
                          });
                        },
                      )),
                    )
                  ],
                ),
              ),
              onRefresh: () {
                BlocProvider.of<RecruitmentDetailBloc>(context)
                    .add(RecruitmentDetailRequest(args.postId, lang));
                return _refreshCompleter.future;
              });
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.primaryDarkColor),
            ),
          ),
        );
      }),
    ));
  }
}

class ScreenArguments {
  int postId;
  ScreenArguments({this.postId});
}
