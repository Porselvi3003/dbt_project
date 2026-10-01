{%- set fruits = ['apple', 'oranges', 'fig'] -%}
{%- for i in fruits -%}
    {% if i != 'apple' %}
        {{ i }}
    {% else %}
        I hate {{ i }}
    {% endif %}
{%- endfor %}