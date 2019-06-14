NUM = 100
MOD = 20

def setup
  @gen = 0
  @state = Array.new(NUM).map{Array.new(NUM, 0)}
  P5.create_canvas(500, 500)
  P5.color_mode(P5.HSB, 1)
  @state[0][0] = 1
end

def draw
  drawCell
  updateState
  if @gen == 187
    P5.noLoop()
  end
  @gen += 1
end

def drawCell
  #scalar = P5.height / NUM
  scalar = 5.00 # 小数を扱いたい
  y = 0.0
  NUM.times do |i|
    x = 0.0
    NUM.times do |j|
      P5.noStroke()
      col = (@state[i][j] * 1.0) / MOD
      P5.fill(col, col, 1)
      P5.rect(x, y, scalar, scalar)
      x += scalar
    end
    y += scalar
  end
end

def updateState
  nextState = Array.new(NUM).map{Array.new(NUM, 0)}

  NUM.times do |i|
    NUM.times do |j|
      nextState[i][j] = transition(i, j)
    end
  end
  @state = nextState
end

def transition(i, j)
  nextC = @state[(i - 1 + NUM) % NUM][j]
    + @state[i][(j - 1 + NUM) % NUM]
    + @state[i][j]
    + @state[i][(j + 1) % NUM]
    + @state[(i + 1) % NUM][j]
  nextC % MOD
end
