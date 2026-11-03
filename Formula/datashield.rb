class Datashield < Formula
  desc "Password manager that lives in your terminal"
  homepage "https://datashield.aeratic.com"
  version "0.1.0"
  license "GPL-3.0-or-later"

  on_linux do
    on_intel do
      url "https://github.com/aeratic/DataShield/releases/download/v#{version}/datashield-tui-linux-x86_64.tar.gz"
      sha256 "191c0d8c98cebfd7eb13df713c25050f644b0bfdc302ebd717976d450ff140aa"
    end
    on_arm do
      url "https://github.com/aeratic/DataShield/releases/download/v#{version}/datashield-tui-linux-aarch64.tar.gz"
      sha256 "10f67f81348efdb40e880f0dc4dd3a2d368919df49e8a0710f8478bee6959225"
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
