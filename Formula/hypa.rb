class Hypa < Formula
  desc "Local context runtime and terminal multiplexer for coding agents"
  homepage "https://github.com/Hypabolic/Hypa"
  version "1.1.0"
  license "FSL-1.1-ALv2"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.1.0/hypa-osx-x64.tar.gz"
      sha256 "43021dfe287b171aa2dcfe4ad877eb9a063e8462ab8922c5530816ddfaadc258"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.1.0/hypa-osx-arm64.tar.gz"
      sha256 "baed055033bd19b9073a50465414857319cfa49ce6aaf091e71b71dc4f3a0b1f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.1.0/hypa-linux-x64.tar.gz"
      sha256 "f2fd63ac0bfbdd8750710aa1805276b612f4fbabb626f671fd62672cc1aa9a6e"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.1.0/hypa-linux-arm64.tar.gz"
      sha256 "cba1ba5bd4b6b313fceacb47d8b5ccf9b7adcccac83e715e99f52e748f6f3c4c"
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
