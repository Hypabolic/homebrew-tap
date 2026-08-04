class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.12"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.12/hypa-osx-x64.tar.gz"
      sha256 "12317c02f23496979ecf18ded08d6285bcff8f105a2035e9b8a487213f5febbf"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.12/hypa-osx-arm64.tar.gz"
      sha256 "4512af84111a092f68d8b8da003fd600dd90c51001950e17abfecade31031f2f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.12/hypa-linux-x64.tar.gz"
      sha256 "bf2735b6fbcfed8f3be47fb31c19056c775672f3ab9ced221599fd9f040de55c"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.12/hypa-linux-arm64.tar.gz"
      sha256 "85a2096444910294e2a1a305965db36829c7be0ad1453fc4770369022952eb3c"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
