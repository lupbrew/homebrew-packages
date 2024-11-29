class Lupv < Formula
  desc "Education-friendly RISC-V based system emulator"
  homepage "https://gitlab.com/luplab/lupv"
  license "MIT"
  head "https://gitlab.com/luplab/lupv.git", branch: "main"

  def install
    libexec.mkdir
    system "make", "R=#{libexec}"
    bin.install "lupv32"
    system "make", "clean"
    system "make", "R=#{libexec}", "W=64"
    bin.install "lupv64"
    libexec.install "bios"
  end
end
