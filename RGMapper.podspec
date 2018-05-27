Pod::Spec.new do |spec|
  spec.name         =  'RGMapper'
  spec.version      =  '2.1'
  spec.summary   =  'RGMapper - it safely maps json to custom types!'
  spec.author = {
    'Ritesh Gupta' => 'rg.riteshh@gmail.com'
  }
  spec.license          =  'MIT' 
  spec.homepage         =  'https://github.com/riteshhgupta/RGMapper'
  spec.source = {
    :git => 'https://github.com/riteshhgupta/RGMapper.git',
    :tag => '2.1'
  }
  spec.ios.deployment_target = "9.0"
  spec.source_files =  'Source/*.{swift}'
  spec.requires_arc =  true
end
