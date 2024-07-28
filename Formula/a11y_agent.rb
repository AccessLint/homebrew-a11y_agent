class A11yAgent < Formula
  desc "AI agent that fixes accessibility issues"
  homepage "https://github.com/accesslint/a11y-agent"
  url "https://github.com/AccessLint/a11y-agent/releases/download/v0.0.4/a11y_agent-0.0.4.tar.xz"
  sha256 "d605b187d923dbd3f4ad0641f7243bf72593604bcd6a742588da97321093aa85"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec

    # Extract all files to libexec, which is a common Homebrew practice for third-party tools
    libexec.install Dir["*"]

    bin.install libexec/"bin/a11y_agent"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV.fetch("GEM_HOME"))
  end

  test do
    # Simple test to check the version or a help command
    system "#{bin}/a11y_agent", "--help"
  end
end
