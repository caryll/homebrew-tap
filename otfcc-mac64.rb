# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OtfccMac64 < Formula
  desc "Parses & writes SFNT structures."
  homepage "https://github.com/caryll/otfcc/releases/"
  url "https://github.com/caryll/otfcc/archive/v0.3.1.tar.gz"
  version "0.3.2"
  sha256 "7c36b810cee3f0cf2e721c072722fcd88c85684a4be9916420327d58248fcfe3"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "./dep/bin-osx/premake5", "xcode4"
    system "xcodebuild",
              "-workspace", "build/xcode/otfcc.xcworkspace",
              "-scheme", "otfccbuild",
              "-configuration", "Release"
    system "xcodebuild",
              "-workspace", "build/xcode/otfcc.xcworkspace",
              "-scheme", "otfccdump",
              "-configuration", "Release"

    bin.install "bin/Release-x64/otfccbuild"
    bin.install "bin/Release-x64/otfccdump"
  end
end
