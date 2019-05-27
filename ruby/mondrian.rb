RATIO = (2.23606797749979 + 1) / 2 #比率 5の平方根に1足して2で割る
THR = 80  #分割する大きさに関するしきい値 TODO あとで名前考え直す
THR2 = 0.5 #確率を決定するしきい値

def setup
  P5.createCanvas(500, 500)
  P5.colorMode(P5.HSB, 1)
  colorRect(0, 0, P5.width - 1, P5.width - 1)
  divSquare(0, 0, P5.width - 1)
end

def draw
end

def mouseClicked
  thr = P5.random(10, 300)
  thr2 = P5.random(0,1)
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
end

def divRect(xPos, yPos, wd)
end
