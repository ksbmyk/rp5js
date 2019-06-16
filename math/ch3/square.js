var fibo = [0, 1]; // TODO フィボナッチ数列にする
function setup(){
  createCanvas(500, 500);
  colorMode(HSB, 1);
  drawSquare();
}
function drawSquare(){
  xPos = 0;  //正方形のx位置
  yPos = 0;  //正方形のy位置
  nextFibo = fibo[fibo.length-2] + fibo[fibo.length-1]; //次のフィボナッチ数
  scalar = width / nextFibo;  //長方形がウィンドウ幅に収まるように拡大
  background(0, 0, 1);  //描画ごとに背景を白く塗りつぶし
}
function mouseClicked() {
}
function draw(){

}
