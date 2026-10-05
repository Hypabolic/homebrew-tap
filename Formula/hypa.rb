class Hypa < Formula
  desc "Local context runtime and terminal multiplexer for coding agents"
  homepage "https://github.com/Hypabolic/Hypa"
  version "1.0.6"
  license "FSL-1.1-ALv2"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.6/hypa-osx-x64.tar.gz"
      sha256 "30e2d25f2cc8c0f810c310da0e63e5ed76b0cc03a19ebe9fef6e0519f7c42ecb"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.6/hypa-osx-arm64.tar.gz"
      sha256 "212fd04b5e08a3cbbe56011770b1801e125c7a2af56ae84bf2708f1d1820ffd6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.6/hypa-linux-x64.tar.gz"
      sha256 "feeb644316dd5507d29e0bd21a49510fe33de0ec51a38d1d4e9af1cc1d560d18"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.6/hypa-linux-arm64.tar.gz"
      sha256 "96517e42b9f25bf9f720e032888458591cf641d477c53b356c1edbc413e056e8"
    end
  end

  # The release archive is a self-contained directory. hypa finds hypa-attach,
  # hypa-runtime, hypa-pty-host, libghostty-vt and the native libraries next to
  # its own executable, so keep them together in libexec and link only hypa.
  # The binaries are prebuilt and signed by the release pipeline; relinking
  # them would invalidate the signatures.
  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"hypa"
  end

  test do
    %w[hypa hypa-attach hypa-annotate hypa-runtime hypa-pty-host].each do |program|
      assert_predicate libexec/program, :executable?
    end
    assert_predicate libexec/shared_library("libghostty-vt"), :exist?
    assert_predicate libexec/shared_library("libe_sqlite3"), :exist?

    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
