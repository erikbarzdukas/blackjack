class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove flip change reset', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    if @collection.isDealer
      @$('.score').text @collection.scores()[1]
      # if @collection.scores()[1] > 21
      #   if !alert "Dealer Busted!"
      #     @collection.busted()
    else
      @$('.score').text @collection.scores()[0] + '/' + @collection.scores()[1]
      # if @collection.scores()[0] > 21
      #   if !alert "You Busted!"
      #     @collection.busted()


