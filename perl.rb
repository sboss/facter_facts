require 'facter'

# count is used to determine if we have perl or not.
count=0
perlbrewcount=0
cpanmcount=0
# 
# checking the path for perl
for p in ENV[ 'PATH' ].split(':')
  p = p + "/perl"
  if File.exists?(p) then
    Facter.add(:perl) { setcode { p } }
    Facter.add(:perl_version) { setcode { `perl --version`.split(" (").pop.split(") ").shift.gsub("v","") } }    
    count=count+1
    break
  else
    # not found.
  end
  
end

# determining if we have perl or not.
if count > 0 then
  Facter.add(:has_perl) { setcode { "TRUE" } }
else
  Facter.add(:has_perl) { setcode { "FALSE" } }  
end

# determine if we have cpanm or not.
if count > 0 then
  for ppp in ENV[ 'PATH' ].split(':')
    ppp = ppp + "/cpanm"
    if File.exists?(ppp) then
      Facter.add(:cpanm) { setcode { ppp } }
      Facter.add(:cpanm_version) { setcode { `cpanm --version`.split(" version ").pop } }    
      cpanmcount=cpanmcount+1
      break
    else
      # not found.
    end
  
  end

  # determining if we have cpanm or not.
  if cpanmcount > 0 then
    Facter.add(:has_cpanm) { setcode { "TRUE" } }
  else
    Facter.add(:has_cpanm) { setcode { "FALSE" } }  
  end
  
end

# determine if we have perlbrew or not.
if count > 0 then
  for pp in ENV[ 'PATH' ].split(':')
    pp = pp + "/perlbrew"
    if File.exists?(pp) then
      Facter.add(:perlbrew) { setcode { pp } }
      Facter.add(:perlbrew_version) { setcode { `perlbrew version`.split(" - ").pop.gsub("App::perlbrew/","") } }    
      perlbrewcount=perlbrewcount+1
      break
    else
      # not found.
    end
  
  end

  # determining if we have perlbrew or not.
  if perlbrewcount > 0 then
    Facter.add(:has_perlbrew) { setcode { "TRUE" } }
  else
    Facter.add(:has_perlbrew) { setcode { "FALSE" } }  
  end
  
end
