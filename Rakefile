require 'rake/testtask'
require 'net/http'
require 'fileutils'

require './lib/sequencer.rb'
require './lib/sequencer_output.rb'

DICTIONARY_URL    = 'https://dl.dropboxusercontent.com/u/14065136/dictionary.txt'
OUTPUT_DIRECTORY  = File.join(File.dirname(__FILE__), 'data')
DICTIONARY_PATH   = File.join(OUTPUT_DIRECTORY, 'dictionary.txt')

task :default => :run

desc 'remove files from the data directory'
task :clean do
  FileUtils.rm_r(Dir.glob(File.join(OUTPUT_DIRECTORY, '*')))
end

desc 'Run the dictionary sequencer dictionary file.'
task :run do
  get_dictionary
    puts "Finished seuencing and writing files"
end


#fetches dictionary from dictionary file in data/ dir.
def get_dictionary
  if File.exists?(DICTIONARY_PATH)
    puts "Dictionary found at `data/dictionary.txt`. Parsing dictionary..."
  else
    puts "Downloading from #{DICTIONARY_URL}..."
    File.write(DICTIONARY_PATH, Net::HTTP.get(URI.parse(DICTIONARY_URL)))
  end
end

#frames sequences from dictionary
def sequence_dictionary
  dictionary = File.read(DICTIONARY_PATH).split("\n")
  puts "Sequencing dictionary (#{dictionary.length} words)..."
  @sequencer = Sequencer.new(dictionary)
  @sequencer.frame_sequence
end


#writes seequences and words to files
def output_sequence_results
  puts "Writing output files..."
  writer = SequencerOutput.new(@sequencer, OUTPUT_DIRECTORY)
  writer.write_files
 end
