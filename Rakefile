include FileUtils

BASE_PATH = File.dirname(__FILE__)
BUNDLE_PATH = File.join(BASE_PATH, 'bundle')

desc "Installs Vigor"
task :install do
  system "git submodule update --init"
  rm_rf File.join(BUNDLE_PATH, 'snipmate', 'snippets')
  system "ln -s ~/.vim/vimrc ~/.vimrc"
  system "ln -s ~/.vim/gvimrc ~/.gvimrc"
end

desc "Updates from origin and syncs submodules"
task :update do
  system "git pull"
  system "git submodule sync"
  system "git submodule update --init --recursive"
  rm_rf File.join(BUNDLE_PATH, 'snipmate', 'snippets')
end

