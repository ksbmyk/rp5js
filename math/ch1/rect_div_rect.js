//縦横比がnumB:numAの長方形を逆の比の長方形によって分割
var numA = 10;
var numB = 6;
var ratio = numB / numA;

function setup(){ //最初に1度だけ実行する関数
  createCanvas(500, 500);
  colorMode(HSB, 1);
  //この関数内だけのローカル変数
  var itr = 0;
  var xPos = 0;
  var yPos = 0;
  var wd = width * ratio;
  while (wd > 0.1){
    itr++;
    if (itr % 2 == 1){
      while (xPos + wd < width + 0.1){
        divSquare(xPos, yPos, wd);  //正方形を分割する関数の呼び出し
        xPos += wd;
      }
      wd = width - xPos;
    } else {
      while (yPos + wd < width * ratio + 0.1){
        divSquare(xPos, yPos, wd);  //正方形を分割する関数の呼び出し
        yPos += wd;
      }
      wd = width * ratio - yPos;
    }
  }
}


//位置(xPos,yPos)にある1辺がwdの正方形を縦横比がnumA:numBの長方形で分割する
function divSquare(xPos, yPos, wd){
  //この関数内だけのローカル変数
  var itr = 0;
  var xEndPos = wd + xPos;  //正方形の右下の頂点のx座標
  var yEndPos = wd + yPos;  //正方形の右下の頂点のy座標
  //繰り返し処理
  while (wd > 0.1){
    itr++;
    if (itr % 2 == 1){
      while (xPos + wd * ratio < xEndPos + 0.1){  //ratioはグローバル変数
        fill(color(random(1), 1, 1));
        rect(xPos, yPos, wd * ratio, wd);
        xPos += wd * ratio;
      }
      wd = xEndPos - xPos;
    } else {
      while (yPos + wd / ratio < yEndPos + 0.1){
        fill(color(random(1), 1, 1));
        rect(xPos, yPos, wd, wd / ratio);
        yPos += wd / ratio;
      }
      wd = yEndPos - yPos;
    }
  }
}
