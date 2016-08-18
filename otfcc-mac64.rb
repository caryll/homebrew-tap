# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OtfccMac64 < Formula
  desc "Parses & writes SFNT structures."
  homepage "https://github.com/caryll/otfcc/releases/"
  url "https://github.com/caryll/otfcc/archive/v0.3.1.tar.gz"
  version "0.3.1"
  sha256 "a0ea7619094f58a2350c149042370e2ad7dfae945e4acb53a8ac1f98b5a8dd00"

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
