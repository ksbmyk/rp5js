NUMA = 10
NUMB = 6
SCALAR = 50

def setup
  @numA = NUMA * SCALAR
  @numB = NUMB * SCALAR
  @wd = @numB
  @xPos = 0
  @yPos = 0
  @itr = 0
  P5.createCanvas(600, 600)
  # HSB, 色相の範囲, 彩度の範囲, 明度の範囲
  P5.color_mode(P5.HSB, 1, 100, 100)
end

def draw
  while (@wd > 0) do
    @itr += 1
    if (@itr % 2 == 1)
      while (@xPos + @wd <= @numA) do
        P5.stroke(0,0,60)
        P5.fill(color_code)
        P5.rect(@xPos, @yPos, @wd, @wd)
        @xPos += @wd
      end
      @wd = @numA - @xPos
    else
      while (@yPos + @wd <= @numB) do
        P5.stroke(0,0,60)
        P5.fill(color_code)
        P5.rect(@xPos, @yPos, @wd, @wd)
        @yPos += @wd
      end
      @wd = @numB - @yPos
    end
  end
end

def color_code
  # 色相の値, 彩度の値, 明度の値
  # 彩度を低くして淡い色にした
  P5.color(P5.random(1), 10, 99)
end
