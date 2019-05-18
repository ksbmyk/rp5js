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

function divSquare(x, y, width){

}
