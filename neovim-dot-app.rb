class NeovimDotApp < Formula
  homepage "https://github.com/rogual/neovim-dot-app"
  head "https://github.com/rogual/neovim-dot-app.git"
  url "https://github.com/rogual/neovim-dot-app/archive/0.1.4.tar.gz"
  sha256 "67ab28f0394583b04032320493be55a0d0654c619b7c765d235e60c07e81eeab"

  depends_on "scons"     => :build
  depends_on "pkgconfig" => :build

  depends_on "msgpack"
  depends_on "neovim"

  # scons requires python 2
  depends_on :python => :recommended
  depends_on :xcode
  depends_on :arch => :x86_64

  def install
    ENV.prepend_path "PATH", Formula["python"].opt_bin
    system "make", "NVIM=#{Formula["neovim"].opt_bin}/nvim"
    prefix.install "build/Neovim.app"
    bin.install "gnvim"
  end

  test do
    system "build/test"
  end
end
