var numA = 10;
var numB = 6;
var ratio = numB / numA;
var thr = 160;  //しきい値
function setup(){
  createCanvas(500, 500);
  colorMode(HSB, 1);
  divSquare(0, 0, width); //正方形の分割
}

//位置(xPos,yPos)にある1辺がwdの正方形を縦横比がnumA:numBの長方形で分割する
function divSquare(xPos, yPos, wd){
  var itr = 0;
  var xEndPos = wd + xPos;
  var yEndPos = wd + yPos;
  fill(color(random(1), 1, 1));
  rect(xPos, yPos, wd, wd);
  while (wd > thr){  //wdがしきい値以上の場合に処理を行う
    itr++;
    if (itr % 2 == 1){
      while (xPos + wd * ratio < xEndPos + 0.1){
        divRect(xPos, yPos, wd * ratio);  //長方形を分割する関数の呼び出し
        xPos += wd * ratio;
      }
      wd = xEndPos - xPos;
    } else {
      while (yPos + wd / ratio < yEndPos + 0.1){
        divRect(xPos, yPos, wd);  //長方形を分割する関数の呼び出し
        yPos += wd / ratio;
      }
      wd = yEndPos - yPos;
    }
  }
}

function divRect(xPos, yPos, wd){
  var itr = 0;
  var xEndPos = xPos + wd;
  var yEndPos = yPos + wd / ratio;
  fill(color(random(1), 1, 1));
  rect(xPos, yPos, wd, wd / ratio);
  while (wd > thr){   //長方形の幅がしきい値以上の場合に処理を行う
    itr++;
    if (itr % 2 == 0){
      while (xPos + wd < xEndPos + 0.1){
        divSquare(xPos, yPos, wd);  //正方形を分割する関数の呼び出し
        xPos += wd;
      }
      wd = xEndPos - xPos;
    } else {
      while (yPos + wd < yEndPos + 0.1){
        divSquare(xPos, yPos, wd);  //正方形を分割する関数の呼び出し
        yPos += wd;
      }
      wd = yEndPos - yPos;
    }
  }
}

function mouseClicked(){
  numA = random(1, 20);  //1以上20以下のランダムな整数を代入
  numB = random(1, 20);
  while (numA == numB){ //numAとnumBが異なるようにする
    numB = random(1, 20);
  }
  thr = random(10,300);
  print("numA =", numA, "numB =", numB,"thr =", thr);  //numA,numB,thrの値を表示
  ratio = numA / numB;
  background(0, 0, 1);  //背景を白で消去
  divSquare(0, 0, width);
}
function draw(){} //プログラムを実行している間，繰り返し実行する関数
