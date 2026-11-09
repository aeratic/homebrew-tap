class Datashield < Formula
  desc "Password manager that lives in your terminal"
  homepage "https://datashield.aeratic.com"
  version "0.1.2"
  license "GPL-3.0-or-later"

  on_linux do
    on_intel do
      url "https://github.com/aeratic/DataShield/releases/download/v#{version}/datashield-tui-linux-x86_64.tar.gz"
      sha256 "fae83458fb27b790c3fb9ca9f915648e9600fd6765c04c180d2e2bf39e4815dd"
    end
    on_arm do
      url "https://github.com/aeratic/DataShield/releases/download/v#{version}/datashield-tui-linux-aarch64.tar.gz"
      sha256 "bb8d505052642203960b99a0ed9cc76525db6fbd282581bfeff4f6269a8b84c2"
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
