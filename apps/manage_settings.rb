require_relative "./_base"

module Scriptum
  class ManageSettings < AdminApp

    set :views, ["views/manage_settings", "views/admin"]

    get "/" do
      @page_title = "Settings"
      erb :index
    end

    put "/" do
      @page_title = "Settings"
      if @settings.update_attributes(params[:setting])
        flash[:success] = "Settings saved"
        redirect to("/")
      else
        erb :index
      end
    end
  end
end
