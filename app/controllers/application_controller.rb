class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "hello, world!"
  end

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    if I18n.locale = I18n.available_locales.include
    elsif locale
      I18n.default_locale
    end
  end
  before_action :st_locale
  def st_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
