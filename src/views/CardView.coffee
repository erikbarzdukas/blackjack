class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<% if(revealed){ %><img src ="img/cards/<%= rankName %>-<%= suitName %>.png"><%}else{%><img src ="img/card-back.png"> <% } %>'
  # _.template '<img if(revealed) '
  #<% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

