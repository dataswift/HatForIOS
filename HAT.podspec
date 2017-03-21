Pod::Spec.new do |spec|

    spec.name = "HAT"
    spec.version = "0.1"
    spec.summary = "A library containing the functionality to connect and exchange data with the HAT"
    spec.license = { type: 'MPL2', file: 'LICENSE' }

    spec.platform = :ios, "9.0"
    spec.requires_arc = true
    spec.source = { git: "https://github.com/jakecraige/RGB.git", tag: "v#{spec.version}", submodules: true }
    spec.source_files = "RGB/**/*.{h,swift}"

    spec.dependency 'Alamofire'
    spec.dependency 'SwiftyJSON'
    spec.dependency 'JWTDecode'
    spec.dependency 'SwiftyRSA'
    spec.dependency 'Mockingjay'


end
