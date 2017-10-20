require 'fileutils'

def check_bkp(path)
  bkp = "#{path}.bkp"

  if File.file?(path)
    check_bkp(bkp)
    FileUtils.mv(path, bkp)
  end

  if Dir.exists?(path)
    check_bkp(bkp)
    FileUtils.mv(path, bkp)
  end
end

namespace :dotfile do
  desc "Create all dotfiles, if already exist create a back up with .bkp extension"
  task :setup do
    path_root = File.dirname(File.realpath(__FILE__))
    entries   = %w(bashrc gemrc gitconfig gitignore scripts sheet vim vimrc)
    entries.each do |entry|
      path = File.join(path_root, entry)
      dot  = File.join(ENV["HOME"], ".#{entry}")
      check_bkp(dot)

      FileUtils.ln_s(path, dot)
    end
  end
end
