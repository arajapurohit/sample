class SequencerOutput

  # creates sequences and words file
  def initialize(sequencer, output_directory)
    @sequencer = sequencer
    @get_sequences_file = File.join(output_directory, 'sequences')
    @words_file = File.join(output_directory, 'words')
  end

  #writes sequences and words to files
  def write_files
    File.open(@get_sequences_file, 'w') do |get_sequences_file|
      File.open(@words_file, 'w') do |words_file|
        @sequencer.get_sequences.each do |sequence|
          get_sequences_file.puts sequence
          words_file.puts @sequencer.sequence_source(sequence)
        end
      end
    end
  end

end
