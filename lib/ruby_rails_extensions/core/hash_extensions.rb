
class Hash
  attr_reader :defaults

  #usage: options.defaults = name: "default name", id: 0
  def defaults=(hash, replace_existing_defaults = false)
    if @defaults and !replace_existing_defaults
      @defaults.merge! hash
    end
    @defaults = hash

    #hash.each do |key,value|
    #  self[key] = value unless self.key? key
    #end

    self.reverse_merge! hash
  end

  #
  # Same as calling map except that it returns a new hash instead of an array. key/values pairs inside of required
  # block should return an array
  #
  def map_as_hash(&block)
    Hash[map(&block)]
  end

  #
  # returns a new version of this hash with the keys transformed based off of the transform method passed in.
  # EXAMPLE: {a:1}.transform_keys(:upcase) => {'A' => 1}
  #
  def transform_keys(transform_method, *args)
    map_as_hash do |k, v|
      [k.to_s.send(transform_method, *args), v]
    end
  end

  # pushes an array into the hash as a key/value pair
  #def push(arr)
  #  raise "Invalid argument size - size should equal 2" if arr.size != 2
  #  self[arr[0]] = arr[1]
  #end

  #
  # Makes the hash dynamic, allowing its hash values to be accessed as if they were properties on the object.
  #
  def make_dynamic(cascade = false)
    self.extend(DynamicAttrs) unless is_a? DynamicAttrs

    if cascade
      self.each do |key, val|
        if val.is_a? Hash
          val.make_dynamic cascade
        end
      end
    end

    self

  end

  module DynamicAttrs
    def method_missing(key, *args)
      text = key.to_s

      # if setter method
      if (text[-1,1] == '=')
        text = text.chop
        # if there is already a text version of the key then set that version
        if self.key? text
          self[text] = args[0]
        # otherwise use the sym version
        else
          self[text.to_sym] = args[0]
        end
      # else if a text version of the key is already set
      elsif self.key? text
        self[text]
      # else use the symbol version of the key
      else
        self[key]
      end
    end
  end

end