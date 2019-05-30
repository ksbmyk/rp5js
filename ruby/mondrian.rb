RATIO = (2.23606797749979 + 1) / 2 #比率 5の平方根に1足して2で割る

def setup
  @thr = 80  #分割する大きさに関するしきい値 TODO あとで名前考え直す
  @thr2 = 0.5 #確率を決定するしきい値
  P5.create_canvas(500, 500)
  P5.colorMode(P5.HSB, 1)
  colorRect(0, 0, P5.width - 1, P5.width - 1)
  divSquare(0, 0, P5.width - 1)
end

def draw
end

def mouse_clicked
  @thr = P5.random(10, 300)
  @thr2 = P5.random(0,1)
  colorRect(0, 0, P5.width - 1, P5.width - 1)
  divSquare(0, 0, P5.width - 1)
end

def colorRect(xPos, yPos, wd, ht)
  val = P5.random(1)
  if (val < 0.15)  #15%の確率
    col = P5.color(0, 1, 1) #赤
  elsif (val < 0.3) #15%の確率
    col = P5.color(2.0 / 3, 1, 1) #青
  elsif (val < 0.45)  #15%の確率
    col = P5.color(1.0 / 6, 1, 1) #黄
  elsif (val < 0.5) #5%の確率
    col = P5.color(0, 1, 0) #黒
  elsif (val < 0.7)  #20%の確率
    col = P5.color(0, 0, 0.9) #灰
  else   #30%の確率
    col = P5.color(0, 0, 1) #白
  end
  P5.fill(col)
  P5.strokeWeight(5)  #長方形の枠線の太さ
  P5.rect(xPos, yPos, wd, ht)
end

def divSquare(xPos, yPos, wd)
  itr = 0
  xEndPos = wd + xPos  #正方形の横の長さ
  yEndPos = wd + yPos  #正方形の縦の長さ
  while wd > @thr do  #正方形の幅がしきい値以上の場合に実行
    itr += 1
    if itr % 2 == 1
      while (xPos + wd * RATIO < xEndPos + 0.1) do
        colorRect(xPos, yPos, wd * RATIO, wd)  #長方形を描く
        if P5.random(1) < @thr2  #thr2の確率で再分割
          divRect(xPos, yPos, wd * RATIO)  #長方形を分割する関数の呼び出し
        end
        xPos += wd * RATIO
      end
      wd = xEndPos - xPos
    else
      while (yPos + wd / RATIO < yEndPos + 0.1) do
        colorRect(xPos, yPos, wd, wd / RATIO)  #長方形を描く
        if P5.random(1) < @thr2  #thr2の確率で再分割
          divRect(xPos, yPos, wd)  #長方形を分割する関数の呼び出し
        end
        yPos += wd / RATIO
      end
      wd = yEndPos - yPos
    end
  end
end

def divRect(xPos, yPos, wd)
  itr = 0
  xEndPos = xPos + wd  #長方形の横の長さ
  yEndPos = yPos + wd / RATIO   #長方形の縦の長さ
  while (wd > @thr)   #wdがしきい値以上の場合に処理を行う
    itr += 1
    if (itr % 2 == 0)
      while (xPos + wd < xEndPos + 0.1) do
        colorRect(xPos, yPos, wd, wd)  #正方形を描く
        if (P5.random(1) < @thr2)
          divSquare(xPos, yPos, wd)  #正方形を分割する関数の呼び出し
        end
        xPos += wd
      end
      wd = xEndPos - xPos
    else
      while (yPos + wd < yEndPos + 0.1) do
        colorRect(xPos, yPos, wd, wd)  #正方形を描く
        if (P5.random(1) < @thr2)
          divSquare(xPos, yPos, wd)  #正方形を分割する関数の呼び出し
        end
        yPos += wd
      end
      wd = yEndPos - yPos
    end
  end
end
