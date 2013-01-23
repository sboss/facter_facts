require 'facter'

# count is used to determine if we have ruby or not.
count=0
# 
# checking the path for ruby
for p in ENV[ 'PATH' ].split(':')
  p = p + "/ruby"
  if File.exists?(p) then
    Facter.add(:ruby) { setcode { p } }
    count=count+1
    break
  else
    # not found.
  end
  
end

# determining if we have ruby or not.
if count > 0 then
  Facter.add(:has_ruby) { setcode { "TRUE" } }
else
  Facter.add(:has_ruby) { setcode { "FALSE" } }  
end