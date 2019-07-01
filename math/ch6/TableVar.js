var mod = 5;  //法とする自然数
function setup(){
  var scalar = width / mod; //拡大比率
  createCanvas(500, 500);

for (var i = 0; i < mod; i++){
  for (var j = 0; j < mod; j++){
    var num = (i + j) % mod;  //数の計算
    var v = createVector(j, i);  //マスの位置 new PVectro() -> createVector()
    v.mult(scalar);
    var num = (i * j) % mod;  //乗法表の場合
    fill(255);  //マスを白くする
    rect(v.x, v.y, scalar, scalar); //マスの描画
    fill(0);  //数字を黒くする
    textSize(scalar);
    text(num, v.x, v.y + scalar);  //数字の表示
    }
  }
}
