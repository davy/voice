require 'voice/say'

module Voice

  PLATFORM_IS_OSX = (Object::RUBY_PLATFORM =~ /darwin/i)

  DEFAULT_VOICE = 'Kathy'

  NOVELTY_VOICES = ["Albert", "Bad News", "Bahh", "Bells",
    "Boing", "Bubbles", "Cellos", "Deranged", "Good News",
    "Hysterical", "Pipe Organ", "Trinoids", "Whisper", "Zarvox"
  ]

  if PLATFORM_IS_OSX
    @@all = []
    `say -v ?`.each_line do |l|
      # Each line resembles: Agnes               en_US    # Isn't it nice to have a computer that will talk to you?
      voice = l.split('#')[0]. # Grab everything before the comment marker
        strip.         # Drop the extra spaces at the end
        split(' ')     # Split into words
      @@all << voice[0..-2].join(' ') # Drop the last word (locale), and join the rest with a single space
    end
    @@novelty = @@all.select{|v| NOVELTY_VOICES.include?(v)}
    @@all = @@all - @@novelty
  else
    @@all = nil
    @@novelty = nil
  end

  def self.all(opts={})
    return nil if @@all.nil?
    opts = {} unless opts.is_a?(Hash)

    if opts[:novelty] == 'only'
      @@novelty
    elsif opts[:novelty]
      @@all + @@novelty
    else
      @@all
    end
  end

  def self.default
    return DEFAULT_VOICE if @@all.include?(DEFAULT_VOICE)
    return @@all.first
  end

  def self.get_rand(opts={})
    return nil if @@all.nil?
    opts = {} unless opts.is_a?(Hash)

    voices = self.all(opts)

    voices[rand(voices.size)]
  end

  def self.say(text, opts={})
    opts = {} unless opts.is_a?(Hash)
    opts[:voice] = self.get_rand(opts) if opts[:random]
    opts[:voice] ||= self.default

    Say.say(text, opts)
    return nil
  end

end
