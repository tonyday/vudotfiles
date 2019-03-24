# Test change to check github auth
require 'fileutils'

include FileUtils::Verbose

def dotfile(root)
  File.expand_path("~/.#{File.basename(root)}")
end

def backup(df)
 cp(df, "#{df}.#{Time.now.strftime('%s')}")
end

def delete(df)
  rm df
end

def link(df, fn)
  ln_sf(fn, df)
end

Dir['dots/**'].each do |fn|
  fn = File.expand_path(fn)
  df = dotfile(fn)
  if File.exist?(df)
    backup(df)
    delete(df)
  end
  link(df, fn)
end

