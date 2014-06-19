#!/usr/bin/env ruby
#  https://bugs.ruby-lang.org/issues/8693

def yield_to
  yield
end

def yield_to_pop
  p = proc {return 0}
  yield_to &p
  1
end

def invoke_pop
  p = proc {return 0}
  p.call
  1
end

def yield_to_lambda
  λ = ->{return 0}
  yield_to &λ
  1
end

def invoke_lambda
  λ = ->{return 0}
  λ.call
  1
end

puts RUBY_VERSION
puts "yield_to_pop: #{yield_to_pop}"          # 0
puts "invoke_pop: #{invoke_pop}"              # 0
puts "yield_to_lambda: #{yield_to_lambda}"    # 2.0: 0; 2.1: 1
puts "invoke_lambda: #{invoke_lambda}"        # 1
