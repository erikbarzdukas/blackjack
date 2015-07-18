# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get 'playerHand' 
      .on 'stand', =>
        console.log @get "dealerHand"
        @get 'dealerHand' 
        .at(0)
        .flip()
        while @get 'dealerHand'
        .scores()[1] < 17
          @get 'dealerHand'
            .hit()
        # if ! @get 'dealerHand'
        # .scores()[1] > 21
        @declareWinner()

    @get 'playerHand'
    .on 'busted', =>
      @declareWinner()

  declareWinner : =>
    dealerScore = @get 'dealerHand'
    .scores()[1]

    playerScore = @get 'playerHand'
    .scores()

    if playerScore[1] <= 21
      playerScore = playerScore[1]
    else 
      playerScore = playerScore[0]

    if playerScore > 21
      $('#result').text "You Busted! - Dealer wins!"
    else if dealerScore > 21
      $('#result').text "Dealer busted - You win!"

    else if dealerScore == playerScore
      $('#result').text "Tie Game!"
    else if dealerScore > playerScore
      $('#result').text "Dealer Won!"
    else
      $('#result').text "You Win!"

  playAgain: =>
    @get('dealerHand').reset()
    @get('playerHand').reset()

    if @get('deck').length < 16
      @set 'deck', deck = new Deck()
    else deck = @get('deck')

    newPlayerHand = deck.dealPlayerAgain()

    @get('playerHand').add(newPlayerHand[0])
    @get('playerHand').add(newPlayerHand[1])

    newDealerHand = deck.dealDealerAgain()
    @get('dealerHand').add(newDealerHand[0])
    @get('dealerHand').add(newDealerHand[1])

    $('#result').text('')


