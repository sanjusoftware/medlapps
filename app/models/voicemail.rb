class Voicemail < ActiveRecord::Base
  has_attached_file :attachment, { :url => "/uploads/voicemails/:hash.:extension", :hash_secret => "zF3$Vo~Zog.8j+NcN~s#02@kyh?eo:GB-)C46{MVQ,`39eylH(MB@/0TDRBR_A#t" }
  validates_attachment_presence :attachment
  
  
  # Shorten the URL
  def bitly_url(protocol, host)
    Bitly.use_api_version_3
    bitly = Bitly.new('medl', 'R_d3a36f75b18038563769f1c93cc1d099')
    attachment_bitly = bitly.shorten(protocol + host + self.attachment.url)
    attachment_bitly.short_url
  end
end