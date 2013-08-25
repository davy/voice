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
    '<3' => 'heart',
    '</3' => 'broken heart',
    ':)' => 'smiley face',
    ':o)' => 'smiley face',
    '=)' => 'smiley face',
    ':-)' => 'smiley face',
    ':3' => 'kitty smiley face',
    ';)' => 'winkey face',
    ';-)' => 'winkey face',
    '=D' => 'excited smiley face',
    ':D' => 'excited smiley face',
    ':(' => 'sad face',
    '=(' => 'sad face',
    ':-(' => 'sad face',
    '>:(' => 'angry face',
    'D=' => 'horrors face',
    'D:' => 'horrors face',
    'o_O' => 'shock face',
    'o.O' => 'shock face',
    ':O' => 'shock face',
    ':o' => 'shock face',
    '=O' => 'shock face',
    '=o' => 'shock face',
    ':P' => 'sticks tounge out face',
    ':p' => 'sticks tounge out face',
    '=P' => 'sticks tounge out face',
    '=p' => 'sticks tounge out face',
    ':*' => 'kiss face',
    'O:)' => 'angel face',
    '0:)' => 'angel face',
    '>:)' => 'evil face',
    '>:-)' => 'evil face',
    '=/' => 'meh face',
    ':/' => 'meh face',
    ':|' => 'no expression face',
    'ಠ_ಠ' => 'look of disapproval',
    '(╯°□°）╯︵ ┻━┻' => 'table flip',
    '\o/' => 'yay',
    'o/\o' => 'high five',
    '*\o/*' => 'cheerleader',
    '@}-;-' => 'rose',
    '=^_^=' => 'cat',
    '8==D' => 'dick',
    '8===D' => 'dong',
    # sometimes phonetics helps a voice say dong more accurately
    # which is super important, obviously
    '8====D' => 'duh ong', 
    '8==D~~' => 'dick with sperm shooting out',
    '8===D~~' => 'dong with sperm shooting out',
    '8====D~~' => 'duh ong with sperm shooting out'
  }

  def self.say(text, opts={})
    return if text.empty?
    opts = {} unless opts.is_a?(Hash)

    unless opts[:no_emoticons]
      for key in EMOTICONS.keys.sort{|a,b| b.length <=> a.length}
        text.gsub!(key, " #{EMOTICONS[key]} ")
      end
    end

    for key in DICT.keys.sort{|a,b| b.length <=> a.length}
      text.gsub!(key, " #{DICT[key]} ")
    end
  
    system "#{DEFAULT_SAY} #{"-v '#{opts[:voice]}'" if opts[:voice]} '#{text}'" 
  end
end
