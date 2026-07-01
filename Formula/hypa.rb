class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.7/hypa-osx-x64.tar.gz"
      sha256 "fa2b8b33e79175cfbe8580e4fe20e5d48a163bad25c2a54aff5d85f797c74f77"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.7/hypa-osx-arm64.tar.gz"
      sha256 "3edf47c7227a81e2bf32f0a821d837afa4eb7536e206cdbf2ef58a0052ef7034"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.7/hypa-linux-x64.tar.gz"
      sha256 "ad7009da08538ffa590e5298cfcf49420420a3c93d24516f5c14569f06708a0e"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.7/hypa-linux-arm64.tar.gz"
      sha256 "1bb2d8f493c4fdcc5c78377f461e1ef7eb5d8813af06754c582a14ddf189264d"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
