class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.0.14"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.0.14/hypa-osx-x64.tar.gz"
      sha256 "a5a1c7b0d959fc0f1eb7008dcb9dc1c8caf72acaa6576e42217a7c87da905ed4"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.0.14/hypa-osx-arm64.tar.gz"
      sha256 "e239f2f7ae8b52f62d2deb4f58633224072ec99c883661bf7200fe04d1cd17ff"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.0.14/hypa-linux-x64.tar.gz"
      sha256 "fd740ac557e529f0f502ebf575d7cd09f3004628be1964f846d265e196445c57"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.0.14/hypa-linux-arm64.tar.gz"
      sha256 "95b01ed4cbdab814201fde666b230df4bfa71862cf9f506cd7efee0be3d24f5a"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
