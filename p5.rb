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

  def self.noLoop(*args)
    %x{
      return window['noLoop'].apply(window, args);
    }
  end

  def self.width
    %x{
      return window['width'];
    }
  end

  def self.height
    %x{
      return window['height'];
    }
  end

  def self.windowWidth
    %x{
      return window['windowWidth'];
    }
  end

  def self.createCanvas(*args)
    %x{
      return window['createCanvas'].apply(window, args);
    }
  end

  def self.colorMode(*args)
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

  def self.ellipse(*args)
    %x{
      return window['ellipse'].apply(window, args);
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

  def self.strokeWeight(*args)
    %x{
      return window['strokeWeight'].apply(window, args);
    }
  end

  def self.append(*args)
    %x{
      return window['append'].apply(window, args);
    }
  end

  def self.background(*args)
    %x{
      return window['background'].apply(window, args);
    }
  end

  def self.background(*args)
    %x{
      return window['frameRate'].apply(window, args);
    }
  end

  def self.angleMode(*args)
    %x{
      return window['angleMode'].apply(window, args);
    }
  end

  def self.noStroke(*args)
    %x{
      return window['noStroke'].apply(window, args);
    }
  end

  def self.noFill(*args)
    %x{
      return window['noFill'].apply(window, args);
    }
  end

  def self.arc(*args)
    %x{
      return window['arc'].apply(window, args);
    }
  end

  %x{
    window.setup = function() { Opal.top.$setup(); };
    window.draw = function() { Opal.top.$draw(); };
    window.mouseClicked = function() { Opal.top.$mouseClicked(); };
    window.touchStarted = function() { Opal.top.$touchStarted(); };
  }
end
