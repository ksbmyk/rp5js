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

  def self.push(*args)
    %x{
      return window['push'].apply(window, args);
    }
  end

  def self.pop(*args)
    %x{
      return window['pop'].apply(window, args);
    }
  end

  def self.noLoop(*args)
    %x{
      return window['noLoop'].apply(window, args);
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

  def self.translate(*args)
    %x{
      return window['translate'].apply(window, args);
    }
  end

  def self.rotate(*args)
    %x{
      return window['rotate'].apply(window, args);
    }
  end

  def self.sin(*args)
    %x{
      return window['sin'].apply(window, args);
    }
  end

  def self.cos(*args)
    %x{
      return window['cos'].apply(window, args);
    }
  end

  def self.rectMode(*args)
    %x{
      return window['rectMode'].apply(window, args);
    }
  end

  def self.beginShape(*args)
    %x{
      return window['beginShape'].apply(window, args);
    }
  end

  def self.endShape(*args)
    %x{
      return window['endShape'].apply(window, args);
    }
  end

  def self.vertex(*args)
    %x{
      return window['vertex'].apply(window, args);
    }
  end

  def self.line(*args)
    %x{
      return window['line'].apply(window, args);
    }
  end

  %x{
    window.setup = function() { Opal.top.$setup(); };
    window.draw = function() { Opal.top.$draw(); };
    window.mouseClicked = function() { Opal.top.$mouseClicked(); };
    window.touchStarted = function() { Opal.top.$touchStarted(); };
  }
end
