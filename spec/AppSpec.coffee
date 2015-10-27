assert = chai.assert
expect = chai.expect

describe 'App', ->
  app = null

  beforeEach ->
    app = new App()

  it 'should create a deck, and player, and dealer hands on initialization', ->
    expect(app.get('playerHand')).to.be.an.instanceof(Hand)
    expect(app.get('dealerHand')).to.be.an.instanceof(Hand)
    expect(app.get('deck')).to.be.an.instanceof(Deck)

  it 'should check scores when hands are dealt cards', ->
    sinon.spy(App.prototype, 'checkScore')
    app.get('playerHand').hit()
    expect(app.checkScore).to.have.been.called
    App.prototype.checkScore.restore()

  it 'should compare player and dealer scores when stand is called', ->
    sinon.spy(App.prototype, 'compareScore')
    app.get('dealerHand').stand()
    expect(app.compareScore).to.have.been.called
    App.prototype.compareScore.restore()
