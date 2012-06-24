class Voicemail < ActiveRecord::Base

  has_attached_file :attachment,
                    storage: :s3,
                    s3_credentials: {
                      access_key_id: S3[:key],
                      secret_access_key: S3[:secret]
                    },
                    bucket: S3[:bucket],
                    url: ':s3_southeast_url',
                    path: ':attachment/:id/:style.:extension'


  validates_attachment_presence :attachment

  def bitly_url
    Bitly.use_api_version_3
    bitly = Bitly.new(BITLY[:login], BITLY[:api_key])
    attachment_bitly = bitly.shorten(self.attachment.url)
    attachment_bitly.short_url
  end
end