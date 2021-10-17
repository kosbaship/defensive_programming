import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_screen/database/remote/api_helper.dart';
import 'package:settings_screen/models/user_model.dart';
import 'package:settings_screen/shared/app_components.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: ApiHelper.getInstance.getUsers(),
            builder:
                (BuildContext context, AsyncSnapshot<List<UserData>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return CustomErrorWidget(
                      errorMessage: 'Nothing happened !!!');
                  break;
                case ConnectionState.waiting:
                  return CustomLoadingWidget();
                  break;
                case ConnectionState.active:
                  return CustomLoadingWidget();
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return CustomErrorWidget(errorMessage: '${snapshot.error}');
                  } else {
                    if (!snapshot.hasData) {
                      return CustomErrorWidget(errorMessage: 'No Data');
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => CustomUserCardItem(
                            userData: snapshot.data[index],
                          ),
                          itemCount: snapshot.data.length,
                        ),
                      );
                    }
                  }
                  break;
              }
              return Container(
                color: Colors.deepOrange,
                width: double.infinity,
                height: 250.0,
              );
            },
          ),
        ),
      );
}

class CustomUserCardItem extends StatelessWidget {
  final UserData userData;

  const CustomUserCardItem({@required this.userData});

  @override
  Widget build(BuildContext context) => Card(
          child: Container(
        color: Colors.amber,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.red.withOpacity(0.3),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 75,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 65,
                    child: Image(
                      image: NetworkImage(
                        userData.id < 4 && userData.id >= 2
                            ? 'https://avatars.githubusercontent.com/u/49769315?v=4'
                            : 'https://thumbs.dreamstime.com/b/concept-open-magic-book-pages-water-land-small-child-fantasy-nature-learning-copy-space-166401875.jpg',
                      ),
                      loadingBuilder: (context, image, loadingProgress) {
                        if (loadingProgress == null) return image;

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),
            SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "${userData.phone}",
                      style: TextStyle(fontSize: 32),
                    ),
                    Text(
                      "${userData.username}",
                      style: TextStyle(fontSize: 26),
                    ),
                    Text(
                      "${userData.email}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              flex: 2,
            ),
          ],
        ),
      ));
}
