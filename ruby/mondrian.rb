RATIO = (2.23606797749979 + 1) / 2 # 比率 5の平方根に1足して2で割る

def setup
  @thr = 80  # 分割する大きさに関するしきい値 TODO あとで名前考え直す
  @thr2 = 0.5 # 確率を決定するしきい値
  P5.create_canvas(500, 500)
  P5.color_mode(P5.HSB, 1)
  color_rect(0, 0, P5.width - 1, P5.width - 1)
  div_square(0, 0, P5.width - 1)
end

def draw
end

def mouse_clicked
  @thr = P5.random(10, 300)
  @thr2 = P5.random(0,1)
  color_rect(0, 0, P5.width - 1, P5.width - 1)
  div_square(0, 0, P5.width - 1)
end

def color_rect(x_pos, y_pos, wd, ht)
  case P5.random(1)
  when 0...0.15 # 15%の確率
    col = P5.color(0, 1, 1) # 赤
  when 0.15...0.3 # 15%の確率
    col = P5.color(2.0 / 3, 1, 1) # 青
  when 0.3...0.45  # 15%の確率
    col = P5.color(1.0 / 6, 1, 1) # 黄
  when 0.45...0.5 # 5%の確率
    col = P5.color(0, 1, 0) # 黒
  when 0.5...0.7  #20%の確率
    col = P5.color(0, 0, 0.9) # 灰
  else   # 30%の確率
    col = P5.color(0, 0, 1) # 白
  end
  P5.fill(col)
  P5.strokeWeight(5)  # 長方形の枠線の太さ
  P5.rect(x_pos, y_pos, wd, ht)
end

def div_square(x_pos, y_pos, wd)
  itr = 0
  x_end_pos = wd + x_pos  # 正方形の横の長さ
  y_end_pos = wd + y_pos  # 正方形の縦の長さ
  while wd > @thr do  # 正方形の幅がしきい値以上の場合に実行
    itr += 1
    if itr % 2 == 1
      while (x_pos + wd * RATIO < x_end_pos + 0.1) do
        color_rect(x_pos, y_pos, wd * RATIO, wd)  # 長方形を描く
        if P5.random(1) < @thr2  # thr2の確率で再分割
          div_rect(x_pos, y_pos, wd * RATIO)  # 長方形を分割する関数の呼び出し
        end
        x_pos += wd * RATIO
      end
      wd = x_end_pos - x_pos
    else
      while (y_pos + wd / RATIO < y_end_pos + 0.1) do
        color_rect(x_pos, y_pos, wd, wd / RATIO)  # 長方形を描く
        if P5.random(1) < @thr2  # thr2の確率で再分割
          div_rect(x_pos, y_pos, wd)  # 長方形を分割する関数の呼び出し
        end
        y_pos += wd / RATIO
      end
      wd = y_end_pos - y_pos
    end
  end
end

def div_rect(x_pos, y_pos, wd)
  itr = 0
  x_end_pos = x_pos + wd  # 長方形の横の長さ
  y_end_pos = y_pos + wd / RATIO   # 長方形の縦の長さ
  while (wd > @thr)   # wdがしきい値以上の場合に処理を行う
    itr += 1
    if (itr % 2 == 0)
      while (x_pos + wd < x_end_pos + 0.1) do
        color_rect(x_pos, y_pos, wd, wd)  # 正方形を描く
        if (P5.random(1) < @thr2)
          div_square(x_pos, y_pos, wd)  # 正方形を分割する関数の呼び出し
        end
        x_pos += wd
      end
      wd = x_end_pos - x_pos
    else
      while (y_pos + wd < y_end_pos + 0.1) do
        color_rect(x_pos, y_pos, wd, wd)  # 正方形を描く
        if (P5.random(1) < @thr2)
          div_square(x_pos, y_pos, wd)  # 正方形を分割する関数の呼び出し
        end
        y_pos += wd
      end
      wd = y_end_pos - y_pos
    end
  end
end
