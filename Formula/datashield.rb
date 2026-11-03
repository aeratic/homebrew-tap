class Datashield < Formula
  desc "Password manager that lives in your terminal"
  homepage "https://datashield.aeratic.com"
  version "0.1.1"
  license "GPL-3.0-or-later"

  on_linux do
    on_intel do
      url "https://github.com/aeratic/DataShield/releases/download/v#{version}/datashield-tui-linux-x86_64.tar.gz"
      sha256 "e231b617b19a5d95aa438ecac43d1821203276b44b7d7a900583913718a225c9"
    end
    on_arm do
      url "https://github.com/aeratic/DataShield/releases/download/v#{version}/datashield-tui-linux-aarch64.tar.gz"
      sha256 "316c3e7e27f1aa475bfa6b3881d830995d6b7b1b3251e3756d6ff966f637f2de"
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
