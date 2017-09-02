module ActiveAdminSidebar
  module Positions
    
    def left_sidebar!
       @sidebar_options = { position: :left }
    end
    
    def left_sidebar_collapse!
      @sidebar_options = { position: :left }
      collapsed_sidebar
      @sidebar_options.merge!(
        is_collapsed: session[:collapsed_sidebar],
        collapsed: true
      )
    end

    def right_sidebar!
      @sidebar_options = { position: :right }
    end
    
    def right_sidebar_collapsed!
      @sidebar_options = { position: :right }
      collapsed_sidebar
      @sidebar_options.merge!(
        is_collapsed: session[:collapsed_sidebar],
        collapsed: true
      )
    end

    def collapsed_sidebar
      if request.xhr?
        if params[:collapsed_sidebar].present?
          collapsed = params[:collapsed_sidebar].to_s == 'true'
          session[:collapsed_sidebar] = collapsed
          render json: { collapsed_sidebar: collapsed } and return
        end
      end
    end

  end
end
