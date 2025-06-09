import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../dynamic_form_warehouse/dynamic_form_widget/core_selector/selector_model.dart';
import '../../../dynamic_form_warehouse/page_builder.dart';
import '../../../setup_config_app.dart';
import '../../dynamic_form_network/dio_option.dart';


class DemoPage extends StatefulWidget {
  const DemoPage({
    required this.initData,
    super.key,
  });

  final PageUrls initData;
  @override
  State<DemoPage> createState() => _DefaultPage();
}

class _DefaultPage extends State<DemoPage> {
  String username = "";
  String password = "";
  final Dio dior = DioOption().createDio();
  Map<String, dynamic> formJson = {};
  Map<String, dynamic> map = {};

  @override
  Widget build(BuildContext context) {
    return buildPageGenerate();
  }

/*  Future<void> getDataInit() async {
    formJson = (await dior.get(widget.initData.getFormJsonUrl))
        as Map<String, dynamic>;
    map =
        (await dior.get(widget.initData.getMapDataUrl)) as Map<String, dynamic>;
  }*/

  Widget buildPageGenerate() {
    return
      PageBuilder(
      formData:  dataTest,
      mapAnswers: mapAnswers,
      title: 'Gửi phản ánh kiến nghị',
      backgroundBodyColor: Colors.white,
    );
  }

  Map<String, dynamic> dataGenerate() {
    if (widget.initData.typePage == PageType.page1) {
      return dataDemo1;
    }
    if (widget.initData.typePage == PageType.page2) {
      return dataDemo2;
    }
    if (widget.initData.typePage == PageType.page3) {
      return dataDemo3;
    }
    return dataDemo1;
  }

  Map<String, dynamic> mapAnswers = {
    "textField": '',
    "TTP": SelectorModel(),
    "QuanHuyen": SelectorModel(),
  };
  Map<String, dynamic> dataTest = {
    "display": "wizard",
    "components": [
      {
        "title": "Thông tin cơ quan tiếp nhận 3",
        "label": "Page 1",
        "type": "panel",
        "key": "page1",
        "components": [
          {
            "label": "Columns",
            "columns": [
              {
                "components": [
                  {
                    "label": "Họ và tên",
                    "placeholder": "Placeholder",
                    "applyMaskOn": "change",
                    "hideLabel": true,
                    "disabled": false,
                    "tableView": true,
                    "validate": {
                      "required": true,
                      "customMessage": "Thông báo lỗi tùy ",
                      "minLength": 10,
                      "maxLength": 100,
                      "minWords": 1,
                      "maxWords": 10
                    },
                    "unique": true,
                    "validateWhenHidden": false,
                    "key": "textField",
                    "mobile": {
                      "borderRadius": 1,
                      "placeholderColor": "#c81919",
                      "contentPadding": 1,
                      "errorBorderColor": "#b1a525",
                      "focusBorderColor": "#cc1e1e",
                      "borderColor": "#886811",
                      "isPassword": true,
                      "readOnly": false,
                      "textSize": 14,
                      "textColor": "#749e00",
                      "labelColor": "#7c1313",
                      "labelFontWeight ": "medium",
                      "maxLine": 1,
                      "placeholderSize": 14,
                      "labelSize": 14
                    },
                    "type": "textfield",
                    "input": true
                  },
                  {
                    "title": "Text demo",
                    "titleColor": "#375c00",
                    "fontWeight": "normal",
                    "key": "textDemo",
                    "type": "mobiletext",
                    "input": false,
                    "tableView": false,
                    "label": "",
                    "titleSize": 16
                  },
/*                  {
                    "label": "Select",
                    "widget": "choicesjs",
                    "tableView": true,
                    "dataSrc": "url",
                    "data": {
                      "url": "https://ttdl-gateway.vnpt.vn/category/v1/donvi-hanhchinh/quan-huyen?tinhTpCode=64",
                      "headers": [
                        {
                          "key": "token",
                          "value": "token123"
                        }
                      ]
                    },
                    "idPath": "Id",
                    "template": "<span>{{ item.ten }}</span>",
                    "persistent": false,
                    "validate": {
                      "customMessage": "Thông báo lỗi tùy "
                    },
                    "validateWhenHidden": false,
                    "key": "select",
                    "mobile": {
                      "errorBorderColor": "#e21212",
                      "focusBorderColor": "#b30000",
                      "borderColor": "#5c5c5c",
                      "readOnly": true,
                      "isShowSearch": true,
                      "partnerMap": [
                        "Huyen",
                        "xa"
                      ],
                      "textColor": "#9e0000",
                      "labelColor": "#001999",
                      "labelFontWeight ": "normal",
                      "borderRadius": 1,
                      "contentPadding": 1,
                      "maxLine": 1,
                      "placeholderSize": 20,
                      "textSize": 20,
                      "labelSize": 20,
                      "pathLabel": "ten"
                    },
                    "type": "select",
                    "input": true,
                    "selectValues": "data",
                    "disableLimit": false,
                    "noRefreshOnScroll": false
                  },*/
                  {
                    "label": "Chọn tỉnh/TP",
                    "widget": "choicesjs",
                    "tableView": true,
                    "dataSrc": "json",
                    "validate": {
                      "customMessage": "Thông báo lỗi tùy "
                    },
                    "mobile": {
                      "errorBorderColor": "#e21212",
                      "focusBorderColor": "#b30000",
                      "borderColor": "#5c5c5c",
                      "readOnly": true,
                      "isShowSearch": true,
                      "textColor": "#9e0000",
                      "labelColor": "#001999",
                      "labelFontWeight ": "normal",
                      "borderRadius": 1,
                      "contentPadding": 1,
                      "maxLine": 1,
                      "placeholderSize": 20,
                      "textSize": 20,
                      "labelSize": 20,
                      "pathLabel": "ten"
                    },
                    "data": {
                      "json": [
                        {
                          "name": "name 1",
                          "address": "address 1",
                          "Id": "1"
                        },
                        {
                          "name": "name 2",
                          "address": "address 2",
                          "Id": "2"
                        },
                        {
                          "name": "name 3",
                          "address": "address 3",
                          "Id": "3"
                        },
                        {
                          "name": "name 4",
                          "address": "address 4",
                          "Id": "4"
                        },
                        {
                          "name": "name 5",
                          "address": "address 5",
                          "Id": "5"
                        },
                        {
                          "name": "name 6",
                          "address": "address 6",
                          "Id": "6"
                        }
                      ],
                      "url": "https://ttdl-gateway.vnpt.vn/category/v1/donvi-hanhchinh/tinh-tp",
                      "headers": [
                        {
                          "key": "",
                          "value": ""
                        }
                      ]
                    },
                    "valueProperty": "ma",
                    "template": "<span>{{ item.ten }}</span>",
                    "validateWhenHidden": false,
                    "key": "TTP",
                    "type": "select",
                    "selectValues": "data",
                    "disableLimit": false,
                    "noRefreshOnScroll": false,
                    "input": true
                  },
                  {
                    "label": "Chọn quận huyện",
                    "widget": "choicesjs",
                    "tableView": true,
                    "dataSrc": "json",
                    "mobile": {
                      "errorBorderColor": "#e21212",
                      "focusBorderColor": "#b30000",
                      "borderColor": "#5c5c5c",
                      "readOnly": true,
                      "isShowSearch": true,
                      "textColor": "#9e0000",
                      "labelColor": "#001999",
                      "labelFontWeight ": "normal",
                      "borderRadius": 1,
                      "contentPadding": 1,
                      "maxLine": 1,
                      "placeholderSize": 20,
                      "textSize": 20,
                      "labelSize": 20,
                      "pathLabel": "ten"
                    },
                    "data": {
                      "json": [
                        {
                          "name": "name 1",
                          "address": "address 1",
                          "Id": "1"
                        },
                        {
                          "name": "name 2",
                          "address": "address 2",
                          "Id": "2"
                        },
                        {
                          "name": "name 3",
                          "address": "address 3",
                          "Id": "3"
                        },
                        {
                          "name": "name 4",
                          "address": "address 4",
                          "Id": "4"
                        },
                        {
                          "name": "name 5",
                          "address": "address 5",
                          "Id": "5"
                        },
                        {
                          "name": "name 6",
                          "address": "address 6",
                          "Id": "6"
                        }
                      ],
                      "url": "https://ttdl-gateway.vnpt.vn/category/v1/donvi-hanhchinh/quan-huyen",
                      "headers": [
                        {
                          "key": "",
                          "value": ""
                        }
                      ],
                      "params": [
                        {"key": "tinhTpId", "value": "id"},
                        {"key": "tinhTpCode", "value": "ma"},
                      ]
                    },
                    "valueProperty": "id",
                    "template": "<span>{{ item.ten }}</span>",
                    "refreshOn": "TTP",
                    "clearOnRefresh": true,
                    "validateWhenHidden": false,
                    "key": "quanHuyen",
                    "type": "select",
                    "selectValues": "data",
                    "disableLimit": false,
                    "noRefreshOnScroll": false,
                    "labelProperty": "name",
                    "input": true
                  }

                ],
                "width": 6,
                "offset": 0,
                "push": 0,
                "pull": 0,
                "size": "md",
                "currentWidth": 6
              },
            ],
            "key": "columns",
            "type": "columns",
            "input": false,
            "tableView": false
          }
        ],
        "input": false,
        "tableView": false,
        "breadcrumbClickable": true,
        "buttonSettings": {"previous": true, "cancel": true, "next": true},
        "navigateOnEnter": false,
        "saveOnEnter": false,
        "scrollToTop": false,
        "collapsible": false,
        "description": "Chưa thực hiện",
        "collapsed": false,
        "showtitleMenu": true,
        "titleMenu": "Các bước thực hiện",
        "customguide":
            "Hướng dẫn Công dân kiểm tra lại thông tin cơ quan tiếp nhận. Nhấn chọn Tiếp theo và thực hiện các bước để hoàn thành quá trình nộp hồ sơ.",
        "customConditional": "",
        "customperformed": "Đang thực hiện"
      },
    ]
  };

  Map<String, dynamic> dataDemo3 = {
    "display": "wizard",
    "components": [
      {
        "title": "Thông tin cơ quan tiếp nhận 3",
        "label": "Page 1",
        "type": "panel",
        "key": "page1",
        "components": [
          {
            "label": "Columns",
            "columns": [
              {
                "components": [
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "user",
                    "title": "Người dân",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": true,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập tên người phản ánh",
                    "contentValidateEmpty":
                        "Tên người phản ánh không được để trống",
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 1,
                  },
                  {
                    "type": "text",
                    "key": "Address",
                    "title": "Địa chỉ",
                    "titleColor": "#000000",
                    "titleSize": 14.0,
                    "fontWeight": "bold",
                  },
                  {
                    "type": "size",
                    "key": "Height",
                    "height": 12.0,
                    "width": 12.0,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "TTP",
                    "title": "Tỉnh/thành phố",
                    "type": "selectorBox",
                    "hintText": "Chọn Tỉnh/thành phố",
                    "dataSrc": "json",
                    "data": {
                      "json": [
                        {
                          "name": "name 1",
                          "address": "address 1",
                          "Id": "1"
                        },
                        {
                          "name": "name 2",
                          "address": "address 2",
                          "Id": "2"
                        },
                        {
                          "name": "name 3",
                          "address": "address 3",
                          "Id": "3"
                        },
                        {
                          "name": "name 4",
                          "address": "address 4",
                          "Id": "4"
                        },
                        {
                          "name": "name 5",
                          "address": "address 5",
                          "Id": "5"
                        },
                        {
                          "name": "name 6",
                          "address": "address 6",
                          "Id": "6"
                        }
                      ],
                      "url":
                          "https://ttdl-gateway.vnpt.vn/category/v1/donvi-hanhchinh/tinh-tp",
                      "headers": [
                        {"key": "", "value": ""}
                      ],
                      "request": null,
                    },
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "contentPadding": null,
                    "textSize": null,
                    "textColor": null,
                    "isRequired": true,
                    "enable": null,
                    "maxLines": null,
                    "isShowSearch": true,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "refreshOn": "TTP",
                    "hasTitle": true,
                    "key": "QuanHuyen",
                    "title": "Quân/Huyện",
                    "type": "selectorBox",
                    "hintText": "Chọn Quận/Huyện",
                    "dataSrc": "json",
                    "data": {
                      "json": [
                        {
                          "name": "name 1",
                          "address": "address 1",
                          "Id": "1"
                        },
                        {
                          "name": "name 2",
                          "address": "address 2",
                          "Id": "2"
                        },
                        {
                          "name": "name 3",
                          "address": "address 3",
                          "Id": "3"
                        },
                        {
                          "name": "name 4",
                          "address": "address 4",
                          "Id": "4"
                        },
                        {
                          "name": "name 5",
                          "address": "address 5",
                          "Id": "5"
                        },
                        {
                          "name": "name 6",
                          "address": "address 6",
                          "Id": "6"
                        }
                      ],
                      "url":
                          "https://ttdl-gateway.vnpt.vn/category/v1/donvi-hanhchinh/quan-huyen",
                      "headers": [
                        {"key": "", "value": ""}
                      ],
                      "request": [
                        {"key": "tinhTpId", "value": "id"},
                        {"key": "tinhTpCode", "value": "ma"},
                      ]
                    },
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "contentPadding": null,
                    "textSize": null,
                    "textColor": null,
                    "isRequired": true,
                    "enable": null,
                    "maxLines": null,
                    "isShowSearch": true,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "partnerMap": "QuanHuyen",
                    "hasTitle": true,
                    "key": "PhuongXa",
                    "title": "Phường/Xã",
                    "type": "selectorBox",
                    "hintText": "Chọn Phường/Xã",
                    "dataSrc": "url",
                    "data": {
                      "url":
                          "https://ttdl-gateway.vnpt.vn/category/v1/donvi-hanhchinh/phuong-xa",
                      "headers": [
                        {"key": "", "value": ""}
                      ],
                      "request": [
                        {"key": "quanHuyenId", "value": "id"},
                        {"key": "quanHuyenCode", "value": "ma"},
                      ],
                    },
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "contentPadding": null,
                    "textSize": null,
                    "textColor": null,
                    "isRequired": true,
                    "enable": null,
                    "maxLines": null,
                    "isShowSearch": true,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "diachichitiet",
                    "title": "Địa chỉ chi tiết",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": true,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập đại chỉ chi tiết",
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 1,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "sdt",
                    "title": "Số điện thoại",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": true,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập số điện thoại",
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 1,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "sdt",
                    "title": "Email",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": false,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập email",
                    "contentValidateEmpty": "",
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 1,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "PAKNContent",
                    "title": "Nội dung",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": true,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập nội dung",
                    "contentValidateEmpty": "Nội dung PAKN không được để trống",
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 4,
                  },
                ],
                "width": 6,
                "offset": 0,
                "push": 0,
                "pull": 0,
                "size": "md",
                "currentWidth": 6
              },
            ],
            "key": "columns",
            "type": "columns",
            "input": false,
            "tableView": false
          }
        ],
        "input": false,
        "tableView": false,
        "breadcrumbClickable": true,
        "buttonSettings": {"previous": true, "cancel": true, "next": true},
        "navigateOnEnter": false,
        "saveOnEnter": false,
        "scrollToTop": false,
        "collapsible": false,
        "description": "Chưa thực hiện",
        "collapsed": false,
        "showtitleMenu": true,
        "titleMenu": "Các bước thực hiện",
        "customguide":
            "Hướng dẫn Công dân kiểm tra lại thông tin cơ quan tiếp nhận. Nhấn chọn Tiếp theo và thực hiện các bước để hoàn thành quá trình nộp hồ sơ.",
        "customConditional": "",
        "customperformed": "Đang thực hiện"
      },
    ]
  };

  Map<String, dynamic> dataDemo2 = {
    "display": "wizard",
    "components": [
      {
        "title": "Thông tin cơ quan tiếp nhận 2",
        "label": "Page 1",
        "type": "panel",
        "key": "page1",
        "components": [
          {
            "label": "Columns",
            "columns": [
              {
                "components": [
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "user",
                    "title": "Người dân",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": true,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập tên người phản ánh",
                    "contentValidateEmpty":
                        "Tên người phản ánh không được để trống",
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 1,
                  },
                  {
                    "type": "text",
                    "key": "Address",
                    "title": "Địa chỉ",
                    "titleColor": "#000000",
                    "titleSize": 14.0,
                    "fontWeight": "bold",
                  },
                  {
                    "type": "size",
                    "key": "Height",
                    "height": 12.0,
                    "width": 12.0,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "TTP",
                    "title": "Tỉnh/thành phố",
                    "type": "selectorBox",
                    "hintText": "Chọn Tỉnh/thành phố",
                    "dataSrc": "hardData",
                    "data": {
                      "json": [
                        {
                          "name": "name 1",
                          "address": "address 1",
                          "Id": "1"
                        },
                        {
                          "name": "name 2",
                          "address": "address 2",
                          "Id": "2"
                        },
                        {
                          "name": "name 3",
                          "address": "address 3",
                          "Id": "3"
                        },
                        {
                          "name": "name 4",
                          "address": "address 4",
                          "Id": "4"
                        },
                        {
                          "name": "name 5",
                          "address": "address 5",
                          "Id": "5"
                        },
                        {
                          "name": "name 6",
                          "address": "address 6",
                          "Id": "6"
                        }
                      ],
                      "url":
                          "https://ttdl-gateway.vnpt.vn/category/v1/donvi-hanhchinh/tinh-tp",
                      "headers": [
                        {"key": "", "value": ""}
                      ],
                      "request": null,
                    },
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "contentPadding": null,
                    "textSize": null,
                    "textColor": null,
                    "isRequired": true,
                    "enable": null,
                    "maxLines": null,
                    "isShowSearch": true,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "partnerMap": "TTP",
                    "hasTitle": true,
                    "key": "QuanHuyen",
                    "title": "Quân/Huyện",
                    "type": "selectorBox",
                    "hintText": "Chọn Quận/Huyện",
                    "dataSrc": "url",
                    "data": {
                      "url":
                          "https://ttdl-gateway.vnpt.vn/category/v1/donvi-hanhchinh/quan-huyen",
                      "headers": [
                        {"key": "", "value": ""}
                      ],
                      "request": [
                        {"key": "tinhTpId", "value": "id"},
                        {"key": "tinhTpCode", "value": "ma"},
                      ]
                    },
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "contentPadding": null,
                    "textSize": null,
                    "textColor": null,
                    "isRequired": true,
                    "enable": null,
                    "maxLines": null,
                    "isShowSearch": true,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "partnerMap": "QuanHuyen",
                    "hasTitle": true,
                    "key": "PhuongXa",
                    "title": "Phường/Xã",
                    "type": "selectorBox",
                    "hintText": "Chọn Phường/Xã",
                    "dataSrc": "url",
                    "data": {
                      "url":
                          "https://ttdl-gateway.vnpt.vn/category/v1/donvi-hanhchinh/phuong-xa",
                      "headers": [
                        {"key": "", "value": ""}
                      ],
                      "request": [
                        {"key": "quanHuyenId", "value": "id"},
                        {"key": "quanHuyenCode", "value": "ma"},
                      ],
                    },
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "contentPadding": null,
                    "textSize": null,
                    "textColor": null,
                    "isRequired": true,
                    "enable": null,
                    "maxLines": null,
                    "isShowSearch": true,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "diachichitiet",
                    "title": "Địa chỉ chi tiết",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": true,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập đại chỉ chi tiết",
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 1,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "sdt",
                    "title": "Số điện thoại",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": true,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập số điện thoại",
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 1,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "sdt",
                    "title": "Email",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": false,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập email",
                    "contentValidateEmpty": "",
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 1,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "PAKNContent",
                    "title": "Nội dung",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": true,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập nội dung",
                    "contentValidateEmpty": "Nội dung PAKN không được để trống",
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 4,
                  },
                  {
                    "type": "text",
                    "key": "news",
                    "title":
                        "Nội dung này sẽ được công khai, vui lòng không ghi chi tiết thông tin cá nhân",
                    "titleColor": "#C10800",
                    "titleSize": 14.0,
                    "fontWeight": "normal",
                  },
                ],
                "width": 6,
                "offset": 0,
                "push": 0,
                "pull": 0,
                "size": "md",
                "currentWidth": 6
              },
            ],
            "key": "columns",
            "type": "columns",
            "input": false,
            "tableView": false
          }
        ],
        "input": false,
        "tableView": false,
        "breadcrumbClickable": true,
        "buttonSettings": {"previous": true, "cancel": true, "next": true},
        "navigateOnEnter": false,
        "saveOnEnter": false,
        "scrollToTop": false,
        "collapsible": false,
        "description": "Chưa thực hiện",
        "collapsed": false,
        "showtitleMenu": true,
        "titleMenu": "Các bước thực hiện",
        "customguide":
            "Hướng dẫn Công dân kiểm tra lại thông tin cơ quan tiếp nhận. Nhấn chọn Tiếp theo và thực hiện các bước để hoàn thành quá trình nộp hồ sơ.",
        "customConditional": "",
        "customperformed": "Đang thực hiện"
      },
    ]
  };

  Map<String, dynamic> dataDemo1 = {
    "display": "wizard",
    "components": [
      {
        "title": "Thông tin cơ quan tiếp nhận",
        "label": "Page 1",
        "type": "panel",
        "key": "page1",
        "components": [
          {
            "label": "Columns",
            "columns": [
              {
                "components": [
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "DTPAKN",
                    "title": "Đối tượng PAKN",
                    "type": "selectorBox",
                    "hintText": "Chọn đối tượng PAKN",
                    "dataSrc": "url",
                    "data": {
                      "url":
                          "https://ttdl-gateway.vnpt.vn/category/v1/category/by-code?code=DANTOC",
                      "headers": [
                        {"key": "", "value": ""}
                      ],
                      "request": null,
                    },
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "contentPadding": null,
                    "textSize": null,
                    "textColor": null,
                    "isRequired": true,
                    "enable": null,
                    "maxLines": null,
                    "isShowSearch": true,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "user",
                    "title": "Người dân",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": true,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập tên người phản ánh",
                    "contentValidateEmpty":
                        "Tên người phản ánh không được để trống",
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 1,
                  },
                  {
                    "type": "text",
                    "key": "Address",
                    "title": "Địa chỉ",
                    "titleColor": "#000000",
                    "titleSize": 14.0,
                    "fontWeight": "bold",
                  },
                  {
                    "type": "size",
                    "key": "Height",
                    "height": 12.0,
                    "width": 12.0,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "TTP",
                    "title": "Tỉnh/thành phố",
                    "type": "selectorBox",
                    "hintText": "Chọn Tỉnh/thành phố",
                    "dataSrc": "url",
                    "data": {
                      "url":
                          "https://ttdl-gateway.vnpt.vn/category/v1/donvi-hanhchinh/tinh-tp",
                      "headers": [
                        {"key": "", "value": ""}
                      ],
                      "request": null,
                    },
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "contentPadding": null,
                    "textSize": null,
                    "textColor": null,
                    "isRequired": true,
                    "enable": null,
                    "maxLines": null,
                    "isShowSearch": true,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "partnerMap": "TTP",
                    "hasTitle": true,
                    "key": "QuanHuyen",
                    "title": "Quân/Huyện",
                    "type": "selectorBox",
                    "hintText": "Chọn Quận/Huyện",
                    "dataSrc": "url",
                    "data": {
                      "url":
                          "https://ttdl-gateway.vnpt.vn/category/v1/donvi-hanhchinh/quan-huyen",
                      "headers": [
                        {"key": "", "value": ""}
                      ],
                      "request": [
                        {"key": "tinhTpId", "value": "id"},
                        {"key": "tinhTpCode", "value": "ma"},
                      ]
                    },
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "contentPadding": null,
                    "textSize": null,
                    "textColor": null,
                    "isRequired": true,
                    "enable": null,
                    "maxLines": null,
                    "isShowSearch": true,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "partnerMap": "QuanHuyen",
                    "hasTitle": true,
                    "key": "PhuongXa",
                    "title": "Phường/Xã",
                    "type": "selectorBox",
                    "hintText": "Chọn Phường/Xã",
                    "dataSrc": "url",
                    "data": {
                      "url":
                          "https://ttdl-gateway.vnpt.vn/category/v1/donvi-hanhchinh/phuong-xa",
                      "headers": [
                        {"key": "", "value": ""}
                      ],
                      "request": [
                        {"key": "quanHuyenId", "value": "id"},
                        {"key": "quanHuyenCode", "value": "ma"},
                      ],
                    },
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "contentPadding": null,
                    "textSize": null,
                    "textColor": null,
                    "isRequired": true,
                    "enable": null,
                    "maxLines": null,
                    "isShowSearch": true,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "diachichitiet",
                    "title": "Địa chỉ chi tiết",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": true,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập đại chỉ chi tiết",
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 1,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "sdt",
                    "title": "Số điện thoại",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": true,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập số điện thoại",
                    "contentValidateEmpty": null,
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 1,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "sdt",
                    "title": "Email",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": false,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập email",
                    "contentValidateEmpty": "",
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 1,
                  },
                  {
                    "titleColor": "#696969",
                    "titleSize": 14.0,
                    "titleFontWeight": "normal",
                    "hintSize": 14.0,
                    "borderRadius": 4.0,
                    "hintColor": "#92969C",
                    "hasTitle": true,
                    "key": "PAKNContent",
                    "title": "Nội dung",
                    "type": "textfield",
                    "contentPadding": null,
                    "isRequired": true,
                    "enable": true,
                    "maxLength": null,
                    "hintText": "Nhập nội dung",
                    "contentValidateEmpty": "Nội dung PAKN không được để trống",
                    "errorBorderColor": "#D4D7DA",
                    "focusBorderColor": "#D4D7DA",
                    "borderColor": "#D4D7DA",
                    "isPassword": false,
                    "textSize": null,
                    "textColor": null,
                    "readOnly": false,
                    "maxLines": 4,
                  },
                  {
                    "type": "text",
                    "key": "news",
                    "title":
                        "Nội dung này sẽ được công khai, vui lòng không ghi chi tiết thông tin cá nhân",
                    "titleColor": "#C10800",
                    "titleSize": 14.0,
                    "fontWeight": "normal",
                  },
                ],
                "width": 6,
                "offset": 0,
                "push": 0,
                "pull": 0,
                "size": "md",
                "currentWidth": 6
              },

            ],
            "key": "columns",
            "type": "columns",
            "input": false,
            "tableView": false
          }
        ],
        "input": false,
        "tableView": false,
        "breadcrumbClickable": true,
        "buttonSettings": {
          "previous": true,
          "cancel": true,
          "next": true
        },
        "navigateOnEnter": false,
        "saveOnEnter": false,
        "scrollToTop": false,
        "collapsible": false,
        "description": "Chưa thực hiện",
        "collapsed": false,
        "showtitleMenu": true,
        "titleMenu": "Các bước thực hiện",
        "customguide": "Hướng dẫn Công dân kiểm tra lại thông tin cơ quan tiếp nhận. Nhấn chọn Tiếp theo và thực hiện các bước để hoàn thành quá trình nộp hồ sơ.",
        "customConditional": "",
        "customperformed": "Đang thực hiện"
      },
    ]
  };
}
