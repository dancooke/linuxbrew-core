require "language/node"

class Whistle < Formula
  desc "HTTP, HTTP2, HTTPS, Websocket debugging proxy"
  homepage "https://github.com/avwo/whistle"
  url "https://registry.npmjs.org/whistle/-/whistle-2.5.16.tgz"
  sha256 "303feeac4a7b4ed4824402ac707b97a18d18a69b442da6950f28abcdabcb766b"
  license "MIT"

  bottle do
    cellar :any_skip_relocation
    sha256 "fe2d2bfa768b8a00124b840be112d325ad4ad5782dd7ad79ae5392aef9f10a01" => :catalina
    sha256 "013a5a0473967bf71d93a26e37aa29f8b2fef8ed7795b05df480ce4b6a7992dc" => :mojave
    sha256 "0d06717a566c9387b1f1809bfbf0c72d033c14e755c23545bc8336b1a33cfc2b" => :high_sierra
    sha256 "c1ca0e36e21bd90fcfc739c84c7c2a9fb17484dae3c198abeb3e806df78d9a8d" => :x86_64_linux
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"package.json").write('{"name": "test"}')
    system bin/"whistle", "start"
    system bin/"whistle", "stop"
  end
end
