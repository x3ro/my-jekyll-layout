module Jekyll
  class GoogleAnalyticsTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      site = context.registers[:site]
      return "" if !site.config['google_analytics']['enable']
      account = site.config['google_analytics']['account']
      domain = site.config['google_analytics']['domain']

      <<-eof
        <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

          ga('create', '#{account}', '#{domain}');
          ga('send', 'pageview');
        </script>
      eof
    end
  end
end

Liquid::Template.register_tag('google_analytics', Jekyll::GoogleAnalyticsTag)
