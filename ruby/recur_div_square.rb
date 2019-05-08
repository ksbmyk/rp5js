def setup
  @numA = 10
  @numB = 6
  @ratio = @numB / @numA
  @thr = 160  #しきい値
  P5.createCanvas(500, 500)
  P5.colorMode(P5.HSB, 1)
  #divSquare(0, 0, width)
  divSquare(0, 0, 100)
end

#正方形の分割
def divSquare(xPos, yPos, wd)
  @itr = 0
  @xEndPos = wd + xPos
  @yEndPos = wd + yPos
  P5.fill(P5.color(P5.random(1), 1, 1))
  P5.rect(xPos, yPos, wd, wd)
end

def draw
end
