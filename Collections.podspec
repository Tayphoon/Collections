#
# Be sure to run `pod lib lint Collections.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Collections"
  s.version          = "0.1.1"
  s.summary          = "Collections a set of classes designed to work with collections."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "Collections include classes to work with UITableView, CollectionView and models for it."

  s.homepage         = "https://github.com/Tayphoon/Collections"
  s.license          = 'MIT'
  s.author           = { "Tayphoon" => "tayphoon.company@gmail.com" }
  s.source           = { :git => "https://github.com/Tayphoon/Collections.git", :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.requires_arc = true

  s.default_subspecs = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'Collections/CollectionConstants.swift', 'Collections/Core/**/*.{h,swift}'

    core.frameworks = 'UIKit'
  end

  s.subspec 'CoreData' do |cdos|
    cdos.public_header_files = 'Collections/CoreData/**/*.{h}'
    cdos.source_files = 'Collections/CoreData/**/*.{h,swift}'

    cdos.dependency 'Collections/Core'
    cdos.frameworks = 'CoreData'
  end

end
