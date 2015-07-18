assert = chai.assert

describe "card", ->
  deck = null
  card = null

  beforeEach ->
    deck = new Deck()
    card = deck.pop()
    console.log(card)

  it "should change revealed value when flipped", ->
    assert.strictEqual card.attributes.revealed, true
    assert.strictEqual card.flip().attributes.revealed, false
