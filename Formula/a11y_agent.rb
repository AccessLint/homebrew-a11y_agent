class A11yAgent < Formula
  desc "AI agent that fixes accessibility issues"
  homepage "https://github.com/accesslint/a11y-agent"
  url "https://github.com/AccessLint/a11y-agent/releases/download/v0.0.8/a11y_agent-0.0.8.tar.xz"
  sha256 "03f70ebf3c80a43f553e882abf199ff8008fdf8277a2858eb007fe08d4a7b0d4"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec

    # Extract all files to libexec, which is a common Homebrew practice for third-party tools
    libexec.install Dir["*"]

    bin.install libexec/"exe/a11y_agent"
    bin.env_script_all_files(libexec/"exe", GEM_HOME: ENV.fetch("GEM_HOME", nil))
  end

  test do
    # Simple test to check the version or a help command
    system "#{bin}/a11y_agent", "--help"
  end
end
