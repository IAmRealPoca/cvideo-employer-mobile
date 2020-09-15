import 'package:cvideo_employer_mobile/src/app_components/app_colors.dart';
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/screens/scr011/ui/scr011_body.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SCR011_Header extends StatefulWidget {
  final RecruitmentApplyCV recruitment;
  final TabController tabController;
  final List<Application> listApplied;

  const SCR011_Header(
      {Key key, this.recruitment, this.tabController, this.listApplied})
      : super(key: key);
  @override
  _SCR011_HeaderState createState() => _SCR011_HeaderState();
}

class _SCR011_HeaderState extends State<SCR011_Header> {
  @override
  Widget build(BuildContext context) {
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
      margin: EdgeInsets.only(top: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
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
                    child: SCR011_Body(
                      listApplied: listNoSeen,
                      message: AppLocalizations.of(context)
                          .translate("scr004.ErrorNoCVNew"),
                    ),
                  ),
                  Container(
                    child: SCR011_Body(
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
}
