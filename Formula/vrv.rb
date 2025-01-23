class Vrv < Formula
  desc "RISC-V system emulator, mostly meant for teaching"
  homepage "https://gitlab.com/luplab/vrv/vrv"
  license "AGPL-3.0-only"
  head "https://gitlab.com/luplab/vrv/vrv.git", branch: "main"

  depends_on "qt@5"

  def install
    qmake = Formula["qt@5"].bin/"qmake"

    cd "emu" do
      system "make", "V=1"
    end

    cd "vrv" do
      system "make", "V=1"
      bin.install "vrv"
    end

    cd "qvrv" do
      system qmake, "-o", "Makefile", "qvrv.pro"
      system "make"
      if OS.mac?
        prefix.install "qvrv.app"
        bin.install_symlink prefix/"qvrv.app/Contents/MacOS/qvrv" => "qvrv"
      else
        bin.install "qvrv"
      end
    end
  end
end
