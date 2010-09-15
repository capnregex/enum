= enum

http://github.com/capnregex/enum

== DESCRIPTION:

A java like Enum class for ruby. 

A while ago I was exploring Java, and came across the Enum class, which had
some interesting functionality, and I decided that I would like something like
it. 

Conceptually if you just need a unique identifier you may be perfectly happy using a :symbol, and that would likely be a simpler way of having a controll flag. However, if you want to have a set of unique identifiers that you can address, iterate over, assign properties to, etc, then this may be something you would be interested in. 

== FEATURES/PROBLEMS:

Provide the java Enum idiom for Ruby. 

For examples of use cases, see the examples in test.

== SYNOPSIS:

class PrimaryColors < Enum
  enum %w(Red Yellow Blue)
end

class Colors < Enum
  enum_field :code
  enum do 
    RED   '#ff0000'
    GREEN '#00ff00'
    BLUE  '#0000ff'
  end
end

== REQUIREMENTS:

ruby, rubygems

== INSTALL:

sudo gem install enum

== DEVELOPERS:

After checking out the source, run:

  $ rake newb

This task will install any missing dependencies, run the tests/specs,
and generate the RDoc.

== LICENSE:

(The MIT License)

Copyright (c) 2010

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
