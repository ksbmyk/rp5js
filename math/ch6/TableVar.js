var mod = 5;  //法とする自然数
function setup(){
  var scalar = width / mod; //拡大比率
  createCanvas(500, 500);

  for (var i = 0; i < mod; i++){
    for (var j = 0; j < mod; j++){
      var num = (i + j) % mod;  //数の計算
      var v = createVector(j, i);  //マスの位置 new PVectro() -> createVector()
      v.mult(scalar);

      // fill(255);  //マスを白くする
      // rect(v.x, v.y, scalar, scalar); //マスの描画
      // fill(0);  //数字を黒くする
      // textSize(scalar);
      // text(num, v.x, v.y + scalar);  //数字の表示

      // 色相に対応
      fill(num * 1.0 / mod, 1, 1);  //数を円の色相に対応
      noStroke();
      ellipse(v.x, v.y, scalar / 2, scalar / 2);
      // 円の大きさに対応
      fill(0, 0, 0);
      ellipse(v.x, v.y, scalar * num / mod, scalar * num / mod);  //数を円の直径に対応
    }
  }
}
