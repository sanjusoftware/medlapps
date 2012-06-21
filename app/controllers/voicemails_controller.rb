class VoicemailsController < ApplicationController

  def index
    @voicemails = Voicemail.all
  end

  def new
    @voicemail = Voicemail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @voicemail }
    end
  end


  def create
    @voicemail = Voicemail.new(params[:voicemail])

    respond_to do |format|
      if @voicemail.save
        format.html { redirect_to(voicemails_path, :notice => 'Voice mail was successfully created.') }
        format.json do
          render :status => :created, :json => {
            :id => @voicemail.id,
            #:bitly_url => @voicemail.bitly_url(request.protocol, request.host_with_port),
            :url => @voicemail.attachment.url,
            :attachment_file_name => @voicemail.attachment_file_name
          }
        end
      else
        format.html { render :action => 'new' }
        format.json { render :status => :unprocessable_entity, :json => {:errors => errors_to_array(@voicemail.errors)} }
      end
    end
  end

  def destroy
    @voicemail = Voicemail.find(params[:id])
    @voicemail.destroy

    respond_to do |format|
      format.html { redirect_to(voicemails_path, :notice => 'Voice mail was successfully deleted.') }
      format.xml { head :ok }
    end
  end
end