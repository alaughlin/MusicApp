module ApplicationHelper
  def auth_token
    <<-HTML.html_safe
      <input type="hidden"
          name="authenticity_token"
          value="#{form_authenticity_token}">
    HTML
  end

  def ugly_lyrics(lyrics)
    res = lyrics.split("\r\n").map { |line| "♫ #{h(line)}" }.join("\n")
    "<pre>#{res}</pre>".html_safe
  end

  def print_errors
    if flash[:errors]
      flash[:errors].each do |error|
        puts error
      end
    end
  end
end
