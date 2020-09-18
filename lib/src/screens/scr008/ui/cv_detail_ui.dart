import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/screens/scr008/ui/sizes_helpers.dart';
import 'package:cvideo_employer_mobile/src/screens/scr009/scr009.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

Widget buildContent(
    BuildContext context,
    EmployeeDetail user,
    List<Section> listSession,
    CVDetail cvDetail,
    BuildContext blocContext,
    String lang) {
  var list = listSession;
  if (listSession.isNotEmpty) {
    // sort list section
    // Comparator<Section> displayComparator =
    //     (a, b) => a.displayOrder.compareTo(b.displayOrder);
    // listSession.sort(displayComparator);
    print("---------------------" + cvDetail.employee.email);
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildCVTitle(context, cvDetail.title, cvDetail, lang),
              buildUser(context, user),
              if (listSession.isNotEmpty)
                for (var session in list)
                  buildSession(context, session, cvDetail.cvId, lang),
            ],
          ),
        ),
      ],
    ));
  } else {
    print("---------------------" + cvDetail.employee.email);
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildCVTitle(context, cvDetail.title, cvDetail, lang),
              buildUser(context, user),
            ],
          ),
        ),
      ],
    ));
  }
}

Widget buildUser(BuildContext context, EmployeeDetail user) {
  return Container(
      width: displayWidth(context),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    user.fullname,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 13),
                Text(
                  AppLocalizations.of(context).translate("scr008.DOB") +
                      DateFormat("dd-MM-yyyy").format(DateFormat("dd-MM-yyyy")
                          .parse(user.dateOfBirth.toString())),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context).translate("scr008.gender") +
                      user.gender,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context).translate("scr008.phone") +
                      user.phone,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context).translate("scr008.email") +
                      user.email,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context).translate("scr008.address") +
                      user.address,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 65,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(4),
              height: displayHeight(context) * 0.15,
              width: displayWidth(context) * 0.05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(user.avatar), fit: BoxFit.fitHeight)),
            ),
          ),
        ],
      ));
}

Widget buildSession(
    BuildContext context, Section session, int cvId, String lang) {
  return Container(
      width: displayWidth(context),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: <Widget>[
          buildSessionTitle(context, session, cvId, lang),
          if (session.sessionText.isNotEmpty)
            buildSessionText(context, session, cvId, lang),
          buildListField(context, session, cvId, lang),
          Container(
            child: buildListVideo(context, session, cvId, lang),
          )
        ],
      ));
}

Widget buildListField(
    BuildContext context, Section session, int cvId, String lang) {
  var list = session.sessionField;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      for (var field in list)
        buildSessionField(context, field, session, cvId, lang),
    ],
  );
}

Widget buildListVideo(
    BuildContext context, Section session, int cvId, String lang) {
  var list = session.sessionVideo;
  //sort video by date
  Comparator<Video> displayComparator =
      (a, b) => b.videoId.compareTo(a.videoId);
  session.sessionVideo.sort(displayComparator);
  if (session.sessionVideo.length != 0) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(5),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
            for (var video in list)
              buildSessionVideo(context, video, cvId, session.sessionId, lang),
          ])),
    );
  }
}

Widget buildSessionVideo(
    BuildContext context, Video video, int cvId, int sessionId, String lang) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(AppRoutes.SCR009_SCREEN,
          arguments: SCR009Arguments(
              videoInfo: VideoInfo(
                  cvId: cvId,
                  sectionId: sessionId,
                  styleId: video.videoStyle.styleId,
                  videoUrl: video.videoUrl,
                  thumbUrl: video.thumbUrl,
                  coverUrl: video.coverUrl,
                  aspectRatio: video.aspectRatio)));
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
          width: displayWidth(context) * 0.18,
          height: 90,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(video.thumbUrl), fit: BoxFit.fitHeight)),
          child: Center(
            child: SvgPicture.asset(
              "assets/screens/scr004/Polygon 3.svg",
              width: 30,
              height: 30,
              color: AppColors.primaryDarkColor,
            ),
          )),
    ),
  );
}

Widget buildSessionText(
    BuildContext context1, Section session, int cvId, String lang) {
  return Container(
      width: displayWidth(context1),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.fromLTRB(13, 7, 13, 0),
      alignment: Alignment.centerLeft,
      child: Text(
        session.sessionText,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 15,
          color: AppColors.primaryTextColor,
        ),
      ));
}

Widget buildSessionField(BuildContext context1, Field field, Section session,
    int cvId, String lang) {
  if (field.fieldName.length == 0) {
    return Container(
      color: Color(0x008147),
      width: displayWidth(context1),
      margin: EdgeInsets.fromLTRB(13, 7, 13, 0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          Text(
            field.fieldText,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, color: AppColors.primaryTextColor),
          ),
        ],
      ),
    );
  } else {
    return Container(
        width: displayWidth(context1),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.fromLTRB(13, 7, 13, 0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildFieldName(context1, field, session, cvId, lang),
            SizedBox(
              height: 8,
            ),
            buildFieldText(context1, field, session, cvId, lang),
          ],
        ));
  }
}

Widget buildFieldName(BuildContext context1, Field field, Section session,
    int cvId, String lang) {
  return Text(
    field.fieldName,
    textAlign: TextAlign.left,
    style: TextStyle(
        fontSize: 18,
        color: AppColors.primaryTextColor,
        fontWeight: FontWeight.bold),
  );
}

Widget buildFieldText(BuildContext context1, Field field, Section session,
    int cvId, String lang) {
  return Text(
    field.fieldText,
    textAlign: TextAlign.left,
    style: TextStyle(fontSize: 14, color: AppColors.primaryTextColor),
  );
}

Widget buildCVTitle(
    BuildContext context1, String title, CVDetail cvDetail, String lang) {
  return Padding(
    padding: EdgeInsets.all(4.0),
    child: Container(
      width: displayWidth(context1),
      height: displayHeight(context1) * 0.05,
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: AppColors.primaryDarkColor,
          width: 1.0,
        )),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.primaryDarkColor,
            fontSize: 30,
            fontWeight: FontWeight.w800),
      ),
    ),
  );
}

Widget buildSessionTitle(
    BuildContext context1, Section session, int cvId, String lang) {
  return Container(
      width: displayWidth(context1),
      height: displayHeight(context1) * 0.042,
      margin: EdgeInsets.fromLTRB(13, 0, 13, 0),
      // padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: AppColors.primaryDarkColor,
          width: 1.0,
        )),
      ),
      child: Container(
        child: Text(
          session.sessionTitle,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 18,
              color: AppColors.primaryDarkColor,
              fontWeight: FontWeight.bold),
        ),
      ));
}
