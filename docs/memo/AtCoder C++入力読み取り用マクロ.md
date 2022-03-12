# AtCoder C++入力読み取り用マクロ
## 概要
AtCoderにて毎回入力する内容を書くのが面倒臭いので、
変数名を指定すれば、入力読み取りしてくれるマクロを作りました。

## 数指定の入力
はじめに入力する数が指定され、その後指定された数だけ値が入力される場合

```cpp

`#define` INPUT1(n, array)                                                           \
    int n;                                                                     \
    std::cin >> n;                                                             \
    std::vector<int> array(n);                                                     \
    for(int i = 0; i < n; i++) {                                               \
        std::cin >> a[i];                                                      \
    }
```

#### 使い方
```:入力
5
1 2 3 4 5
```


```cpp
`#include` <bits/stdc++.h>
using namespace std;

`#define` INPUT1(n, array)                                                           \
    int n;                                                                     \
    std::cin >> n;                                                             \
    std::vector<int> array(n);                                                     \
    for(int i = 0; i < n; i++) {                                               \
        std::cin >> a[i];                                                      \
    }

int main(){
 INPUT(num,array);//入力読み取り

 //読み取り内容確認
 cout << n << endll;
 for(const auto a : array){
  cout << a << endl;
 }

 return 0;
}
```


### 数指定の入力（二次元）
はじめに幅と高さが指定され、その後指定された数だけ値が入力される場合

```cpp

`#define` INPUT2(x, y, field)                                                    \
    int x, y;                                                                  \
    std::cin >> x >> y;                                                        \
    std::vector<std::vector<int>> field(y, std::vector<int>(x));               \
    for(int i = 0; i < y; i++) {                                               \
        for(int j = 0; j < x; j++) {                                           \
            std::cin >> field[i][j];                                           \
        }                                                                      \
    }
```

#### 使い方
```:入力
3 4
1 2 3
4 5 6
7 8 9
10 11 12
```


```cpp
`#include` <bits/stdc++.h>
using namespace std;

`#define` INPUT2(x, y, field)                                                    \
    int x, y;                                                                  \
    std::cin >> x >> y;                                                        \
    std::vector<std::vector<int>> field(y, std::vector<int>(x));               \
    for(int i = 0; i < y; i++) {                                               \
        for(int j = 0; j < x; j++) {                                           \
            std::cin >> field[i][j];                                           \
        }                                                                      \
    }

int main(){
 INPUT2(x,y,field);//入力読み取り

 //読み取り内容確認
 cout << x << " " << y << endl;
 for(int i = 0; i < y; i++) {
        for(int j = 0; j < x; j++) {
          cout << field[i][j];
        }
      cout << endl;
    }

 return 0;
}
```
