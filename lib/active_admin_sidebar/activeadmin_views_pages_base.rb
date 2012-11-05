class ActiveAdmin::Views::Pages::Base < Arbre::HTML::Document

  def build_page_content
    build_flash_messages
    classes = Arbre::HTML::ClassList.new

    classes << 'without_sidebar' if skip_sidebar?
    classes << 'with_sidebar' unless skip_sidebar?
    classes << 'left_sidebar'  if left_sidebar?

    div :id => "active_admin_content", :class => classes do

      build_sidebar unless skip_sidebar? || right_sidebar?
      build_main_content_wrapper
      build_sidebar unless skip_sidebar? || left_sidebar?

    end
  end


  def left_sidebar?
    assigns[:sidebar_position] == :left
  end

  def right_sidebar?
     !left_sidebar?
  end



end