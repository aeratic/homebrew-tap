cask "datashield" do
  version "0.1.3"
  sha256 "7e4e92940092e7c5ba60731d81b714dc0fdfbae56e227de34ea9f441b3c7f5b8"

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
