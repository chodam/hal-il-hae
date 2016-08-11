CarrierWave.configure do |config|

config.fog_credentials = {

provider: 'AWS',

aws_access_key_id: 'AWS_ACCESS_KEY_ID',

aws_secret_access_key: 'AWS_SECRET_ACCESS_KEY',

region: 'ap-northeast-2',

endpoint: 'http://s3.ap-northeast-2.amazonaws.com'

}

config.fog_directory = 'boardpic'

config.fog_public = false

config.fog_attributes = {} # optional, defaults to {}

end