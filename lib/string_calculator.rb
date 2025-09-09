class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.strip.empty?

    delimiters = [',', "\n"]

    # Custom delimiter support
    if numbers.start_with?('//')
      header, rest = numbers.split("\n", 2)
      delim_spec = header[2..-1] || ''
      if delim_spec.start_with?('[')
        # Multi-char or multiple delimiters
        custom = delim_spec.scan(/\[([^\]]+)\]/).flatten
        delimiters.concat(custom)
      else
        delimiters << delim_spec
      end
      numbers = rest || ''
    end

    # Split numbers by delimiters
    pattern = delimiters.map { |d| Regexp.escape(d) }.join('|')
    nums = numbers.split(Regexp.new(pattern)).map(&:strip).reject(&:empty?).map(&:to_i)

    # Check negatives
    negatives = nums.select { |n| n < 0 }
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}"
    end

    nums.sum
  end
end


