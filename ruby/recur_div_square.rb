def setup
  @numA = 10
  @numB = 6
  @ratio = @numB / @numA
  @thr = 160  #しきい値
  P5.createCanvas(500, 500)
  P5.colorMode(P5.HSB, 1)
  divSquare(0, 0, P5.width-1)
end

#正方形の分割
def divSquare(x, y, width)
  xPos = x
  yPos = y
  wd = width
  itr = 0
  xEndPos = wd + xPos
  yEndPos = wd + yPos
  P5.fill(P5.color(P5.random(1), 1, 1))
  P5.rect(xPos, yPos, wd, wd)
  while wd > @thr do
    itr += 1
    if (itr % 2 == 1)
      while (xPos + wd * @ratio < xEndPos + 0.1) do
        divRect(xPos, yPos, wd * @ratio)
        xPos += wd * @ratio
      end
      wd = xEndPos - xPos;
    else
      while (yPos + wd / @ratio < yEndPos + 0.1) do
        divRect(xPos, yPos, wd)
        yPos += wd / @ratio
      end
      wd = yEndPos - yPos
    end
  end
end

#長方形を分割する関数
def divRect(x, y, width)
  xPos = x
  yPos = y
  wd = width
  itr = 0
  xEndPos = wd + xPos
  yEndPos = wd + yPos
  P5.fill(P5.color(P5.random(1), 1, 1))
  P5.rect(xPos, yPos, wd, wd)
  while (wd > @thr) do
    itr += 1
    if itr % 2 == 0
      while (xPos + wd < xEndPos + 0.1) do
        divSquare(xPos, yPos, wd)
        xPos += wd
      end
      wd = xEndPos - xPos
    else
      while (yPos + wd < yEndPos + 0.1) do
        divSquare(xPos, yPos, wd)
        yPos += wd
      end
      wd = yEndPos - yPos
    end
  end
end

def draw
end
