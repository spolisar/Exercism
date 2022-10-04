class LogLineParser
  def initialize(line)
    @line = line
    # @pattern = /\[[\w]*\]\:[\w\s]*/
  end

  def message
    return @line.split(':')[1].strip
    # return @line[@line.index(':')+1..@line.length].lstrip.rstrip
  end

  def log_level
    return @line.split(':')[0].gsub(/[\[\]]/, '').downcase
    # return @line[1..@line.index(']')-1].downcase
  end

  def reformat
    "%{message} (%{level})" % {message: message, level: log_level}
  end
end
