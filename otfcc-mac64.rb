# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OtfccMac64 < Formula
  desc "Parses & writes SFNT structures."
  homepage "https://github.com/caryll/otfcc/releases/"
  url "https://github.com/caryll/otfcc/archive/v0.8.6.tar.gz"
  version "0.8.6"
  sha256 "ad2196725810c05cff67cc891ba642c301e4c2615748046f7541d8fc9728574d"

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
