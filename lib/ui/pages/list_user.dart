part of 'pages.dart';

class ListUser extends StatefulWidget {
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: (){
              UserService.getUser().then((value){
                print(value);
              });
            },
          )
        ],
      ),

      body: SafeArea(
        child: FutureBuilder(
          future: UserService.getUser(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snap){
            if(snap.hasData){
              return ListView.builder(
                itemCount: snap.data.length,
                itemBuilder: (BuildContext context, i){
                  User user = snap.data[i];

                  return Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.title, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(user.subtitle ?? '')
                      ],
                    ),
                  );
                },
              );
            }else{
              return Container();
            }
          },
        ),
      ),
    );
  }
}