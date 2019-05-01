NUMA = 10
NUMB = 6
SCALAR = 50
$numA = NUMA * SCALAR
$numB = NUMB * SCALAR

$wd = $numB
$xPos = 0
$yPos = 0
$itr = 0

def setup
  P5.createCanvas(600, 600)
  P5.colorMode(P5.HSB, 1)
end


def draw
  while ($wd > 0) do
    $itr += 1
    if ($itr % 2 == 1)
      while ($xPos + $wd <= $numA) do
        P5.fill(color_code)
        P5.rect($xPos, $yPos, $wd, $wd)
        $xPos += $wd
      end
      $wd = $numA - $xPos
    else
      while ($yPos + $wd <= $numB) do
        P5.fill(color_code)
        P5.rect($xPos, $yPos, $wd, $wd)
        $yPos += $wd
      end
      $wd = $numB - $yPos
    end
  end
end

def color_code
  P5.color(P5.random(1), 1, 1)
end
