require 'facter'

# Facter.add(:git) { setcode { ENV[ 'PATH' ] } }
count=0
for p in ENV[ 'PATH' ].split(':')
  p = p + "/git"
  if File.exists? p then
    Facter.add(:git) { setcode { p } }
    count=count+1
  else
    # not found.
  end
  
end

if count > 0 then
  Facter.add(:has_git) { setcode { "TRUE" } }
else
  Facter.add(:has_git) { setcode { "FALSE" } }  
end