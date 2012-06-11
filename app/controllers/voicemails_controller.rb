class VoicemailsController < ApplicationController
  def create
    @voicemail = Voicemail.new(params[:voicemail])
    
    respond_to do |format|
      if @voicemail.save
        format.json do 
          render :status => :created, :json => {
            :id => @voicemail.id,
            :bitly_url => @voicemail.bitly_url(request.protocol, request.host_with_port),
            :url => request.protocol + request.host_with_port + @voicemail.attachment.url,
            :attachment_file_name => @voicemail.attachment_file_name
          }
        end
      else
        format.json { render :status => :unprocessable_entity, :json => { :errors => errors_to_array(@voicemail.errors) } }
      end
    end
  end
end