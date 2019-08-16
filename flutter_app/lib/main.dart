import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
  //페이지에 대한 상태를 초기화하여 넣어주고 리턴
}

class RandomWordsState extends State<RandomWords> {
  //페이지 상태 정의해주기
  final _suggestions = <WordPair>[];//wordpair페키지의 객체를 배열로 담아주자
  final _biggerFont = const TextStyle(fontSize: 18.0);//단어 스타일 설정
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions()
    );
  }//여기는 빌드시에 들어가는 xml이 들어간다고 보면 될 듯하다.
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {//(context, i)빌드에 들어가는 변수... i는 index를 의미하는 듯
          if (i%2== 1) return Divider();//리스트에 선만 넣고 끝남

          final index = i ~/ 2; /*3*/
          //단어 선 단어... 반복... 이기 때문에 반으로 나누어서 현제 리스트 뷰에 몇개가 담겨 있는지 확인
          if (index >= _suggestions.length) {//리스트에 담겨 있는 단어의 수가 단어를 담아 둔 배열이랑 같아지면
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
            //10개의 새로운 단어를 만들어서 배열에 넣어주자.
          }
          return _buildRow(_suggestions[index]);//각 아이템을 초기화 시켜서 리스트로 만들어 주고 빼는 듯
        });
  }//플루터는 페이지를 위젯으로 표현하는 듯하다.

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont
      ),
    );
  }


}