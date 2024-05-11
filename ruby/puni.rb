def setup
  split = 9
  size = P5.windowWidth
  @base = size / split
  @colors = ["#B6E3FF", "#54AEFF", "#0969DA", "#0A3069"]

  P5.createCanvas(size, size)
  P5.angleMode(P5.DEGREES)
  P5.noLoop
end

def draw
  puni
end

def puni
  P5.background(255)
  half = @base / 2
  double = @base * 2
  x = half
  while x < P5.width do
    y = half
    while y < P5.width do
      P5.noStroke
      c = rand(0..3)
      P5.fill(@colors[c])
      P5.ellipse(x, y, @base, @base)
      P5.arc(x - half, y - half, double, double, 0, 90)

      P5.stroke(255)
      P5.strokeWeight(5)
      P5.noFill
      P5.arc(x - half, y - half, double - 20, double - 20, 0, 15)
      P5.arc(x - half, y - half, double - 20, double - 20, 81, 83)
      P5.arc(x , y , @base - 20, @base  - 20, 10, 80)

      y += @base
    end
    x += @base
  end
end

def touchStarted
  puni
end
