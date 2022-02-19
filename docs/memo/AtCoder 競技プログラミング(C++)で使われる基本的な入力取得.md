# AtCoder 競技プログラミング(C++)で使われる基本的な入力取得
競技プログラミングをやってみようと思ったのですが、
毎問題で入力取得の記述に時間を取られるのがいやなので、
基本的な入力取得をまとめました。


## 入力

```input.txt
1
2 
3 4 5

5
1 2 3 4 5

3 4
1 2 3 4
5 6 7 8
9 10 11 12

1,2,3

string1 string2
string3
```

## C++で記述した入力取得

```main.cpp
`#include` <iostream>
`#include` <string>
`#include` <fstream>
using namespace std;

int main()
{
    //cinでファイルから読込
    ifstream in("input.txt");
    cin.rdbuf(in.rdbuf());


    //cinの高速化
    cin.tie(0);
    ios::sync_with_stdio(false);
    

    //通常の入力
    int a,b,c,d,e;
    cin >> a;
    cin >> b;
    cin >> c;
    cin >> d;
    cin >> e;
    cout << a << "," << b << ","<< c << ","<< d << ","<< e << endl;


    //数指定の入力
    int N;
    cin >> N;
    cout << N << endl;

    int n[N];
    for(int i = 0; i < N; i++){
        cin >> n[i];
        cout << n[i] << flush;
        i != N-1 ? cout << "," : cout << endl; ///一連の数字をカンマ区切りにし最後に改行を加える
    }


    //縦横の個数指定の入力
    int H,W;
    cin >> H;
    cin >> W;
    cout << H << "," << W << endl;

    int box[H][W];
    for(int i = 0; i < H; i++){
        for(int k = 0; k < W; k++){
        cin >> box[i][k];
        cout << box[i][k] << flush;
        k != W-1 ? cout << "," : cout << endl; //一連の数字をカンマ区切りにし最後に改行を加える
        }
    }


    //カンマ区切りの読込
    int f,g,h;
    cin >> f;
    cin.ignore();
    cin >> g;
    cin.ignore();
    cin >> h;
    cout << f << "," << g << ","<< h << endl;
    

    //文字列の読込
    string str[3];
    cin >> str[0];
    cin >> str[1];
    cin >> str[2];
    cout << str[0] << "," << str[1] << ","<< str[2] << endl;

    return 0;
}
```

## 出力結果
```out
1,2,3,4,5
5
1,2,3,4,5
3,4
1,2,3,4
5,6,7,8
9,10,11,12
1,2,3
string1,string2,string3
```

### 補足説明
#### cinでテキストファイルから読み込む
引用:[cin でテキストファイルから読み込み](https://qiita.com/_meki/items/559ff91f3e695de5600f)

以下の記述を頭につけることでcinの入力元をキーボードでなく
テキストファイルからにすることができます。
ローカルでテストする際に入力をいちいち打つのはめんどくさいが、
提出するコードは極力変えたくたいときに使うといいで。

```cpp

    //cinでファイルから読込
    ifstream in("input.txt");
    cin.rdbuf(in.rdbuf());
```

#### cinの動作を高速化
引用:[tshitaの備忘録Ⅱ C++入力の速度測定](http://tatanaideyo.hatenablog.com/entry/2014/10/24/214714)
以下のおまじないを書くとcinの動作が早くなるらしい。
scanfを使うともっと早いみたいだが、競プロ初心者のうちはそこまでこだわらなくても大丈夫かと思っている。

```cpp

    //cinの高速化
    cin.tie(0);
    ios::sync_with_stdio(false);
```
