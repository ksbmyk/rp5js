def setup
  P5.createCanvas(700, 700)
  P5.background("gray")
  P5.noLoop
end

def draw
  P5.stroke(0)
  P5.rect(0,10,10)
end


def draw
  
  # フレーム
  P5.stroke(0)
  rect_size = 80
  rect_weight = 2
  P5.strokeWeight(rect_weight)
  
  P5.fill("#9cee60")
  P5.rect(rect_weight, rect_weight, P5.width, rect_size)
  P5.rect(P5.width - rect_weight - rect_size , rect_weight, rect_size, P5.height)
  P5.rect(rect_weight, P5.height - rect_weight - rect_size, P5.width, rect_size)
  P5.rect(rect_weight, rect_weight, rect_size, P5.height)
  
  # P5.fill("#4b92f7")
  # P5.rect(rect_weight, rect_weight, rect_size)
  # P5.rect(P5.width - rect_weight - rect_size , rect_weight, rect_size)
  # P5.rect(rect_weight, P5.height - rect_weight - rect_size, rect_size)
  # P5.rect(P5.width - rect_weight - rect_size , P5.height - rect_weight - rect_size, rect_size)

  P5.fill("#4b92f7")
  P5.rect(2, 2, 80)
  P5.rect(700 - 2 - 80 , 2, 80)
  P5.rect(2, 700 - 2 - 80, 80)
  P5.rect(700 - 2 - 80 , 700 - 2 - 80, 80)
end
