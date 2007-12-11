module ActiveCouch
  Hash.class_eval do
    # Flatten on the array removes everything into *one* single array,
    # so {}.to_a.flatten sometimes won't work nicely because a value might be an array
    # So..introducing flatten for Hash, so that arrays which are values (to keys)
    # are retained
    def flatten
      (0...self.size).inject([]) {|k,v| k << self.keys[v]; k << self.values[v]}
    end  
  end
  
  Object.class_eval do
    def get_class(name)
      # From 'The Ruby Way Second Edition' by Hal Fulton
      name.split("::").inject(Object) {|x,y| x.const_get(y)}
    end
  end
  
end