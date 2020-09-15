import 'package:cvideo_employer_mobile/src/app_components/app_colors.dart';
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/screens/scr004/ui/sizes_helpers.dart';
import 'package:cvideo_employer_mobile/src/screens/scr005/scr005.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'cv_apply_new.dart';

class Header extends StatefulWidget {
  final RecruitmentApplyCV recruitment;
  final TabController tabController;
  final List<Application> listApplied;

  const Header(
      {Key key, this.recruitment, this.tabController, this.listApplied})
      : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    var datetime = DateFormat("dd-MM-yyyy hh:mm:ss")
        .format(DateTime.parse(widget.recruitment.dueDate));
    DateFormat format = new DateFormat("dd-MM-yyyy hh:mm:ss");
    DateTime time = format.parse(datetime);
    var days = time.day.toString();
    var day = days;
    if (days.length < 2) {
      day = "0" + days;
    }
    var months = time.month.toString();
    var month = months;
    if (months.length < 2) {
      month = "0" + months;
    }
    var year = time.year;
    var hours = (time.hour + 7).toString();
    var hour = hours;
    if (hours.length < 2) {
      hour = "0" + hours;
    }
    var minue = time.minute.toString();
    var minues = minue;
    if (minue.length < 2) {
      minues = "0" + minue;
    }
    var seconds = time.second.toString();
    var second = seconds;
    if (seconds.length < 2) {
      second = "0" + seconds;
    }
    List<Application> listSeen = [];
    List<Application> listNoSeen = [];
    for (var item in widget.listApplied) {
      if (item.status == true) {
        listSeen.add(item);
      } else {
        listNoSeen.add(item);
      }
    }
    if (listSeen.isEmpty) listSeen = listNoSeen;
    return Container(
      // margin: EdgeInsets.only(top: 24),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            color: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Container(
                width: displayWidth(context),
                height: displayHeight(context) * 0.24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //job title
                    Container(
                      alignment: Alignment.centerLeft,
                      height: displayHeight(context) * 0.05,
                      width: displayWidth(context),
                      child: Tooltip(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        message: widget.recruitment.title,
                        child: Text(
                          widget.recruitment.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    //attribute
                    //due date
                    Container(
                        color: AppColors.primaryColor,
                        width: displayWidth(context),
                        height: displayHeight(context) * 0.04,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: SvgPicture.asset(
                                'assets/screens/scr004/clock.svg',
                                width: displayWidth(context) * 0.035,
                                color: AppColors.secondaryTextColor,
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              AppLocalizations.of(context)
                                      .translate("scr004.dueDate") +
                                  day.toString() +
                                  "/" +
                                  month.toString() +
                                  "/" +
                                  year.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )),
                    //location
                    Container(
                        width: displayWidth(context),
                        height: displayHeight(context) * 0.04,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: SvgPicture.asset(
                                'assets/screens/scr004/location.svg',
                                width: displayWidth(context) * 0.03,
                                color: AppColors.secondaryTextColor,
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Tooltip(
                                message: widget.recruitment.location,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Text(
                                  AppLocalizations.of(context)
                                          .translate("scr004.location") +
                                      widget.recruitment.location,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        )),
                    //salary
                    Container(
                        width: displayWidth(context),
                        height: displayHeight(context) * 0.04,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: SvgPicture.asset(
                                'assets/screens/scr004/price.svg',
                                width: displayWidth(context) * 0.035,
                                color: AppColors.secondaryTextColor,
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              AppLocalizations.of(context)
                                      .translate("scr004.salary") +
                                  widget.recruitment.minSalary.toString() +
                                  "\u0024 - " +
                                  widget.recruitment.maxSalary.toString() +
                                  "\u0024",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        )),
                    //expected
                    Container(
                        width: displayWidth(context),
                        height: displayHeight(context) * 0.04,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: SvgPicture.asset(
                                      'assets/screens/scr004/team.svg',
                                      width: displayWidth(context) * 0.035,
                                      color: AppColors.secondaryTextColor,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)
                                            .translate("scr004.expected") +
                                        widget.recruitment.expectedNumber
                                            .toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // showConfirm(context, selectedDate);
                                Navigator.of(context).pushNamed(
                                    AppRoutes.SCR005_SCREEN,
                                    arguments: ScreenArguments(
                                        postId: widget.recruitment.postId));
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  'assets/screens/scr004/edit.svg',
                                  width: displayWidth(context) * 0.04,
                                  color: AppColors.secondaryTextColor,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
          //tab bar
          Container(
            color: AppColors.primaryDarkColor,
            child: TabBar(
                controller: widget.tabController,
                labelColor: AppColors.secondaryTextColor,
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 2.0, color: AppColors.primaryLightColor),
                  ),
                ),
                tabs: [
                  Tab(
                    text: AppLocalizations.of(context)
                        .translate("scr004.tabbarNewCV"),
                  ),
                  Tab(
                    text: AppLocalizations.of(context)
                        .translate("scr004.tabbarTotalCV"),
                  ),
                ]),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: widget.tabController,
                children: <Widget>[
                  Container(
                    child: ApplyNew(
                      listApplied: listNoSeen,
                      message: AppLocalizations.of(context)
                          .translate("scr004.ErrorNoCVNew"),
                    ),
                  ),
                  Container(
                    child: ApplyNew(
                      listApplied: listSeen,
                      message: AppLocalizations.of(context)
                          .translate("scr004.ErrorNoCV"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showConfirm(BuildContext context, DateTime selectedDate) {
    //true is empty
    //false is not empty
    bool _validateName = true;
    TextEditingController _controllerName = TextEditingController();
    bool _validateDate = true;
    TextEditingController _controllerDate = TextEditingController();
    bool _validateLocation = true;
    TextEditingController _controllerLocation = TextEditingController();
    bool _validateSalaryMin = true;
    TextEditingController _controllerSalaryMin = TextEditingController();
    bool _validateSalaryMax = true;
    TextEditingController _controllerSalaryMax = TextEditingController();
    bool _validateExpected = true;
    TextEditingController _controllerExpected = TextEditingController();
    DateTime temp = DateTime.now();
    if (selectedDate == null) selectedDate = temp;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Container(
            child: Center(
              child: Text(
                AppLocalizations.of(context).translate("scr004.titleUpdate"),
                style: TextStyle(
                    color: AppColors.primaryDarkColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: FlatButton(
                  child: new Text(
                    AppLocalizations.of(context).translate("scr004.btnCancel"),
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () => Navigator.of(context).pop()),
            ),
            SizedBox(
              width: 9,
            ),
            Container(
                // color: Colors.blue,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(3),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: AppColors.primaryDarkColor,
                        )),
                    child: new Text(
                      AppLocalizations.of(context)
                          .translate("scr004.btnUpdate"),
                      style: TextStyle(color: AppColors.primaryDarkColor),
                    ),
                    onPressed: () {
                      //check empty
                      if (_validateDate ||
                          _validateExpected ||
                          _validateLocation ||
                          _validateName ||
                          _validateSalaryMax ||
                          _validateSalaryMin) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return new AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  title: Text(
                                    AppLocalizations.of(context)
                                        .translate("scr004.ErrorEmpty"),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: new Text(
                                        AppLocalizations.of(context)
                                            .translate("scr004.btnUnderStood"),
                                        style:
                                            TextStyle(color: Colors.red[300]),
                                      ),
                                      onPressed: () =>
                                          {Navigator.of(context).pop()},
                                    )
                                  ]);
                            });
                      }
                    })),
          ],
          content: Builder(
            builder: (context) {
              return Container(
                  margin: EdgeInsets.only(top: 20),
                  width: displayWidth(context),
                  height: displayHeight(context) * 0.5,
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          //title
                          TextField(
                            controller: _controllerName,
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal)),
                                hintText: AppLocalizations.of(context)
                                    .translate("scr004.titleUpdateTitle"),
                                labelText: AppLocalizations.of(context)
                                    .translate("src004.hintTextTitle"),
                                prefixIcon: Icon(
                                  Icons.title,
                                  color: AppColors.primaryDarkColor,
                                ),
                                prefixText: ' ',
                                suffixStyle: TextStyle(
                                  color: AppColors.primaryDarkColor,
                                )),
                            //validation
                            onChanged: (value) {
                              value.isEmpty
                                  ? _validateName = true
                                  : _validateName = false;
                            },
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          //location
                          TextField(
                            controller: _controllerLocation,
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal)),
                                hintText: AppLocalizations.of(context)
                                    .translate("scr004.titleUpdateLocation"),
                                labelText: AppLocalizations.of(context)
                                    .translate("scr004.hintTextLocation"),
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  color: AppColors.primaryDarkColor,
                                ),
                                prefixText: ' ',
                                suffixStyle: TextStyle(
                                  color: AppColors.primaryDarkColor,
                                )),
                            //validation
                            onChanged: (value) {
                              value.isEmpty
                                  ? _validateLocation = true
                                  : _validateLocation = false;
                            },
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          //expected
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _controllerExpected,
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal)),
                                hintText: AppLocalizations.of(context)
                                    .translate("scr004.titleUpdateExpected"),
                                labelText: AppLocalizations.of(context)
                                    .translate("scr004.hintTextExpected"),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: AppColors.primaryDarkColor,
                                ),
                                prefixText: ' ',
                                suffixStyle: TextStyle(
                                  color: AppColors.primaryDarkColor,
                                )),
                            //validation
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _validateExpected = true;
                              } else {
                                if (int.parse(value) <= 0) {
                                  _validateExpected = true;
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          //min salary
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _controllerSalaryMin,
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal)),
                                hintText: "Min Salary",
                                labelText: "Min Salary",
                                prefixIcon: Icon(
                                  Icons.monetization_on,
                                  color: AppColors.primaryDarkColor,
                                ),
                                prefixText: ' ',
                                suffixStyle: TextStyle(
                                  color: AppColors.primaryDarkColor,
                                )),
                            //validation
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _validateSalaryMin = true;
                              } else {
                                if (int.parse(value) <= 0) {
                                  _validateSalaryMin = true;
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          //max salary
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _controllerSalaryMax,
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal)),
                                hintText: "Max Salary",
                                labelText: "Max Salary",
                                prefixIcon: Icon(
                                  Icons.monetization_on,
                                  color: AppColors.primaryDarkColor,
                                ),
                                prefixText: ' ',
                                suffixStyle: TextStyle(
                                  color: AppColors.primaryDarkColor,
                                )),
                            //validation
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _validateSalaryMax = true;
                              } else {
                                if (int.parse(value) <= 0) {
                                  _validateSalaryMax = true;
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //due date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              //pick to choose date
                              GestureDetector(
                                onTap: () {
                                  _selectDate(context, selectedDate)
                                      .then((value) => selectedDate = value);
                                  print(selectedDate);
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                      color: AppColors.primaryDarkColor,
                                      width: 1.0,
                                    )),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        'assets/screens/scr004/calendar.svg',
                                        width: displayWidth(context) * 0.05,
                                        color: AppColors.primaryDarkColor,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                      SizedBox(
                                        width: 3.0,
                                      ),
                                      Text(
                                        "Expire date:",
                                        style: TextStyle(
                                            color: AppColors.primaryDarkColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              //display date
                              Text("${selectedDate.toLocal()}".split(' ')[0]),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ));
            },
          ),
        );
      },
    );
  }

  Future<DateTime> _selectDate(
      BuildContext context, DateTime selectedDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        print(1);
      });
    return selectedDate;
  }
}
