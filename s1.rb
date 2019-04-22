LINE_RADIUS = 8
LINE_SPEED = 3

def setup
  P5.createCanvas(480, 240)
  P5.background(96)
  P5.noStroke

  @x = @y = LINE_RADIUS
  @vx = @vy = LINE_SPEED
end

def draw
  P5.fill(96, 8)
  P5.rect(0, 0, P5.width, P5.height)

  @x += @vx
  @y += @vy

  @vx *= -1 if @x <= LINE_RADIUS || @x >= P5.width - LINE_RADIUS
  @vy *= -1 if @y <= LINE_RADIUS || @y >= P5.height - LINE_RADIUS

  P5.fill(255, 204, 0)
  P5.ellipse(@x, @y, LINE_RADIUS * 2, LINE_RADIUS * 2)
end
