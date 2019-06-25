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
  scalar = (P5.width - 1) / next_fibo(@fibo) # 長方形がウィンドウ幅に収まるように拡大
  P5.background(0, 0, 1) # 描画ごとに背景を白く塗りつぶし

  (1...@fibo.length).each do |i|
    P5.fill((0.1 * i) % 1, 1, 1)
    P5.rect(scalar * xPos, scalar * yPos, scalar * @fibo[i], scalar * @fibo[i])
    if i.odd?
      xPos += @fibo[i]
      yPos -= @fibo[i-1]
    else
      xPos -= @fibo[i-1]
      yPos += @fibo[i]
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
