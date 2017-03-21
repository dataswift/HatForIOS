#
#  Be sure to run `pod spec lint HAT-API-for-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "HAT-API-for-iOS"
  s.version      = "0.0.1"
  s.summary      = “The API to connect and exchange data with the HAT”
  s.description  = “Contains the basic tools to connect and talk to HAT”
  s.homepage     = "https://github.com/whiteshadow-gr/HAT-API-for-iOS"

  s.license      = “MPL 2.0”
  # s.license      = { :type => "MPL 2.0", :file => "FILE_LICENSE" }

  s.author             = { “Marios Andreas Tsekis“ => “tsekis.marios@gmail.com” }
  s.platform     = :ios, “9.0”

  s.source = { :git => "https://github.com/whiteshadow-gr/HAT-API-for-iOS", :tag => "#{s.version}" }

    s.dependency 'Alamofire'
    s.dependency 'SwiftyJSON'
    s.dependency 'JWTDecode'
    s.dependency 'SwiftyRSA'
    s.dependency 'Mockingjay'

end
