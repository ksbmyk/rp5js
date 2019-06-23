
def setup
  @fibo = [0, 1]
  P5.create_canvas(500, 500)
  P5.color_mode(P5.HSB, 1)
  draw_square()
end

def draw
end

def draw_square
  xPos = 0  #正方形のx位置
  yPos = 0  #正方形のy位置
  nextFibo = next_fibo(@fibo)
  scalar = P5.width / nextFibo # 長方形がウィンドウ幅に収まるように拡大
  P5.background(0, 0, 1) # 描画ごとに背景を白く塗りつぶし

  P5.rect(5, 5, 5, 5) # TODO 描画テスト用
end

def mouse_clicked
  nextFibo = next_fibo(@fibo)
  @fibo = P5.append(@fibo, nextFibo)
  draw_square
end

# 次のフィボナッチ数(漸化式)
def next_fibo(fibo)
  fibo[fibo.length-2] + fibo[fibo.length-1]
end
