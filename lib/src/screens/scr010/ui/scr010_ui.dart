import 'package:cvideo_employer_mobile/src/app_components/app_colors.dart';
import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/screens/scr004/ui/sizes_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CompanyDetailPage extends StatelessWidget {
  final CompanyDetail company;
  final BuildContext blocContext;

  const CompanyDetailPage({Key key, this.company, this.blocContext})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: displayWidth(context),
        height: displayHeight(context),
        child: ListView(
          children: <Widget>[
            //header
            Container(
              color: AppColors.primaryColor,
              width: displayWidth(context),
              height: displayHeight(context) * 0.21,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //avatar
                  Padding(
                    padding: EdgeInsets.fromLTRB(14, 12, 4, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: displayHeight(context) * 0.178,
                          width: displayWidth(context) * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(company.avatar),
                                  fit: BoxFit.fitHeight)),
                        ),
                      ],
                    ),
                  ),
                  //information
                  Container(
                    height: displayHeight(context) * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //name
                              Container(
                                height: displayHeight(context) * 0.05,
                                width: displayWidth(context) * 0.6,
                                alignment: Alignment.centerLeft,
                                color: AppColors.primaryColor,
                                child: Text(
                                  company.compayName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.secondaryTextColor),
                                ),
                              ),
                              //location
                              Container(
                                  height: displayHeight(context) * 0.04,
                                  width: displayWidth(context) * 0.6,
                                  color: AppColors.primaryColor,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: SvgPicture.asset(
                                          'assets/screens/scr004/location.svg',
                                          width: displayWidth(context) * 0.025,
                                          color: AppColors.secondaryTextColor,
                                          allowDrawingOutsideViewBox: true,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)
                                            .translate("scr010.location"),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                AppColors.secondaryTextColor),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        company.address,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                AppColors.secondaryTextColor),
                                      ),
                                    ],
                                  )),
                              //Email
                              Container(
                                  height: displayHeight(context) * 0.04,
                                  width: displayWidth(context) * 0.6,
                                  color: AppColors.primaryColor,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: SvgPicture.asset(
                                          'assets/screens/scr010/envelope.svg',
                                          width: displayWidth(context) * 0.03,
                                          color: AppColors.secondaryTextColor,
                                          allowDrawingOutsideViewBox: true,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)
                                            .translate("scr010.email"),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                AppColors.secondaryTextColor),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        company.email,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                AppColors.secondaryTextColor),
                                      ),
                                    ],
                                  )),
                              //Phone
                              Container(
                                  height: displayHeight(context) * 0.04,
                                  width: displayWidth(context) * 0.6,
                                  color: AppColors.primaryColor,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            child: SvgPicture.asset(
                                              'assets/screens/scr010/phone (1).svg',
                                              width:
                                                  displayWidth(context) * 0.035,
                                              color:
                                                  AppColors.secondaryTextColor,
                                              allowDrawingOutsideViewBox: true,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)
                                                .translate("scr010.phone"),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors
                                                    .secondaryTextColor),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            company.phone,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors
                                                    .secondaryTextColor),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showConfirm(context);
                                        },
                                        child: Container(
                                          child: SvgPicture.asset(
                                            'assets/screens/scr010/edit.svg',
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //introduce
            Expanded(
              child: Container(
                padding: EdgeInsets.all(14),
                height: displayHeight(context),
                width: displayWidth(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)
                            .translate("scr010.introduction"),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (company.description.isEmpty ||
                        company.description.length == 0)
                      Container(
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(AppLocalizations.of(context)
                              .translate("scr010.notiEmptyDescription")),
                        ),
                      )
                    else
                      Container(
                        child: Text(
                          company.description,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void showConfirm(BuildContext context) {
    bool _validateName = false;
    TextEditingController _controllerName = TextEditingController();
    bool _validateLocation = false;
    TextEditingController _controllerLocation = TextEditingController();
    bool _validateEmail = false;
    TextEditingController _controllerEmail = TextEditingController();
    bool _validatePhone = false;
    TextEditingController _controllerPhone = TextEditingController();
    TextEditingController _controllerDescription = TextEditingController();
    _controllerDescription.text = company.description;
    _controllerEmail.text = company.email;
    _controllerLocation.text = company.address;
    _controllerName.text = company.compayName;
    _controllerPhone.text = company.phone;
    showDialog(
        context: context,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: FlatButton(
                  child: new Text(
                    AppLocalizations.of(context).translate("scr010.btnCancel"),
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () => Navigator.of(context).pop()),
            ),
            SizedBox(
              width: 9,
            ),
            Container(
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
                          .translate("scr010.btnUpdate"),
                      style: TextStyle(color: AppColors.primaryDarkColor),
                    ),
                    onPressed: () {
                      if (_validateEmail ||
                          _validateLocation ||
                          _validateName ||
                          _validatePhone) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return new AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  title: Text(
                                    AppLocalizations.of(context)
                                        .translate("scr010.emptyContent"),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: new Text(
                                        AppLocalizations.of(context)
                                            .translate("scr010.btnUnderstood"),
                                        style:
                                            TextStyle(color: Colors.red[300]),
                                      ),
                                      onPressed: () => {
                                        Navigator.of(context).pop(),
                                      },
                                    )
                                  ]);
                            });
                      } else {
                        Navigator.of(context).pop();
                        BlocProvider.of<CompanyDetailBloc>(blocContext).add(
                            UpdateCompanyEvent(
                                company: CompanyDetail(
                                    address: _controllerLocation.text,
                                    avatar: company.avatar,
                                    companyId: company.companyId,
                                    compayName: _controllerName.text,
                                    description: _controllerDescription.text,
                                    email: _controllerEmail.text,
                                    phone: _controllerPhone.text)));
                      }
                    }))
          ],
          title: Container(
            child: Center(
              child: Text(
                AppLocalizations.of(context)
                    .translate("scr010.titleUpdateCompany"),
                style: TextStyle(
                    color: AppColors.primaryDarkColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          content: Builder(
            builder: (context) {
              return Container(
                width: displayWidth(context),
                height: displayHeight(context) * 0.5,
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //title
                        TextField(
                          controller: _controllerName,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            hintText: AppLocalizations.of(context)
                                .translate("scr010.titleUpdateName"),
                            labelText: AppLocalizations.of(context)
                                .translate("scr010.titleUpdateName"),
                            prefixIcon: Icon(
                              Icons.account_balance,
                              color: AppColors.primaryDarkColor,
                            ),
                          ),
                          //validation
                          onChanged: (value) {
                            value.isEmpty
                                ? _validateName = true
                                : _validateName = false;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        //location
                        TextField(
                          controller: _controllerLocation,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            hintText: AppLocalizations.of(context)
                                .translate("scr010.titleUpdateLocation"),
                            labelText: AppLocalizations.of(context)
                                .translate("scr010.hintUpdateLocation"),
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: AppColors.primaryDarkColor,
                            ),
                          ),
                          //validation
                          onChanged: (value) {
                            value.isEmpty
                                ? _validateLocation = true
                                : _validateLocation = false;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        //Email
                        TextField(
                          controller: _controllerEmail,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            hintText: AppLocalizations.of(context)
                                .translate("scr010.titleUpdateEmail"),
                            labelText: AppLocalizations.of(context)
                                .translate("scr010.hintUpdateEmail"),
                            prefixIcon: Icon(
                              Icons.email,
                              color: AppColors.primaryDarkColor,
                            ),
                          ),
                          //validation
                          onChanged: (value) {
                            value.isEmpty
                                ? _validateEmail = true
                                : _validateEmail = false;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        //Phone
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: _controllerPhone,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            hintText: AppLocalizations.of(context)
                                .translate("scr010.titleUpdatePhone"),
                            labelText: AppLocalizations.of(context)
                                .translate("scr010.hintUpdatePhone"),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: AppColors.primaryDarkColor,
                            ),
                          ),
                          //validation
                          onChanged: (value) {
                            value.isEmpty
                                ? _validatePhone = true
                                : _validatePhone = false;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //Description
                        TextField(
                          decoration: new InputDecoration(
                              hintText: AppLocalizations.of(context)
                                  .translate("scr010.titleUpdateIntroduction"),
                              labelText: AppLocalizations.of(context)
                                  .translate("scr010.hintUpdateIntroduction"),
                              filled: true,
                              border: new OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                      new BorderSide(color: Colors.teal)),
                              suffixStyle: TextStyle(color: Colors.green)),
                          maxLines: 7,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          controller: _controllerDescription,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
