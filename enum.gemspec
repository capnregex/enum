
require 'pathname'
Gem::Specification.new do |s|
   s.name = %q{enum}

   s.summary = %q{java like enum functionality.}
   s.description = <<-DESC
     Java like enum functionality when you need more than a unique identifier. 
   DESC
   s.homepage = %q{http://github.com/capnregex/enum}
   s.version = "0.1.1"
   s.date = %q{2010-09-10}
   s.authors = [ "CapnRegex" ]
   s.email = %q{capnregex@gmail.org}

   files = [ "README", "Changelog", "LICENSE" ]
   Dir.chdir(File.dirname(__FILE__)) do
     Dir["**/*.rb"].each do |rb| 
       files.push rb
     end
   end
   s.files = files
end

