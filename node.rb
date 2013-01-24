require 'facter'

# count is used to determine if we have nodeJS or not.
count=0
npmcount=0
# 
# checking the path for nodeJS
for p in ENV[ 'PATH' ].split(':')
  p = p + "/node"
  if File.exists?(p) then
    Facter.add(:nodeJS) { setcode { p } }
    count=count+1
    break
  else
    # not found.
  end
  
end

# determining if we have nodeJS or not.
if count > 0 then
  Facter.add(:has_nodeJS) { setcode { "TRUE" } }
  Facter.add(:nodeJS_version) { setcode { `node --version` } }  
else
  Facter.add(:has_nodeJS) { setcode { "FALSE" } }  
end

# determine if we have npm or not.
if count > 0 then
  for ppp in ENV[ 'PATH' ].split(':')
    ppp = ppp + "/npm"
    if File.exists?(ppp) then
      Facter.add(:npm) { setcode { ppp } }
      Facter.add(:npm_version) { setcode { `npm --version` } }    
      npmcount=npmcount+1
      break
    else
      # not found.
    end
  
  end

  # determining if we have cpanm or not.
  if npmcount > 0 then
    Facter.add(:has_npm) { setcode { "TRUE" } }
  else
    Facter.add(:has_npm) { setcode { "FALSE" } }  
  end
  
end