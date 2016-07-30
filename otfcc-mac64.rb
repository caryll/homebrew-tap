# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OtfccMac64 < Formula
  desc "Parses & writes SFNT structures."
  homepage "https://github.com/caryll/otfcc/releases/"
  url "https://github.com/caryll/otfcc/releases/download/v0.2.4/otfcc-mac64-0.2.4.tar.xz"
  version "0.2.4"
  sha256 "d57ca35ab7e35d7fa67b157b8823fde082f08f14c4a4dbdb3e228df2235fbfa0"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    bin.install "otfccbuild"
    bin.install "otfccdump"
  end
end
