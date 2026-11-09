cask "datashield" do
  version "0.1.2"
  sha256 "3472ffb81c135ffcf442032b0200cea64ca9367bc658f4d521140270a97eb4ae"

  url "https://github.com/aeratic/DataShield/releases/download/v#{version}/DataShield-TUI-macos-aarch64.dmg"
  name "DataShield"
  desc "Password manager that lives in your terminal"
  homepage "https://datashield.aeratic.com"

  depends_on arch: :arm64

  app "DataShield.app"

  zap trash: [
    "~/Library/Application Support/datashield",
    "~/.config/datashield",
  ]
end
