{%- if page.comments %}
{%- set disqusjs_css_url = '//cdn.jsdelivr.net/npm/disqusjs@1/dist/disqusjs.css' %}
{%- if theme.vendors.disqusjs_css %}
  {%- set disqusjs_css_url = theme.vendors.disqusjs_css %}
{%- endif %}
<link rel="stylesheet" href="{{ disqusjs_css_url }}">

{%- set disqusjs_js_url = '//cdn.jsdelivr.net/npm/disqusjs@1/dist/disqus.js' %}
{%- if theme.vendors.disqusjs_js %}
  {%- set disqusjs_js_url = theme.vendors.disqusjs_js %}
{%- endif %}

<script>
  function initialDsq() {
    window.dsqjs = new DisqusJS({
      api: '{{ theme.disqusjs.api }}' || 'https://disqus.com/api/',
      apikey: '{{ theme.disqusjs.apikey }}',
      shortname: '{{ theme.disqusjs.shortname }}',
      url: {{ page.permalink | json }},
      identifier: {{ page.path | json }},
      title: '{{ page.title | addslashes }}',
    });
  }
  NexT.utils.getScript('{{ disqusjs_js_url }}', initialDsq, window.DisqusJS);
</script>
{%- endif %}
