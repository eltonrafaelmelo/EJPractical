#
# Be sure to run `pod lib lint EJPractical.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "EJPractical"
  s.version          = "0.1.0"
  s.summary          = "Com EJPractical você consigirar criar UITextField com botões personalizados."
  s.description      = "Com EJPractical você consigirar criar UITextField com botões personalizados com a cor que preferir e com o nome de sua preferência."

  s.homepage         = "https://github.com/eltonrafaelmelo/EJPractical"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Elton Melo" => "elton.rafaelmelo@gmail.com" }
  s.source           = { :git => "https://github.com/eltonrafaelmelo/EJPractical.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'EJPractical' => ['Pod/Assets/*.png']
  }

end
