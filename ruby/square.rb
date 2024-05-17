def setup
  @fibo = [0, 1]
  P5.createCanvas(1000, 1000)
  P5.colorMode(P5.HSB, 1)
  draw_square()
end

def draw
end

def draw_square
  x_pos = 0  #正方形のx位置
  y_pos = 0  #正方形のy位置
  scalar = (P5.width - 1) / next_fibo(@fibo) # 長方形がウィンドウ幅に収まるように拡大
  P5.background(0, 0, 1) # 描画ごとに背景を白く塗りつぶし

  (1...@fibo.length).each do |i|
    P5.fill((0.1 * i) % 1, 1, 1)
    P5.rect(scalar * x_pos, scalar * y_pos, scalar * @fibo[i], scalar * @fibo[i])
    if i.odd?
      x_pos += @fibo[i]
      y_pos -= @fibo[i-1]
    else
      x_pos -= @fibo[i-1]
      y_pos += @fibo[i]
    end
  end
end

def mouse_clicked
  @fibo = P5.append(@fibo, next_fibo(@fibo))
  draw_square
end

# 次のフィボナッチ数(漸化式)
def next_fibo(fibo)
  fibo[fibo.length-2] + fibo[fibo.length-1]
end
