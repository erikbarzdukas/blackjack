assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null
  dealer = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    dealer = deck.dealDealer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  #Should instantiate new Hand for player
  describe 'dealPlayer', ->
    it 'should instantiate a new hand for player', ->
      assert.strictEqual hand.constructor, Hand

    it 'should deal two cards', ->
      assert.strictEqual hand.length, 2

    #Hand should all be face up
    it 'should deal cards face up', ->
      _.each hand.models, (card, index, collection) ->
        assert.strictEqual card.attributes.revealed, true

  #Should instantiate new Hand for Dealer
  describe 'dealDealer', ->
    it 'should instantiate a new hand for dealer', ->
      assert.strictEqual dealer.constructor, Hand

    it 'should deal two cards', ->
      assert.strictEqual dealer.length, 2

    #First card should be face down
    it 'should deal first card face down and second face up', ->
      assert.strictEqual dealer.models[0].attributes.revealed, false
      assert.strictEqual dealer.models[1].attributes.revealed, true




