class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    encrypter = 9
    result = ""
    self.each do |item|
      if item.is_a?(Array)
        if item.empty?
          result += "1001"
        else
          item.hash
        end
      else
        result += (item.to_s(2).to_i ^ encrypter.to_s(2).to_i).to_s(2)
      end
    end
    result.to_i
  end
end

class String
  def hash
    self.split('').map(&:to_s).map(&:ord).hash
  end
end

class Hash
  def hash
    self.keys.sort.map!(&:to_s).map!(&:ord).hash
  end
end
