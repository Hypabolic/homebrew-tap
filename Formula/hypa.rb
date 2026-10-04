class Hypa < Formula
  desc "Local context runtime and terminal multiplexer for coding agents"
  homepage "https://github.com/Hypabolic/Hypa"
  version "1.0.5"
  license "FSL-1.1-ALv2"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.5/hypa-osx-x64.tar.gz"
      sha256 "8522a75945494288bc7e380dfb75febd70f962379c9850373df1e74857d824d7"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.5/hypa-osx-arm64.tar.gz"
      sha256 "dcaf6c10769d2e600bdd47bfe218cb74e1454a5515fa9e181ea4639fbf07bc3e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.5/hypa-linux-x64.tar.gz"
      sha256 "8cad6b4592ba57b288bf3791fadc362ad1c52408613651c98dd3d5439e6a28ef"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.5/hypa-linux-arm64.tar.gz"
      sha256 "5dacc2a84afbf25c2904d643fa203bba5389ad2e1e3790357527071b8ad9bbc2"
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
