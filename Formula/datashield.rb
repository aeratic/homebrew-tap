class Datashield < Formula
  desc "Password manager that lives in your terminal"
  homepage "https://datashield.aeratic.com"
  version "0.1.3"
  license "GPL-3.0-or-later"

  on_linux do
    on_intel do
      url "https://github.com/aeratic/DataShield/releases/download/v#{version}/datashield-tui-linux-x86_64.tar.gz"
      sha256 "cc2a4b8746135decaff850a668b838db17f77d294785ab8986d98635d8ebc3b6"
    end
    on_arm do
      url "https://github.com/aeratic/DataShield/releases/download/v#{version}/datashield-tui-linux-aarch64.tar.gz"
      sha256 "d2c764a0d4b481e5b6bc811a2bed682824b66e489ab8310faac76e3914919acf"
    end
  end

  def install
    odie "On macOS install the app bundle: brew install --cask aeratic/tap/datashield" if OS.mac?
    bin.install "datashield-tui"
    bin.install "datashield"
    (etc/"datashield").install "datashield.kitty.conf"
    (share/"applications").install "datashield.desktop"
    (share/"icons/hicolor/128x128/apps").install "datashield.png"
  end

  def caveats
    <<~EOS
      DataShield opens in its own kitty window when kitty is installed
      (apt/dnf/pacman install kitty). Without kitty it runs in the current terminal.
    EOS
  end

  test do
    assert_predicate bin/"datashield-tui", :executable?
  end
end
