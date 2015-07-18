class window.AppView extends Backbone.View
  template: _.template '
    <h1 class="title">Blackjack</h1>
    <button class="hit-button button">Hit</button> <button class="stand-button button">Stand</button><button class="play-again button">Play Again</button><div id="result"></div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  className: 'game-container'

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .play-again': -> @model.playAgain()
    'change': -> @render()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

