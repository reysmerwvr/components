import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AvatarPage"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTE1ODA0OTcyMDMzNTQxNjQ1/pope-francis-21152349-2-402.jpg"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("RV"),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage("assets/jar-loading.gif"),
          image: NetworkImage(
              "https://cdn.vox-cdn.com/thumbor/27ENb0Rasj03J9tVGH3RgVFgNkU=/0x0:1000x667/920x613/filters:focal(540x229:700x389):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/59000887/pope-francis.0.0.jpg"),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
