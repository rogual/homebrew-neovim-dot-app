class NeovimDotApp < Formula
  homepage "https://github.com/rogual/neovim-dot-app"
  head "https://github.com/rogual/neovim-dot-app.git"
  url "https://github.com/rogual/neovim-dot-app/archive/0.1.5.tar.gz"
  sha256 "c6aeac19ed3e85c047a1101c925071a145949799469365132d3d5866063f6655"

  depends_on "scons"     => :build
  depends_on "pkgconfig" => :build

  depends_on "msgpack"
  depends_on "neovim"

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
