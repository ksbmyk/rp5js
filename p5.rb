module P5
  def self.method_missing(name, *args)
    %x{
      obj = window[name];
      if (typeof(obj) == 'function') {
        return window[name].apply(window, args);
      } else {
        return window[name];
      }
    }
  end

  %x{
    window.setup = function() { Opal.top.$setup(); };
    window.draw = function() { Opal.top.$draw(); };
  }
end
