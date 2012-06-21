class Voicemail < ActiveRecord::Base

  has_attached_file :attachment,
                    storage: :s3,
                    s3_credentials: {
                      access_key_id: S3[:key],
                      secret_access_key: S3[:secret]
                    },
                    bucket: S3[:bucket],
                    url: ':s3_southeast_url',
                    path: ":attachment/:id/:style.:extension"


  validates_attachment_presence :attachment


  # Shorten the URL
  def bitly_url(protocol, host)
    Bitly.use_api_version_3
    bitly = Bitly.new('medl', 'R_d3a36f75b18038563769f1c93cc1d099')
    attachment_bitly = bitly.shorten(protocol + host + self.attachment.url)
    attachment_bitly.short_url
  end
end