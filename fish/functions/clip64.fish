function clip64 --wraps='paste.exe | string trim | base64 -d' --description 'alias clip64=paste.exe | string trim | base64 -d'
  paste.exe | string trim | base64 -d $argv
        
end
