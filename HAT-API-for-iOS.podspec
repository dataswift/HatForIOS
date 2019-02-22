#
#  Be sure to run `pod spec lint HAT-API-for-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = 'HAT-API-for-iOS'
  spec.version      = '0.0.7'
  spec.summary      = 'The API to connect & exchange data with the HAT'

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = 'Contains the basic tools to connect and talk to HAT'

  spec.homepage     = 'https://github.com/Hub-of-all-Things/HatForIOS'
  # spec.screenshots  = `www.example.com/screenshots_1.gif`, `www.example.com/screenshots_2.gif`


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  spec.license      = { :type => 'MPL 2.0' }
  # spec.license      = { :type => `MIT`, :file => `FILE_LICENSE` }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  spec.author               = 'whiteshadow-gr'
  # Or just: spec.author    = `whiteshadow-gr`
  # spec.authors            = { `whiteshadow-gr` => `marios4th@yahoo.gr` }
  # spec.social_media_url   = `https://twitter.com/whiteshadow-gr`

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # spec.platform     = :ios
   spec.platform = :ios, '10.0'

  #  When using multiple platforms
  # spec.ios.deployment_target = `5.0`
  # spec.osx.deployment_target = `10.7`
  # spec.watchos.deployment_target = `2.0`
  # spec.tvos.deployment_target = `9.0`


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source = { :git => 'https://github.com/Hub-of-all-Things/HatForIOS.git', :tag => '0.0.7' }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  spec.source_files  = 'HAT/**/*.{swift}'
  spec.exclude_files = 'HAT/Pods'

  # spec.public_header_files = `Classes/**/*.h`


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = `icon.png`
  # spec.resources = `Resources/*.png`

  # spec.preserve_paths = `FilesToSave`, `MoreFilesToSave`


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.frameworks = `SomeFramework`, `AnotherFramework`
  # spec.library = 'Mockingjay'
  # spec.libraries = `iconv`, `xml2`


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)' }
  spec.dependency 'SwiftyJSON'
  spec.dependency 'Alamofire'
  spec.dependency 'JWTDecode'
  spec.dependency 'SwiftyRSA'
  spec.dependency 'SwiftLint', '0.21.0'

  spec.test_spec do |test_spec|

    test_spec.requires_app_host = false
    test_spec.source_files = 'HATTests/**/*.{swift}', 'HATTests/*.{swift}', 'HAT/**/*.{swift}'

    test_spec.frameworks = 'HAT'
    test_spec.dependency 'SwiftyJSON'
    test_spec.dependency 'Alamofire'
    test_spec.dependency 'JWTDecode'
    test_spec.dependency 'SwiftyRSA'
    test_spec.dependency 'SwiftLint', '0.21.0'
    test_spec.dependency 'Mockingjay'
    test_spec.dependency 'URITemplate'

    test_spec.library = 'XCTest'
  end

end
