assert = chai.assert

describe "App View", ->
  app = null
  appView = null

  beforeEach ->
    app = new window.App()
    appView = new window.AppView model:app 
    console.log app.get 'playerHand' 


  it 'should display player and dealer hands', ->
    assert $('.player-hand-container'), true
    assert $('.dealer-hand-container'), true

  it 'should have hit and stand buttons', ->
    assert $('.hit-button'), true
    assert $('.stand-button'), true

  it 'should add card to player hand on hit button click', ->
    appView.model.get 'playerHand' 
    .hit()
    assert appView.model.get('playerHand').length, 3

  it 'should move to dealer on stand', ->
    appView.model.get 'playerHand' 
    .stand()
    assert appView.model.get('dealerHand').models[0].attributes.revealed, true