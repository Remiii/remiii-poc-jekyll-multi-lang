module Jekyll

  module I18nFilter
    def trans(input)
      config = @context.registers[:site].config
      lang = 'en'
      lang = config['lang']
      locales = @context.registers[:site].data['locales']
      locales[lang][input]
    end
  end

end

Liquid::Template.register_filter(Jekyll::I18nFilter)

