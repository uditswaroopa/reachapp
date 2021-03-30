import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../posts/create_post.dart';
//import 'file:///C:/Users/success/social_media_app/lib/posts/create_post.dart';

class FabContainer extends StatelessWidget {
  final Widget page;
  final IconData icon;
  final bool mini;

  FabContainer({@required this.page, @required this.icon, this.mini = false});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (BuildContext context, VoidCallback _) {
        return page;
      },
      closedElevation: 2.0,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(56 / 2),
        ),
      ),
      closedColor: Theme.of(context).scaffoldBackgroundColor,
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            icon,
            color: Theme.of(context).accentColor,
            size: 27,
          ),
          onPressed: () {
            chooseUpload(context);
          },
          mini: mini,
        );
      },
    );
  }

  chooseUpload(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: .2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10.0,
                width: MediaQuery.of(context).size.width,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //   child: Center(
              //     child: Text(
              //       'SELECT',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: Theme.of(context).accentColor),
              //     ),
              //   ),
              // ),
              Center(
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.camera_on_rectangle,
                    size: 25.0,
                  ),
                  title: Text('Make a Post'),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => CreatePost()));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
