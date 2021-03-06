import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/model/HomeInfo.dart';
import 'package:confuciusschool/page/NewsPage.dart';
import 'package:confuciusschool/page/SearchPage.dart';
import 'package:confuciusschool/page/SearchResultListPage.dart';
import 'package:confuciusschool/page/SignInPage.dart';
import 'package:confuciusschool/page/VideoPlayPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class AncientChinese extends StatefulWidget {
  @override
  _AncientChineseState createState() => _AncientChineseState();
}

class _AncientChineseState extends BaseState {
  HomeInfo homeInfo;
  var controller = new ScrollController();

    @override
  void initData() {
    // TODO: implement initState
    super.initData();
    api.getHomeData((data){
      setState((){
        this.homeInfo = data;
      });
    }, (msg){
//      ToastUtil.makeToast(msg);
    });
  }
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return null;
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
        return homeInfo == null ? LoadingUtils.getRingLoading() : SingleChildScrollView(
      controller: controller,
      child: Container(
        child: Column(
          children: <Widget>[
            getHead(),
            getSwiperBody(),
            getBtn(),
            getRecommend(),
            getFree(),
            getBoutique(),
            getSubscribe(),
            getMaster()
          ],
        ),
      ),
    );
  }

  Widget getHead(){
    double topPadding = MediaQuery.of(context).padding.top;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: topPadding),
      padding: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin,left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: GestureDetector(
              child: Image.asset("images/home01_qiandao.png",width: 25.0,height: 20.0,),
              onTap: (){
                NavigatorUtils.push(context, SignInPage());
              },
            )
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: Container(
                height: 28.0,
                margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
                decoration: new BoxDecoration(
                    border: new Border.all(width: 1.0,color:ColorsUtil.HerdBg ),
                    color: ColorsUtil.HerdBg,
                    borderRadius:  new BorderRadius.all(Radius.circular(20.0))
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                      child: Image.asset("images/home01_search.png",width: 15.0,height: 15.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                      child: Text("请输入关键字、视频名称",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: DefaultValue.textSize
                        ),),
                    ),
                  ],
                ),
              ),
              onTap: (){
                NavigatorUtils.push(context, new SearchResultListPage(0));
              },
            ),
          ),
          Expanded(
            flex: 0,
            child: GestureDetector(
              child: Image.asset("images/home01_xiaoxi.png",width: 25.0,height: 20.0,),
              onTap: (){
                NavigatorUtils.push(context, new NewsPage());
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget getBtn(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                NavigatorUtils.push(context, new SearchResultListPage(1));
              },
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home01_icon_guowen.png",width: 43.0,height: 43.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("国文",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: (){
                  NavigatorUtils.push(context, new SearchResultListPage(2));
                },
                child:Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset("images/home01_icon_guoyia.png",width: 43.0,height: 43.0,),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: DefaultValue.topMargin),
                        child: Text("国艺",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: DefaultValue.textSize
                          ),),
                      ),
                    ],
                  ),
                ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: (){
                  NavigatorUtils.push(context, new SearchResultListPage(3));
                },
                child:Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset("images/home01_icon_guoli.png",width: 43.0,height: 43.0,),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: DefaultValue.topMargin),
                        child: Text("国礼",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: DefaultValue.textSize
                          ),),
                      ),
                    ],
                  ),
                ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: (){
                  NavigatorUtils.push(context, new SearchResultListPage(4));
                },
                child:Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset("images/home01_icon_guoyib.png",width: 43.0,height: 43.0,),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: DefaultValue.topMargin),
                        child: Text("国医",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: DefaultValue.textSize
                          ),),
                      ),
                    ],
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
  Widget getSwiperBody(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160.0,
      color: Colors.white,
      alignment: Alignment.topCenter,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: homeInfo.lb.length,
        pagination: new SwiperPagination(),
        control: null,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: goBountyTask,

      ),
//      margin: EdgeInsets.only(top: 40.0,bottom: 40.0),
    );
  }
  Widget _swiperBuilder(BuildContext context, int index){

    Lb data = homeInfo.lb[index];
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new VideoPlayPage(data.currid.toString(),data.pid.toString(),1));
      },
      child: Image.network(homeInfo.lb[index].img,
        width: 180.0,
        height: 400.0,
        fit: BoxFit.fill,),
    );
  }
  void goBountyTask(int index){


  }
  Widget getRecommend(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20.0,bottom: DefaultValue.bottomMargin,left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
      child: Column(
        children: <Widget>[
          Text("今日推荐",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0
            ),),
          Container(
            margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
            child: Image.asset("images/home01_tuijian_xiahuaxian.png",width: 255.0,height: 1.0,),
          ),
          GestureDetector(
            onTap: (){
              NavigatorUtils.push(context, new VideoPlayPage(homeInfo.jr[0].currid.toString(),homeInfo.jr[0].id.toString(),1));
            },
            child: Image.network(homeInfo.jr[0].hcover,height: 150.0,width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
          )
        ],
      ),
    );
  }
  Widget getFree(){
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0,width: 2.0),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                      child: Text("免费体验",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.titleTextSize
                        ),),
                    ),
                  ),
                  Text("更多 >",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: DefaultValue.textSize
                    ),)
                ],
              ),
            ),
            onTap: (){
              NavigatorUtils.push(context, new SearchResultListPage(0));
            },
          )
          ,
          Container(
            height: 200.0,
            padding: EdgeInsets.only(left: 6.0,right: 6.0,top: DefaultValue.topMargin),
            child: GridView.builder(
                itemCount: homeInfo.re.length,
                controller: controller,
                padding: EdgeInsets.only(top: 0),
                physics: NeverScrollableScrollPhysics(),
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                    crossAxisCount: 3,
                    //纵轴间距
                    mainAxisSpacing: 0.0,
                    //横轴间距
                    crossAxisSpacing: 0.0,
//            //子组件宽高长度比例
                    childAspectRatio: 0.7
                ),
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return getItemContainer(homeInfo.re[index]);
                }),
          )
        ],
      ),
    );
  }
  Widget getItemContainer(Re data){
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new VideoPlayPage(data.currid.toString(),data.id.toString(),1));
      },
      child: Container(
        margin: EdgeInsets.only(left: 6.0,right: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.network(data.hcover,height: 125.0,fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(top: 4.0,bottom: DefaultValue.bottomMargin),
              child: Text(data.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0
                ),),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("images/home01_mianfeitiyan_huo.png",width: 13.0,height: 15.0,),
                  Container(
                    padding: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Text("${data.clicks}人在学习",
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: DefaultValue.smallTextSize
                      ),),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget getBoutique(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin),
              child: Row(
                children: <Widget>[
                  LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0,width: 2.0),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                      child: Text("精品推荐",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.titleTextSize
                        ),),
                    ),
                  ),
                  Text("更多 >",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: DefaultValue.textSize
                    ),)
                ],
              ),
            ),
            onTap: (){
              NavigatorUtils.push(context, new SearchResultListPage(0));
            },
          ),
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: DefaultValue.topMargin),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: getRow,
//                controller: controller,
                itemCount: homeInfo.sql.length,),
          )
        ],
      ),
    );
  }
  Widget getRow(BuildContext context,int index){
    Sql data = homeInfo.sql[index];
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new VideoPlayPage(data.currid.toString(),data.id.toString(),1));
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 130.0,
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 2.0,bottom: 2.0),
            child: Row(
              children: <Widget>[
                Image.network(data.hcover,width: 102.0,height: 133.0,fit: BoxFit.fill,),
                Container(
                  margin: EdgeInsets.only(left:16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                        child: Text(data.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0
                          ),),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                          child: Text(data.words,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11.0
                            ),),
                        ),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset("images/home01_mianfeitiyan_huo.png",width: 13.0,height: 15.0,),
                            Container(
                              padding: EdgeInsets.only(left: DefaultValue.leftMargin),
                              child: Text("${data.clicks}人在学习",
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: DefaultValue.smallTextSize
                                ),),
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          LinsUtils.getWidthLins(context)
        ],
      ) ,
    );
  }
  Widget getSubscribe(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin),
              child: Row(
                children: <Widget>[
                  LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0,width: 2.0),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                      child: Text("订阅专栏",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.titleTextSize
                        ),),
                    ),
                  ),
                  Text("更多 >",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: DefaultValue.textSize
                    ),)
                ],
              ),
            ),
            onTap: (){
              NavigatorUtils.push(context, new SearchResultListPage(0));
            },
          )
          ,
          Container(
            height: 350.0,
            padding: EdgeInsets.only(left: 6,right: 6),
            child: GridView.builder(
                itemCount: homeInfo.re.length,
                padding: EdgeInsets.only(top: DefaultValue.topMargin),
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                    crossAxisCount: 2,
                    //纵轴间距
                    mainAxisSpacing: 0.0,
                    //横轴间距
                    crossAxisSpacing: 0.0,
//            //子组件宽高长度比例
                    childAspectRatio: 1.1
                ),
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return getSubscribeItem(homeInfo.res[index]);
                }),
          )
        ],
      ),
    );
  }
  Widget getSubscribeItem(Res data){
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new VideoPlayPage(data.currid.toString(),data.id.toString(),1));
      },
      child: Container(
        margin: EdgeInsets.only(left: 6.0,right: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(data.hcover,width: 200.0,height: 105.0,fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: 4.0),
              child: Text(data.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0
                ),),
            ),
            Container(
              child: Text(data.words,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: DefaultValue.textSize
                ),),
            )
          ],
        ),
      ),
    );
  }
  Widget getMaster(){
      var height = 190.0 * homeInfo.ds.length;
      return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: DefaultValue.topMargin),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin),
                child: Row(
                  children: <Widget>[
                    LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0,width: 2.0),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                        child: Text("大师来了",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: DefaultValue.titleTextSize
                          ),),
                      ),
                    ),
                    Text("更多 >",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: DefaultValue.textSize
                      ),)
                  ],
                ),
              ),
              onTap: (){
                NavigatorUtils.push(context, new SearchResultListPage(0));
              },
            )
            ,
            Container(
              height: height,
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: DefaultValue.topMargin),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: getMasterRow,
                  controller: controller,
                  itemCount: homeInfo.ds.length,
                  scrollDirection: Axis.vertical),
            )
          ],
        ),
      );
  }
  Widget getMasterRow(BuildContext context,int index){
    Ds data = homeInfo.ds[index];
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new VideoPlayPage(data.currid.toString(),data.id.toString(),1));
      },
      child: Container(
        height: 190.0,
        padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 2.0,bottom: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(data.hcover,width: MediaQuery.of(context).size.width,height: 113.0,fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(top: DefaultValue.topMargin),
              child: Text(data.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0
                ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 4.0),
              child: Text(data.words,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11.0
                ),),
            )
          ],
        ),
      ),
    );
  }

}