class Foo
  def hash
    0
  end

  def eql?(x)
    super
  end
end


require 'ruby-prof'
RubyProf.start

hash = {}
2048.times do |n|
  key = Foo.new
  hash[key] = true
end

result = RubyProf.stop
File.open("slow2.txt","w") do |f|
  RubyProf::FlatPrinter.new(result).print(f)
end

File.open("slow2.html","w") do |f|
  RubyProf::GraphHtmlPrinter.new(result).print(f)
end

File.open("slow2.ct","w") do |f|
  RubyProf::CallTreePrinter.new(result).print(f)
end

