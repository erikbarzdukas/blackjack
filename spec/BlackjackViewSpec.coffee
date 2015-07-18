assert = chai.assert

describe "App View", ->
  app = null

  beforeEach ->
    app = new window.App()

  it 'should display player and dealer hands', ->
    assert $('.player-hand-container'), true
    assert $('.dealer-hand-container'), true

  it 'should have hit and stand buttons', ->
    assert $('.hit-button'), true
    assert $('.stand-button'), true

  it 'should add card to player hand on hit button click', ->
    $('.hit-button').trigger 'click'
    console.log $('.player-hand-container') 
    assert $('.player-hand-container .card').length, 3