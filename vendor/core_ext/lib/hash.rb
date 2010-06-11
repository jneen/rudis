class Hash
  def rmerge!(hsh)
    hsh.each do |k,v|
      self[k] = v unless self.has_key? k
    end
    self
  end

  def rmerge(hsh)
    self.dup.rmerge!(hsh)
  end

  def accept_options!(hsh)
    opts_diff = self.keys - hash.keys
    raise ArgumentError <<-msg.squish unless opts_diff.empty?
      Unrecognized options #{opts_diff.inspect}
    msg
    options.rmerge!(hsh)
  end

  def accept_options(hsh)
    self.dup.accept_options!(hsh)
  end
end
