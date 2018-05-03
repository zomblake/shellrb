# cp command implented in ruby
require_relative 'ls'
require 'set'
require "fileutils"


class Cp
  def self.main params

    # determine if user specifies '-r'
    if params.length == 2
      source = params[0]
      if file_is_present(source)
        destination = params[1]
        FileUtils.cp(source, destination)
      else
        puts "'#{source}' does not exist"
      end
    else
      case params[0]
      when '-r'
        source = params[1]
        if file_is_present(source)
          destination = params[2]
          FileUtils.cp_r(source, destination)
        else
          puts "'#{source}' does not exist"
        end
      end
    end

  end

  def self.file_is_present source
    # creates a set of all the files in the current directory
    ls = Ls.show_hidden.merge Ls.show_non_hidden

    file_present = false

    # iterates through the files in the current directory to make sure that the desired file does exist
    ls.each do |x|
      if x == source
        file_present = true
      end
    end

    return file_present

  end

end
