#
#  Be sure to run `pod spec lint HAT-API-for-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  	s.name         = "HatForIOS"
  	s.version      = "0.0.1"
  	s.summary      = "The API to connect & exchange data with the HAT"
	s.description  = "Contains the basic tools to connect and talk to HAT"
  	s.homepage     = "https://github.com/whiteshadow-gr/HatForIOS"

  	s.license      = "MPL 2.0"

  	s.author       = { "Marios Andreas Tsekis" => "tsekis.marios@gmail.com" }
  	s.platform     = :ios, "9.0"
	
  	s.source = { :git => "https://github.com/whiteshadow-gr/HatForIOS.git", :tag => "#{s.version}" }
  	#s.source_files = "HAT/**/*.{h,swift}"
	
	s.dependency 'Alamofire'
    s.dependency 'SwiftyJSON'
    s.dependency 'JWTDecode'
    s.dependency 'SwiftyRSA'
    s.dependency 'Mockingjay'

end
