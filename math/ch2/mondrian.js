var ratio = (sqrt(5) + 1) / 2;  //黄金数 //sqrt is not defined
var thr = 80;  //float 分割する大きさに関するしきい値
var thr2 = 0.5; //確率を決定するしきい値

function setup(){
  createCanvas(500, 500);
  colorMode(HSB, 1);
  colorRect(0, 0, width, width);
  divSquare(0, 0, width);
}

function colorRect(xPos, yPos, wd, ht){
  let col;
  var val = random(1);
  if (val < 0.15){  //15%の確率
    col = color(0, 1, 1); //赤
  }else if (val < 0.3){ //15%の確率
    col = color(2.0 / 3, 1, 1); //青
  }else if (val < 0.45){  //15%の確率
    col = color(1.0 / 6, 1, 1); //黄
  }else if (val < 0.5){ //5%の確率
    col = color(0, 1, 0); //黒
  } else if (val < 0.7){  //20%の確率
    col = color(0, 0, 0.9); //灰
  } else {  //30%の確率
    col = color(0, 0, 1); //白
  }
  fill(col);
  strokeWeight(5);  //長方形の枠線の太さ
  rect(xPos, yPos, wd, ht);
}

function divSquare(xPos, yPos, wd){
  var itr = 0;
  var xEndPos = wd + xPos;  //正方形の横の長さ
  var yEndPos = wd + yPos;  //正方形の縦の長さ
  while (wd > thr){  //正方形の幅がしきい値以上の場合に実行
    itr++;
    if (itr % 2 ==1){
      while (xPos + wd * ratio < xEndPos + 0.1){
        colorRect(xPos, yPos, wd * ratio, wd);  //長方形を描く
        if (random(1) < thr2){  //thr2の確率で再分割
          divRect(xPos, yPos, wd * ratio);  //長方形を分割する関数の呼び出し
        }
        xPos += wd * ratio;
      }
      wd = xEndPos - xPos;
    } else {
      while (yPos + wd / ratio < yEndPos + 0.1){
        colorRect(xPos, yPos, wd, wd / ratio);  //長方形を描く
        if (random(1) < thr2){  //thr2の確率で再分割
          divRect(xPos, yPos, wd);  //長方形を分割する関数の呼び出し
        }
        yPos += wd / ratio;
      }
      wd = yEndPos - yPos;
    }
  }
}

function divRect(xPos, yPos, wd){　//長方形を分割する関数
  var itr = 0;
  var xEndPos = xPos + wd;  //長方形の横の長さ
  var yEndPos = yPos + wd / ratio;   //長方形の縦の長さ
  while (wd > thr){   //wdがしきい値以上の場合に処理を行う
    itr++;
    if (itr % 2 == 0){
      while (xPos + wd < xEndPos + 0.1){
        colorRect(xPos, yPos, wd, wd);  //正方形を描く
        if (random(1) < thr2){
          divSquare(xPos, yPos, wd);  //正方形を分割する関数の呼び出し
        }
        xPos += wd;
      }
      wd = xEndPos - xPos;
    } else {
      while (yPos + wd < yEndPos + 0.1){
        colorRect(xPos, yPos, wd, wd);  //正方形を描く
        if (random(1) < thr2){
          divSquare(xPos, yPos, wd);  //正方形を分割する関数の呼び出し
        }
        yPos += wd;
      }
      wd = yEndPos - yPos;
    }
  }
}

function mouseClicked(){
  thr = int(random(10, 300));
  thr2 = random(0,1);
  console.log("thr =", thr, "thr2 =", thr2);
  colorRect(0, 0, width, width);
  divSquare(0, 0, width);
}
function draw(){}
