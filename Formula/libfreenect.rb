class Libfreenect < Formula
  desc "Drivers and libraries for the Xbox Kinect device"
  homepage "https://openkinect.org/"
  url "https://github.com/OpenKinect/libfreenect/archive/v0.6.0.tar.gz"
  sha256 "5300f29d9fb8bb466efbc34c01f0045ed0f616278907e507ccd8c2afdea331c8"
  head "https://github.com/OpenKinect/libfreenect.git"

  bottle do
    cellar :any
    sha256 "9ed7f53cb3c825aeccfe1b86c4ca4e21dbae3f1625455d5d224394c2058827b5" => :catalina
    sha256 "fd159c9c9d104d79294673780a0a4086d58edb7fe53c33a6ec0f9daa94ef5495" => :mojave
    sha256 "1785eb110c7b3144bf80ad66e83125f4631655792134b673ca64a551cc31fc12" => :high_sierra
    sha256 "dcfd6d414d14d98f292e60d9a7000d479ce4562f83d34745ac63841bd9b40d2c" => :sierra
    sha256 "75f6dfd0a873c4268bc766f4fdc7607fb456118e164a0fdb45f37179adb768b8" => :el_capitan
  end

  depends_on "cmake" => :build
  depends_on "libusb"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args,
                      "-DBUILD_OPENNI2_DRIVER=ON"
      system "make", "install"
    end
  end

  test do
    system bin/"fakenect-record", "-h"
  end
end
