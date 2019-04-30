// 縦横比がnumA:numBの長方形を正方形によって分割
var numA = 10;
var numB = 6;
// scalar：1つの数値で示される定数や変数のこと
var scalar = 50; //長方形の拡大倍率
numA *= scalar;  //数値の大きさを比較
numB *= scalar;

//変数に初期値設定
var wd = numB; //分割に使う正方形の幅の大きさ
var xPos = 0; //正方形のy位置
var yPos = 0; //正方形のy位置
var itr = 0; //分割の繰り返し 
var col;

function setup(){
  createCanvas(500, 500);
  colorMode(HSB, 1);
}

function draw(){
  while (wd > 0){ //幅が0になるまで繰り返す
    itr++;
    if (itr % 2 == 1){ //奇数回のとき
      while (xPos + wd <= numA){ //幅を足したときにnumAの幅を越えない間
        col = color(random(1), 1, 1);
        fill(col);
        rect(xPos, yPos, wd, wd); //x軸方向に正方形を追加
        xPos += wd;
      }
      wd = numA - xPos;
    }else{  //偶数回のとき
      while (yPos + wd <= numB){ //幅を足したときにnumBを越えない間
        col = color(random(1), 1, 1);
        fill(col);
        rect(xPos, yPos, wd, wd);　//y軸方向に正方形を追加
        yPos += wd;
      }
      wd = numB - yPos;
    }
  }
}
