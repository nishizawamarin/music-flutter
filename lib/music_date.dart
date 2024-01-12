import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task33/music_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final List<Map<String,dynamic>> musicData = [
  {'title': 'A to Z', 'image': 'https://pbs.twimg.com/media/GAKaO_fbYAAhqm4.jpg:large',
    'artist':'PRODUCE 101 JAPAN THE GIRLS'},
  {'title': 'O.O.O (Over&Over&Over)', 'image': 'https://stat.ameba.jp/user_images/20210815/16/gggminyun/ac/02/j/o0600060014987207527.jpg',
    'artist':'Girls Planet 999'},
  {'title': 'YES or YES', 'image': 'https://www.billboard-japan.com/scale/news/00000109/109929/800x_image.jpg',
    'artist':'TWICE'},
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff474a4d),
        centerTitle: true,
        title: const Text("ホーム",
          style: TextStyle(
              color: Colors.white
          ),
        ),
        actions: [IconButton(
          icon: const Icon(Icons.search,color: Colors.white,),
          onPressed: () {},
        ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon:Icon(Icons.home_outlined,color: Colors.white,),
              label: 'ホーム'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.search,color: Colors.white,),
              label: '検索'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.playlist_play,color: Colors.white,),
              label: 'プレイリスト'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.account_circle_outlined,color: Colors.white,),
              label: 'アカウント'
          ),
        ],
        backgroundColor:Colors.black,

      ),
      backgroundColor: const Color(0xff383c3c),
      body:   Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget> [
            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                SizedBox(width: 20,),
                Text('あなたへのおすすめ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios,color: Colors.white,),
                SizedBox(width: 20,),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: musicData.length,
                  itemBuilder: (context,  index) {
                    return GestureDetector(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>const musicplayer()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Image.network(
                              musicData[index]['image'],
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              musicData[index]['title'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              musicData[index]['artist'],
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 SizedBox(width: 20,),
                   Text('カテゴリー',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios,color: Colors.white,),
                SizedBox(width: 20,),
              ],
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 250,
              width: 400,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 2,
                children: [
                  _buildCategoryTile('クラシック',Colors.purple,Colors.deepPurple),
                  _buildCategoryTile('ポップ',Colors.pinkAccent,Colors.pink),
                  _buildCategoryTile('ジャズ',Colors.lightGreenAccent,Colors.lightGreen),
                  _buildCategoryTile('カントリー',Colors.yellow,Colors.brown),
                  _buildCategoryTile('ロック',Colors.lightBlue,Colors.blue),
                  _buildCategoryTile('パンク',Colors.redAccent,Colors.red),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  @override
  Widget _buildCategoryTile(String categoryName,Color startColor, Color endColor){
    return Container(
      height: 100,
      width: 200,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [startColor, endColor],
        ),
      ),
      child: Center(
        child: Text(
          categoryName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}