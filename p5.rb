module P5
  def self.method_missing(name, *args)
    %x{
      obj = window[name];
      // 関数かどうか
      if (typeof(obj) == 'function') {
        // ラップしきれていない関数の呼び出し
        return window[name].apply(window, args);
      } else {
        // グローバル変数。HBSとか
        return window[name];
      }
    }
  end

  def self.width
    %x{
      return window['width'];
    }
  end

  def self.create_canvas(*args)
    %x{
      return window['createCanvas'].apply(window, args);
    }
  end

  def self.color_mode(*args)
    %x{
      return window['colorMode'].apply(window, args);
    }
  end

  def self.stroke(*args)
    %x{
      return window['stroke'].apply(window, args);
    }
  end

  def self.fill(*args)
    %x{
      return window['fill'].apply(window, args);
    }
  end

  def self.rect(*args)
    %x{
      return window['rect'].apply(window, args);
    }
  end

  def self.random(*args)
    %x{
      return window['random'].apply(window, args);
    }
  end

  def self.color(*args)
    %x{
      return window['color'].apply(window, args);
    }
  end

  %x{
    window.setup = function() { Opal.top.$setup(); };
    window.draw = function() { Opal.top.$draw(); };
    window.mouseClicked = function() { Opal.top.$mouse_clicked(); };
  }
end
