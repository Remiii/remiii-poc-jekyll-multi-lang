module Jekyll

  class HerissonConverter < Converter

    safe true
    priority :highest

    def initialize(config)
      Dir.glob('**/*.herisson').each do |i|
        urlLine = File.open( i, 'r').find { |line| line =~ /^herisson_url: *([\d\w\.\/\'\"]+)$/ }
        if urlLine.class == String
          urlLineSplit = urlLine.split(': ')
          url = urlLineSplit[1].gsub(/\s|"|'/, '')
          dir = config['data_source']
          filePath = File.join(dir, 'locales.yml')
          locales = SafeYAML.load_file(filePath)
          lang = config['lang']
          print locales
          permalinkLineNew = 'permalink: ' + locales[lang][url]
          permalinkLine = File.open( i, 'r').find { |line| line =~ /^permalink: *([\d\w\.\/\'\"\-]+)$/ }
          if permalinkLine.class == String
            mytext = File.read(i)
            File.open( i, 'w') { |file| file.puts mytext.gsub(/^permalink: *([\d\w\.\/\'\"\-]+)$/, permalinkLineNew)}
          end
        end
      end
    end

    def matches(ext)
      ext =~ /^\.herisson$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      content
    end

  end

end

