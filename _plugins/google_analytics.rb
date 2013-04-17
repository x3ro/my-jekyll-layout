module Jekyll
  class GoogleAnalyticsTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      #require 'ripl'
      #Ripl.start :binding => binding
      return "" if !Jekyll.configuration({})['google_analytics']['enable']
      account = Jekyll.configuration({})['google_analytics']['account']

      <<-eof
        <script>
            var _gaq=[['_setAccount','#{account}'],['_trackPageview']];
            (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
        </script>
      eof
    end
  end
end

Liquid::Template.register_tag('google_analytics', Jekyll::GoogleAnalyticsTag)
