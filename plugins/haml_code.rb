require "coderay"

module Haml::Filters::HamlCode
  include Haml::Filters::Base

  def render(text)
    split_text = text.split("\n")
    if split_text.first =~ /lang:/
      language = split_text.shift.strip.split(/lang: */).last
      text = split_text.join("\n")
    else
      language = "ruby"
    end

    highlighter.new.highlight(text, language)
  end

  private

  def highlighter
    @highlighter ||= Class.new do
      def highlight(text, language)
        CodeRay.scan(text, language.to_sym).div
      end
    end
  end
end
