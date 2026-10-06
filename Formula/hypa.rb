class Hypa < Formula
  desc "Local context runtime and terminal multiplexer for coding agents"
  homepage "https://github.com/Hypabolic/Hypa"
  version "1.0.8"
  license "FSL-1.1-ALv2"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.8/hypa-osx-x64.tar.gz"
      sha256 "2662e360fb5d8fa1f8774146c8814bb06d0eff3cfb2b97e1f73a5512ffe94fd7"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.8/hypa-osx-arm64.tar.gz"
      sha256 "91c93e5228a924dcaf7cb08b3514942fdc3d6a2b37157fd5195e8ad89227c78c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.8/hypa-linux-x64.tar.gz"
      sha256 "2f335fe48219e12396529d9f6708ff9341a0e6832d66385f86c58c41fd811d06"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.8/hypa-linux-arm64.tar.gz"
      sha256 "82ae83ee01e6fce2e4506ab7aee071c15ea00673acc376ee1fae3d0fec84fb4b"
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
