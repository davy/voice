module Say

  DEFAULT_SAY = '/usr/bin/say'

  DICT = {
    '...' => 'ellipsis',
    '&' => 'and',
    '+' => 'plus',
    '!' => 'exclamation point',
    '?' => 'question mark',
    ':' => 'colon',
    '>' => 'greater than',
    '<' => 'less than',
    '^' => 'carrot'
  }

  EMOTICONS = {
    '8==D' => 'dick',
    '<3' => 'heart',
    ':)' => 'smiley face',
    '=)' => 'smiley face',
    ':-)' => 'smiley face',
    ';)' => 'winkey face',
    ';-)' => 'winkey face',
    '=D' => 'excited smiley face',
    ':D' => 'excited smiley face',
    '8==D~~' => 'dick with sperm shooting out'
  }

  def self.say(text, opts={})
    return if text.empty?

    for key in EMOTICONS.keys.sort{|a,b| b.length <=> a.length}
      text.gsub!(key, " #{EMOTICONS[key]} ")
    end

    for key in DICT.keys.sort{|a,b| b.length <=> a.length}
      text.gsub!(key, " #{DICT[key]} ")
    end
  
    system "#{DEFAULT_SAY} #{"-v '#{opts[:voice]}'" if opts[:voice]} '#{text}'" 
  end
end
