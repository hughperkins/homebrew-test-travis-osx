class Deepcl < Formula
  desc "OpenCL library to train DCNNs; formula derived from Edward Geist's"
  homepage "https://github.com/hughperkins/DeepCL"
  url "https://github.com/hughperkins/DeepCL/archive/v8.1.3.tar.gz"
  sha256 "e0301ba5ae4464ae27a3ec2c777b77faa90b9ee6d1059b200f06a9100d182de1"

  depends_on "jpeg"

  resource "EasyCL" do
    url "https://github.com/hughperkins/EasyCL/archive/v3.0.0.tar.gz"
    sha256 "e38fa777b4ad22e0e48ba3c5ae55bb1ecb81958806207cdeefa78f9901012e3a"
  end

  resource "clBLAS" do
    url "https://github.com/hughperkins/clBLAS/archive/hughperkins_v2.8.1.tar.gz"
    sha256 "55a8e928de4005679c10c7998e766997db98aac85d55a1aecf78a61887a738ce"
  end

  resource "clew" do
    url "https://github.com/hughperkins/clew/archive/hughperkins_v1.0.0.tar.gz"
    sha256 "e93d0eb1ab6ecdd08b9e79ef5e39b4370518d51ae1d62f4f826b92e5b4909d07"
  end

  depends_on "cmake" => :build

  def install
    pwd = Pathname.pwd
    resource("EasyCL").stage pwd/"EasyCL"
    resource("clBLAS").stage pwd/"clMathLibraries/clBLAS"
    resource("clew").stage pwd/"EasyCL/thirdparty/clew"
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args
      system "make", "-j", "4"
      system "make", "install"
    end
    rm_rf lib/"cmake" # don't want this folder symlinked into /usr/local/lib
    rm Dir[bin/"*.{bat,sh,dat,exe}"] # don't want these symlinked into /usr/local/bin
  end

  test do
    system "#{bin}/deepcl_unittests", "tests=teststringhelper.*"
  end
end
