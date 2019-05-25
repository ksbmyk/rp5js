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
end

def colorRect(xPos, yPos, wd, ht)
end

def divSquare(xPos, yPos, wd)
end

def divRect(xPos, yPos, wd)
end
