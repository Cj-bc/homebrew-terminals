class MltermCocoa < Formula
  homepage "http://mlterm.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/mlterm/01release/mlterm-8.8.0/mlterm-3.8.8.tar.gz"
  head "https://bitbucket.org/arakiken/mlterm", :using => :hg
  keg_only "Conflicts with non-cocoa mlterm."

  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--prefix=#{prefix}", "--with-gui=quartz"
    system "make"
    system "make", "install"
    system "cp -pvr cocoa/mlterm.app /Applications/"
    system "mkdir -p /Applications/mlterm.app/Contents/MacOS"
    system "HOME=/Applications cocoa/install.sh #{prefix}"
  end
end
