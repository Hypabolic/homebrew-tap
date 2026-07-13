class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.11"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.11/hypa-osx-x64.tar.gz"
      sha256 "a73f6acf69165801eb06bb242d9b395ef72ceb8914d29f5e5ff09da960b85609"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.11/hypa-osx-arm64.tar.gz"
      sha256 "7bae0f342e357083eba1b01ee512854633178d4dacde4e8cda667cfa2d3bc8ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.11/hypa-linux-x64.tar.gz"
      sha256 "edba2235735bbef15febd981b7b55104fbc61c5663378cd9edaf72bb3296e98c"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.11/hypa-linux-arm64.tar.gz"
      sha256 "eba14a06b14ab56df4e4cbd9c43d1ca1ed321522bdeb7dd04c9927f57478e35c"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
