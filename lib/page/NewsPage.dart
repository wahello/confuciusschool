import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/model/NewsInfo.dart';
import 'package:confuciusschool/page/AudioPlayPage.dart';
import 'package:confuciusschool/page/NewsDetailPage.dart';
import 'package:confuciusschool/page/VideoPlayPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends BaseState {
  List<NewsInfo> data;
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getNews((data){
      setState(() {
        this.data = data;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "我的消息");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return data == null ? LoadingUtils.getRingLoading() : Container(
      child: getList(),
    );
  }
  Widget getList(){

    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: getRow,
          itemCount: data.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getRow(BuildContext context,int index){
    NewsInfo newsInfo = data[index];
    return GestureDetector(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
        margin: EdgeInsets.only(top: DefaultValue.topMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("${newsInfo.ititle}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0
              ),),
            LinsUtils.getWidthLins(context),
            Container(
              margin:EdgeInsets.only(top: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("${newsInfo.about}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: DefaultValue.textSize
                      ),),
                  ),
                  Image.asset("images/home01_all_gengduo.png",width: 9.0,height: 15.0,)
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
        if(newsInfo.type == 1){
          NavigatorUtils.push(context, new VideoPlayPage(newsInfo.currid.toString(),newsInfo.pid.toString(),1));
        }else if(newsInfo.type == 2){
          NavigatorUtils.push(context, new AudioPlayPage(newsInfo.currid.toString(),newsInfo.pid.toString(),1));
        }else{
          NavigatorUtils.push(context, new NewsDetailPage(newsInfo));
        }

      },
    );
  }

}