import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/screens/scr008/scr008.dart';
import 'package:cvideo_employer_mobile/src/screens/scr011/ui/sizes_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class SCR011_Body extends StatelessWidget {
  final List<Application> listApplied;
  final String message;

  const SCR011_Body({Key key, this.listApplied, this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String lang = AppLocalizations.of(context).locale.languageCode;
    if (listApplied.isEmpty) {
      return buildNoListCV(context, message);
    } else {
      return buildListCV(context);
    }
  }

  Widget buildNoListCV(BuildContext context, String message) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(
                      'assets/screens/scr003/ic_empty_job.svg',
                      width: displayWidth(context) * 0.03,
                      height: 90,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                  Text(message,
                      style: TextStyle(
                          color: AppColors.primaryDarkColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildListCV(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: listApplied.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (!listApplied[index].status) listApplied[index].status = true;
              Navigator.of(context).pushNamed(AppRoutes.SCR008_SCREEN,
                  arguments: ScreenArguments(
                      applicationId: listApplied[index].applicationId,
                      contextList: context,
                      postId: listApplied[index].postId));
            },
            child: Card(
              child: Container(
                // height: displayHeight(context) * 0.23,
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //date time convert

                    //infor user
                    Container(
                      padding: EdgeInsets.all(4),
                      width: displayWidth(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: displayWidth(context) * 0.15,
                            child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    listApplied[index].detail.employee.avatar)),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                //user name
                                Container(
                                  width: displayWidth(context) * 0.55,
                                  child: Text(
                                    listApplied[index].detail.employee.fullname,
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                //phone
                                Container(
                                  width: displayWidth(context) * 0.55,
                                  child: Text(
                                    AppLocalizations.of(context)
                                            .translate("scr004.phone") +
                                        listApplied[index]
                                            .detail
                                            .employee
                                            .phone,
                                    style: TextStyle(
                                        color: AppColors.primaryTextColor
                                            .withOpacity(0.5),
                                        fontSize: 17),
                                  ),
                                ),
                                //email
                                Container(
                                  width: displayWidth(context) * 0.55,
                                  child: Text(
                                    AppLocalizations.of(context)
                                            .translate("scr004.email") +
                                        listApplied[index]
                                            .detail
                                            .employee
                                            .email,
                                    style: TextStyle(
                                        color: AppColors.primaryTextColor
                                            .withOpacity(0.5),
                                        fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(4),
                        width: displayWidth(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: SvgPicture.asset(
                                'assets/screens/scr004/clock.svg',
                                width: displayWidth(context) * 0.04,
                                color:
                                    AppColors.primaryTextColor.withOpacity(0.5),
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate("scr004.applyTime"),
                              style: TextStyle(
                                  color: AppColors.primaryTextColor
                                      .withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              datetimeConvert(
                                listApplied[index].detail.created,
                              ),
                              style: TextStyle(
                                  color: AppColors.primaryTextColor
                                      .withOpacity(0.5),
                                  fontSize: 16),
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.all(4),
                        width: displayWidth(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: SvgPicture.asset(
                                'assets/screens/scr004/eye.svg',
                                width: displayWidth(context) * 0.04,
                                color:
                                    AppColors.primaryTextColor.withOpacity(0.5),
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate("scr004.status"),
                              style: TextStyle(
                                  color: AppColors.primaryTextColor
                                      .withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            if (listApplied[index].status)
                              Text(
                                AppLocalizations.of(context)
                                    .translate("scr004.seen"),
                                style: TextStyle(
                                    color: AppColors.primaryTextColor
                                        .withOpacity(0.5),
                                    fontSize: 16),
                              ),
                            if (!listApplied[index].status)
                              Text(
                                AppLocalizations.of(context)
                                    .translate("scr004.notSeen"),
                                style: TextStyle(
                                    color: Colors.yellow.withOpacity(0.5),
                                    fontSize: 16),
                              ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String datetimeConvert(String date) {
    var datetime =
        DateFormat("dd-MM-yyyy hh:mm:ss").format(DateTime.parse(date));
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
    return day +
        "/" +
        month +
        "/" +
        year.toString() +
        " " +
        hour +
        ":" +
        minues;
  }
}
