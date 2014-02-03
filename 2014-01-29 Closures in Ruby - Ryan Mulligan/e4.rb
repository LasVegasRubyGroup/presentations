s = "Hi world"

def caller(proc)
  proc.call
end

caller(Proc.new { p s})
