class Sequencer

  SEQUENCE_LENGTH   = 4
  SEQUENCE_PATTERN  = /\A[a-zA-Z]+\z/

  #call frame sequences to form sequences
  def self.sequence(dictionary)
    self.new(dictionary).tap do |sequencer|
      sequencer.frame_sequence
    end
  end

  #initialise an empty dictionay and hash for seuences and its words
  def initialize(dictionary)
    @dictionary = dictionary
    @sequence_index = {}
  end

  #frames sequences from words in dic.  
  def frame_sequence
    @dictionary.each do |word|
      next if word.length < SEQUENCE_LENGTH #chk for SEQ. LENGTH
      form_get_sequences_from_word(word)
    end
  end

  # this function fetches all the get_sequences with only one word from @sequence_index 
  def get_sequences
    # returns sequences belonging to only one word : words.length to be 1
    @get_sequences ||= @sequence_index.select{|sequence, words| words.length == 1}.keys.sort
  end

  #gets first sequence's first word
  def sequence_source(sequence)
    @sequence_index.fetch(sequence, []).first
  end

  private

  #frames all get_sequences and its corresponding words and stores it in sequence_index
  def form_sequences_from_word(word)

    (0..(word.length-SEQUENCE_LENGTH)).each do |index|

      sequence = word[index..(index+SEQUENCE_LENGTH-1)]

      if sequence =~ SEQUENCE_PATTERN  # chk for seq. pattern
        @sequence_index[sequence] ||= []  # create hash for each sequence to store words it belongs
        @sequence_index[sequence] << word # store word for sequence
      end
    end
  end

end
