# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def display_flash
    html = ''
    if flash[:notice] or flash[:warning] or flash[:error]
      html = "<script type=\"text/javascript\">\n$(document).ready(function() {\n"
      flash.each do |key,value|
        if !value.blank?
          html = "#{html}$.gritter.add({ \ntitle: \"#{key.to_s.capitalize}\", \ntext: \"#{value}\", \nimage: \"/images/icons/#{key.to_s}.png\", \ntime: 3000 \n});\n"
        end
      end
      html = "#{html}});\n</script>"
    end
  end
  
  def build_button(name, class_name, form)
    if request.env['HTTP_USER_AGENT'].include?('MSIE 6')
      if form
        return form.submit(name)
      else
        return submit_tag(name)
      end
    else
      return "<button class='#{class_name}'><span>#{name}</span></button>"
    end
  end
  
end
